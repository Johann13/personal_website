
import 'package:flutter/material.dart';
import 'package:personal_website/app_localizations.dart';
import 'dart:html' as html;

import 'package:personal_website/other/markdown_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${AppLocalizations.of(context).translations['about']['1']}')
            ],
          ),
        ),
        Container(
          width: 200,
          height: 200,
          child: Placeholder(),
        ),
      ],
    );
  }

  String get lang => html.window.navigator.language;
}
