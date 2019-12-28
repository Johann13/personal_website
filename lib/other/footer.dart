import 'dart:math';

import 'package:flutter/material.dart';
import 'package:personal_website/other/markdown_widget.dart';
import 'package:screen_size_util/screen_size_util.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      extraSmall: (_) {
        return Container(
          height:
              max(MediaQuery.of(context).height, MediaQuery.of(context).width) *
                  0.1,
          child: Card(
            child: Center(
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Made by Johann Feser'),
                    LinkWidget(
                      text: 'Using Flutter 💙',
                      url: 'https://flutter.dev',
                      linkStyle: TextStyle(),
                    ),
                  ],
                );
              }),
            ),
          ),
        );
      },
      large: (_) {
        return Container(
          height: MediaQuery.of(context).height * 0.1,
          child: Card(
            child: Center(
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Made by Johann Feser'),
                    LinkWidget(
                      text: 'With Flutter',
                      url: 'https://flutter.dev',
                      linkStyle: TextStyle(),
                    ),
                  ],
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
