import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_util/flutter_web_util.dart';
import 'package:url_launcher/url_launcher.dart';

final _urlRegExp = RegExp(r'\[(\w| )+\]\(https:\/\/((\w+).)+(\w+)\)');

class Markdown extends StatelessWidget {
  final List<Widget> _widgets;

  Markdown._(this._widgets);

  factory Markdown(String data, {double fontSize}) {
    Widget _parse(String s) {
      //return Text(s);
      return Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: Builder(
          builder: (context) {
            if (s.contains('http')) {
              String u = s
                  .replaceAll(RegExp(r'\[(\w| )+\]'), '')
                  .replaceAll(RegExp(r'\(|\)'), '');
              if (u.endsWith('.')) {
                u = u.substring(0, u.length - 1);
              }
              String t = s
                  .replaceAll(RegExp(r'\(https:\/\/((\w+).)+(\w+)\)'), '')
                  .replaceAll(RegExp(r'\[|\]'), '')
                  .replaceAll('_', ' ');
              return HoverBoolWidget(
                builder: (BuildContext context, bool value) {
                  return GestureDetector(
                    child: Text(
                      '$t',
                      style: TextStyle(
                          color: Colors.blue[value ? 300 : 500],
                          decoration: TextDecoration.underline,
                          fontSize: fontSize),
                    ),
                    onTap: () {
                      launch(u);
                    },
                  );
                },
              );
            }
            return Text(
              s,
              style: TextStyle(
                fontSize: fontSize,
              ),
            );
          },
        ),
      );
    }

    String d = data.replaceAllMapped(_urlRegExp, (Match m) {
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
      spacing: 3.5,
      children: _widgets,
    );
  }
}
