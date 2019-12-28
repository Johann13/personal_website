import 'dart:async';
import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_async_builder/builder/simple_future_builder.dart';
import 'package:flutter_web_util/flutter_web_util.dart';
import 'package:personal_website/app_localizations.dart';
import 'package:personal_website/other/image_provider.dart';
import 'package:personal_website/other/markdown_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 1.0),
            child: _RespText(),
          ),
        ),
        ResponsiveWidget(
          desktop: (_) {
            return Container(
              width: 200,
              child: _Image(),
            );
          },
          mobile: (_) {
            return Container(
              width: 150,
              child: _Image(),
            );
          },
        ),
      ],
    );
  }

  String get lang => html.window.navigator.language;
}

class _RespText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktop: (_) => _Text(),
      mobile: (_) => _Text(
        fontSize: 16,
        space: 8,
      ),
    );
  }
}

class _Text extends StatelessWidget {
  final double fontSize;
  final double space;

  const _Text({Key key, this.fontSize = 18, this.space = 10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Markdown(
          '${AppLocalizations.of(context).translations['about']['1']}',
          textStyle: TextStyle(
            fontSize: fontSize,
          ),
        ),
        Markdown(
          '${AppLocalizations.of(context).translations['about']['2']}',
          textStyle: TextStyle(
            fontSize: fontSize,
          ),
        ),
        Container(
          height: space,
        ),
        Markdown(
          '${AppLocalizations.of(context).translations['about']['3']}',
          textStyle: TextStyle(
            fontSize: fontSize,
          ),
        ),
        Markdown(
          '${AppLocalizations.of(context).translations['about']['4']}',
          textStyle: TextStyle(
            fontSize: fontSize,
          ),
        ),
        Container(
          height: space,
        ),
        Markdown(
          '${AppLocalizations.of(context).translations['about']['5']}',
          textStyle: TextStyle(
            fontSize: fontSize,
          ),
        ),
        Divider(
          height: space * 2,
        ),
        Markdown(
          '${AppLocalizations.of(context).translations['oi']}',
          textStyle: TextStyle(
            fontSize: fontSize,
          ),
        ),
        Container(
          height: space,
        ),
        _MoreReading(
          fontSize: fontSize,
        )
      ],
    );
  }
}

class _RespImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktop: (_) {
        return Container(
          width: 200,
          child: _Image(),
        );
      },
      mobile: (_) {
        return Container(
          width: 100,
          child: _Image(),
        );
      },
    );
  }
}

class _Image extends StatefulWidget {
  @override
  __ImageState createState() => __ImageState();
}

class __ImageState extends State<_Image> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Container(
        child: AspectRatio(
          aspectRatio: 4 / 6,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image(
              image: WebsiteImageProvider.of(context).profile,
            ),
          ),
        ),
      ),
    );
  }
}

class _MoreReading extends StatelessWidget {
  final double fontSize;

  const _MoreReading({Key key, this.fontSize = 18}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppLocalizations.of(context).translations['oi_more'],
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
        LinkWidget(
          text: 'Schweizerische Vereinigung Osteogenesis Imperfecta (Deutsch)',
          url: 'https://www.glasknochen.ch/krankheitsbild/',
          linkStyle: TextStyle(
            fontSize: fontSize,
          ),
        ),
        LinkWidget(
          text: 'US National Health Service (English)',
          url:
              'https://www.bones.nih.gov/health-info/bone/osteogenesis-imperfecta/overview',
          linkStyle: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
