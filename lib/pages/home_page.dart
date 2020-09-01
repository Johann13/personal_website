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
    List<String> lines = AppLocalizations.of(context).translations['about'];
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
                        fontSize: 16,
                        line: lines[0],
                      ),
                      _Line(
                        fontSize: 16,
                        line:lines[1],
                      ),
                      Container(
                        height: 8,
                      ),
                      _Line(
                        fontSize: 16,
                        line:lines[2],
                      ),
                      _Line(
                        fontSize: 16,
                        line:lines[3],
                      ),
                    ],
                  ),
                ),
                _Image(
                  width: 150,
                ),
              ],
            ),
            Container(
              height: 8,
            ),
            _Line(
              fontSize: 16,
              line:lines[4],
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
                        fontSize: 16,
                        line:lines[0],
                      ),
                      _Line(
                        fontSize: 16,
                        line:lines[1],
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
              fontSize: 16,
              line:lines[2],
            ),
            _Line(
              fontSize: 16,
              line:lines[3],
            ),
            Container(
              height: 8,
            ),
            _Line(
              fontSize: 16,
              line:lines[4],
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
    List<String> lines = AppLocalizations.of(context).translations['about'];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        for (String line in lines)
          _Line(
            fontSize: fontSize,
            line: line,
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
  final double fontSize;
  final String line;

  const _Line({
    Key key,
    this.fontSize = 18,
    @required this.line,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Markdown(
      line,
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: AspectRatio(
        aspectRatio: 4 / 6,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image(
            image: WebsiteImageProvider.of(context).profile,
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
