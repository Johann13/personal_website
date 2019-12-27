import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations/animation_progress.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';
import 'package:simple_animations/simple_animations/rendering.dart';

class BackgroundAnimation extends StatefulWidget {
  @override
  _BackgroundAnimationState createState() => _BackgroundAnimationState();
}

class _BackgroundAnimationState extends State<BackgroundAnimation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Particles(),
    );
  }
}

class ParticleModel {
  final String text;
  Animatable tween;
  double size;
  AnimationProgress animationProgress;
  Random random;
  Rect rect;
  Offset diff;
  Color color;
  Offset startPosition;
  Offset endPosition;
  bool canDrawText;

  ParticleModel(this.random, this.text, this.color) {
    restart();
  }

  restart({Duration time = Duration.zero}) {
    int i = random.nextInt(4);
    canDrawText = random.nextBool();
    double y = -0.2 + 1.4 * random.nextDouble();
    double x = 0.025 + 0.1 * random.nextDouble();
    switch (i) {
      case 0:
        startPosition = Offset(1.2, y);
        endPosition = Offset(-0.2, y);
        break;
      case 1:
        startPosition = Offset(-0.2, y);
        endPosition = Offset(1.2, y);
        break;
      case 2:
        startPosition = Offset(x, -0.2);
        endPosition = Offset(x, 1.2);
        break;
      default:
        startPosition = Offset(1 - x, 1.2);
        endPosition = Offset(1 - x, -0.2);
        break;
    }

    final duration = Duration(
      milliseconds: 8000 + random.nextInt(4000),
    );

    tween = MultiTrackTween([
      Track("x").add(
          duration, Tween(begin: startPosition.dx, end: endPosition.dx),
          curve: Curves.easeInOutSine),
      Track("y").add(
          duration, Tween(begin: startPosition.dy, end: endPosition.dy),
          curve: Curves.easeIn),
      Track('opacity').add(duration, Tween(begin: 0, end: 1)),
    ]);
    animationProgress = AnimationProgress(duration: duration, startTime: time);
    size = 0.2 + random.nextDouble() * 0.4;
  }

  maintainRestart(Duration time) {
    if (animationProgress.progress(time) == 1.0) {
      restart(time: time);
    }
  }

  void drawText(Canvas canvas, Duration time, Size size) {
    if (!canDrawText) {
      return;
    }
    var progress = animationProgress.progress(time);
    final animation = tween.transform(progress);
    final x = animation['opacity'];
    double opacity = -(3 * (x * x)) + 3 * x;
    final Offset position =
        Offset(animation["x"] * size.width, animation["y"] * size.height);
    final textStyle = ui.TextStyle(
      color: color.withOpacity(opacity),
      fontSize: 30,
    );
    final paragraphStyle = ui.ParagraphStyle(
      textDirection: TextDirection.ltr,
    );
    final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
      ..pushStyle(textStyle)
      ..addText(text);
    final constraints = ui.ParagraphConstraints(width: 300);
    final paragraph = paragraphBuilder.build();
    paragraph.layout(constraints);
    canvas.drawParagraph(paragraph, position);
  }

  void drawLine(Canvas canvas, Duration time, Size size) {
    if (canDrawText) {
      return;
    }
    var progress = animationProgress.progress(time);
    final animation = tween.transform(progress);
    final x = animation['opacity'];
    double opacity = -(3 * (x * x)) + 3 * x;
    Paint paint = Paint()..color = this.color.withOpacity(opacity);
    paint.strokeWidth = 2.0;
    canvas.drawLine(startPosition, endPosition, paint);
    canvas.drawRect(
        Rect.fromPoints(
          Offset(
            startPosition.dx * size.width,
            startPosition.dy * size.height,
          ),
          Offset(
                endPosition.dx * size.width,
                endPosition.dy * size.height,
              ) +
              Offset(2, 2),
        ),
        paint);
  }

  void draw(Canvas canvas, Duration time, Size size) {
    drawText(canvas, time, size);
    drawLine(canvas, time, size);
  }
}

class ParticlePainter extends CustomPainter {
  List<ParticleModel> particles;
  Duration time;

  ParticlePainter(this.particles, this.time);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height),
        Paint()..color = Colors.grey[850]);
    particles.forEach((particle) {
      particle.draw(canvas, time, size);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class Particles extends StatefulWidget {
  @override
  _ParticlesState createState() => _ParticlesState();
}

class _ParticlesState extends State<Particles> {
  final Random random = Random();

  List<ParticleModel> particles = [];

  @override
  void initState() {
    particles.addAll([
      ParticleModel(random, 'Flutter', Color(0xFF30B9F6)),
      ParticleModel(random, 'Firebase', Color(0xFFFFCB2B)),
      ParticleModel(random, 'Dart', Color(0xFF2CB7F6)),
      ParticleModel(random, 'Python', Color(0xff336D9C)),
      ParticleModel(random, 'Typescript', Color(0xFF284D7E)),
      ParticleModel(random, 'Javascript', Color(0xFFF9D01C)),
      ParticleModel(random, 'Java', Color(0xFFF58219)),
      ParticleModel(random, 'Angular', Color(0xFFDD0031)),
      ParticleModel(random, 'Android', Color(0xFF3CDA83)),
    ]);
    particles.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Rendering(
      startTime: Duration(seconds: 30),
      onTick: _simulateParticles,
      builder: (context, time) {
        return CustomPaint(
          painter: ParticlePainter(particles, time),
        );
      },
    );
  }

  _simulateParticles(Duration time) {
    particles.forEach((particle) => particle.maintainRestart(time));
  }
}
