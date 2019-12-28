import 'dart:html' as html;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/app_localizations.dart';
import 'package:personal_website/other/image_provider.dart';
import 'package:personal_website/other/markdown_widget.dart';
import 'package:screen_size_util/screen_size_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      medium: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).translations['menu']['home'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 1.0),
                    child: _Text(),
                  ),
                ),
                _Image(),
              ],
            ),
          ],
        );
      },

      small: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).translations['menu']['home'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _Line(
                        aboutLine: 1,
                        fontSize: 16,
                      ),
                      _Line(
                        aboutLine: 2,
                        fontSize: 16,
                      ),
                    ],
                  ),
                ),
                _Image(
                  width: 100,
                ),
              ],
            ),
            Container(
              height: 8,
            ),
            _Line(
              aboutLine: 3,
              fontSize: 16,
            ),
            _Line(
              aboutLine: 4,
              fontSize: 16,
            ),
            Container(
              height: 8,
            ),
            _Line(
              aboutLine: 5,
              fontSize: 16,
            ),
            Divider(
              height: 16,
            ),
            Markdown(
              '${AppLocalizations.of(context).translations['oi']}',
              textStyle: TextStyle(
                fontSize: 16,
              ),
            ),
            Container(
              height: 8,
            ),
            _MoreReading(
              fontSize: 16,
            ),
          ],
        );
      },
      extraSmall: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).translations['menu']['home'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _Line(
                        aboutLine: 1,
                        fontSize: 16,
                      ),
                    ],
                  ),
                ),
                _Image(
                  width: 100,
                ),
              ],
            ),
            _Line(
              aboutLine: 2,
              fontSize: 16,
            ),
            Container(
              height: 8,
            ),
            _Line(
              aboutLine: 3,
              fontSize: 16,
            ),
            _Line(
              aboutLine: 4,
              fontSize: 16,
            ),
            Container(
              height: 8,
            ),
            _Line(
              aboutLine: 5,
              fontSize: 16,
            ),
            Divider(
              height: 16,
            ),
            Markdown(
              '${AppLocalizations.of(context).translations['oi']}',
              textStyle: TextStyle(
                fontSize: 16,
              ),
            ),
            Container(
              height: 8,
            ),
            _MoreReading(
              fontSize: 16,
            ),
          ],
        );
      },
    );
  }

  String get lang => html.window.navigator.language;
}

class _RespText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      large: (_) => _Text(),
      extraSmall: (_) => _Text(
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
        _Line(
          aboutLine: 1,
          fontSize: fontSize,
        ),
        _Line(
          aboutLine: 2,
          fontSize: fontSize,
        ),
        Container(
          height: space,
        ),
        _Line(
          aboutLine: 3,
          fontSize: fontSize,
        ),
        _Line(
          aboutLine: 4,
          fontSize: fontSize,
        ),
        Container(
          height: space,
        ),
        _Line(
          aboutLine: 5,
          fontSize: fontSize,
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

class _Line extends StatelessWidget {
  final int aboutLine;
  final double fontSize;

  const _Line({
    Key key,
    this.aboutLine = 1,
    this.fontSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Markdown(
      '${AppLocalizations.of(context).translations['about']['$aboutLine']}',
      textStyle: TextStyle(
        fontSize: fontSize,
      ),
    );
  }
}

class _Image extends StatefulWidget {
  final double width;

  const _Image({
    Key key,
    this.width = 200,
  }) : super(key: key);

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
    return Container(
      width: widget.width,
      child: FadeTransition(
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
