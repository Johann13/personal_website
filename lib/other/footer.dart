import 'package:flutter/material.dart';
import 'package:personal_website/other/f_animation.dart';
import 'package:personal_website/other/markdown_widget.dart';
import 'package:screen_size_util/screen_size_util.dart';


class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).height * 0.1,
          maxHeight: MediaQuery.of(context).height * 0.2),
      child: Card(
        child: Center(
          child: LayoutBuilder(builder: (context, constraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: constraints.maxHeight,
                  height: constraints.maxHeight,
                  child: FAnimation(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Made by Johann Feser'),
                    LinkWidget(
                      text: 'Using Flutter 💙',
                      url: 'https://flutter.dev',
                      linkStyle: TextStyle(),
                    ),
                  ],
                ),
                Container(
                  width: constraints.maxHeight,
                  height: constraints.maxHeight,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
