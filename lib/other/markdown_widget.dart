import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ycapp_dart_util/ui/hover_widget.dart';

final _urlText = RegExp(r'\[(\w|\s|\\|\/|\.)+\]');

class Markdown extends StatelessWidget {
  final List<Widget> _widgets;

  Markdown._(this._widgets);

  factory Markdown(
    String data, {
    TextStyle textStyle = const TextStyle(
      fontSize: 18,
    ),
    TextStyle linkStyle,
  }) {
    Widget _parse(String s) {
      //return Text(s);
      return Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: Builder(
          builder: (context) {
            if (s.contains('http') || s.contains('mailto')) {
              String u =
                  s.replaceAll(_urlText, '').replaceAll(RegExp(r'\(|\)'), '');
              if (u.endsWith('.')) {
                u = u.substring(0, u.length - 1);
              }
              String t = s
                  .replaceAll(
                      RegExp(
                          r'\(((http(s?):\/\/)|(mailto:))(((\w|\@)+).)+(\w+)\)'),
                      '')
                  .replaceAll(RegExp(r'\[|\]'), '')
                  .replaceAll('_', ' ');
              return LinkWidget(
                text: t,
                url: u,
                linkStyle: linkStyle ??
                    textStyle.copyWith(
                      decoration: TextDecoration.underline,
                    ),
              );
            }
            return Text(
              s,
              style: textStyle,
            );
          },
        ),
      );
    }

    String d = data.replaceAllMapped(_urlText, (Match m) {
      return m[0].replaceAll(' ', '_');
    });
    List<String> lines = d.split(RegExp(r' '));

    List<Widget> widgets = lines.map((s) => _parse(s)).toList();

    return Markdown._(widgets
        //lines.map((l) => Text(l.rep)).toList(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 1.5,
      spacing: 3.5,
      children: _widgets,
    );
  }
}

class LinkWidget extends StatelessWidget {
  final String text;
  final String url;
  final TextStyle linkStyle;

  const LinkWidget({
    Key key,
    @required this.text,
    @required this.url,
    @required this.linkStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverBoolWidget(
      builder: (BuildContext context, bool value) {
        return GestureDetector(
          child: Text(
            text,
            style: (linkStyle ?? TextStyle()).copyWith(
              decoration: TextDecoration.underline,
              color: value ? Colors.green[300] : null,
            ),
          ),
          onTap: () {
            launch(url.replaceAll(',', '').trim());
          },
        );
      },
    );
  }
}
