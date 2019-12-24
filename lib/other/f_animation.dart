import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations/animation_progress.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';
import 'package:simple_animations/simple_animations/rendering.dart';

class FAnimation extends StatefulWidget {
  @override
  _FAnimationState createState() => _FAnimationState();
}

class _FAnimationState extends State<FAnimation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _F(),
    );
  }
}

class _TileModel {
  Animatable tween;
  AnimationProgress animationProgress;
  final math.Random random;
  final Offset pos;
  final Color color;
  final double p;

  _TileModel(this.random, this.pos, {this.color = Colors.black, this.p = 0.0}) {
    restart();
  }

  restart({Duration time = Duration.zero}) {
    final duration = Duration(
      milliseconds: 3000,
    );

    tween = MultiTrackTween([
      Track("size")
          .add(duration, Tween(begin: 0, end: 1), curve: Curves.linear),
    ]);
    animationProgress = AnimationProgress(duration: duration, startTime: time);
  }

  maintainRestart(Duration time) {
    if (animationProgress.progress(time) == 1.0) {
      restart(time: time);
    }
  }

  void draw(Canvas canvas, Duration time, Size size) {
    double s = size.width / 7;
    var progress = animationProgress.progress(time);
    final animation = tween.transform(progress);
    final x = animation['size'];
    double y = (0.025 * math.cos(2 * math.pi * (x - p)) + 0.975);
    double alpha = (-0.2 * math.cos(2 * math.pi * (x - p)) + 0.8);
    Paint paint = Paint();
    paint.color = this.color.withOpacity(alpha);

    Rect r = Rect.fromCenter(
      center: Offset(
        pos.dx * s + s / 2,
        pos.dy * s + s / 2,
      ),
      width: s, //s * y,
      height: s, //s * y,
    );

    canvas.drawRect(r, paint);
  }
}

class _FPainter extends CustomPainter {
  List<_TileModel> _tiles;
  Duration time;

  _FPainter(this._tiles, this.time);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height),
        Paint()..color = Colors.white);
    _tiles.forEach((particle) {
      particle.draw(canvas, time, size);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _F extends StatefulWidget {
  @override
  _FState createState() => _FState();
}

class _FState extends State<_F> {
  final math.Random random = math.Random();

  List<_TileModel> _tiles = [];

  @override
  void initState() {
    _tiles.addAll([
      _TileModel(random, Offset(1, 1)),
      _TileModel(random, Offset(2, 1), p: 0.05),
      _TileModel(random, Offset(3, 1), p: 0.1),
      _TileModel(random, Offset(4, 1), p: 0.15),
      _TileModel(random, Offset(5, 1), p: 0.2),
      _TileModel(random, Offset(1, 2), p: 0.05),
      _TileModel(random, Offset(1, 3), p: 0.1),
      _TileModel(random, Offset(1, 4), p: 0.15),
      _TileModel(random, Offset(1, 5), p: 0.2),
      _TileModel(random, Offset(2, 3), p: 0.15),
      _TileModel(random, Offset(3, 3), p: 0.2),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Rendering(
      startTime: Duration(seconds: 30),
      onTick: _simulateParticles,
      builder: (context, time) {
        return CustomPaint(
          painter: _FPainter(_tiles, time),
        );
      },
    );
  }

  _simulateParticles(Duration time) {
    _tiles.forEach((particle) => particle.maintainRestart(time));
  }
}
