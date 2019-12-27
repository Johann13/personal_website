import 'package:flutter/material.dart';
import 'package:flutter_web_util/flutter_web_util.dart';
import 'package:personal_website/app_localizations.dart';
import 'package:personal_website/extensions/media_query_data_ext.dart';
import 'package:personal_website/other/f_animation.dart';
import 'package:personal_website/other/markdown_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).width,
      height: MediaQuery.of(context).height * 0.1,
      child: Card(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).height * 0.1,
                width: MediaQuery.of(context).height * 0.1,
                child: FAnimation(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Made by Johann Feser'),
                  LinkWidget(
                    text:
                    'Using Flutter 💙',
                    url:'https://flutter.dev',
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).height * 0.1,
                width: MediaQuery.of(context).height * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
