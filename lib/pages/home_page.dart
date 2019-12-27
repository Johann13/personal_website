import 'package:easy_localization/easy_localization_delegate.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:personal_website/other/markdown_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppLocalizations app = AppLocalizations.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Markdown(
                '${app.tr(
                  'about.1',
                )}',
                fontSize: 20,
              ),
              Markdown(
                '${app.tr(
                  'about.2',
                )} ${app.tr(
                  'about.3',
                )} ${app.tr(
                  'about.4',
                )}',
                fontSize: 20,
              ),Markdown(
                '${app.tr(
                  'about.5',
                )}',
                fontSize: 20,
              ),
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
