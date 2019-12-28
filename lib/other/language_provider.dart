import 'dart:async';
import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_async_builder/builder/simple_future_builder.dart';
import 'package:flutter_web_util/hover/hover_widget.dart';
import 'package:personal_website/other/image_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends StatefulWidget {
  final WidgetBuilder builder;

  const LanguageProvider({Key key, @required this.builder}) : super(key: key);

  @override
  _LanguageProviderState createState() => _LanguageProviderState();

  static _LanguageInheritedWidget _of(BuildContext context) {
    return (context
        .dependOnInheritedWidgetOfExactType<_LanguageInheritedWidget>());
  }

  static String lang(BuildContext context) {
    return _of(context).state.language;
  }

  static Locale locale(BuildContext context) {
    if (lang(context) == 'de-DE') {
      return Locale('de', 'DE');
    } else {
      return Locale('en', 'EN');
    }
  }

  static void setLang(BuildContext context, String lang) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('languageCode', lang);
    _of(context).state.language = lang;
  }
}

class _LanguageProviderState extends State<LanguageProvider> {
  String _language;

  set language(String language) {
    setState(() {
      this._language = language;
    });
  }

  String get language => _language;

  @override
  Widget build(BuildContext context) {
    return SimpleFutureBuilder<String>(
      future: _load(),
      loading: (_) => Container(),
      error: (_, __) => Container(),
      builder: (context, language) {
        return _LanguageInheritedWidget(
          widget.builder(context),
          this,
        );
      },
    );
  }

  Future<String> _load() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String languageCode = html.window.navigator.language;
    String saved = preferences.getString('languageCode');
    if (saved == null) {
      await preferences.setString('languageCode', languageCode);
    }
    this.language = preferences.getString('languageCode');
    return preferences.getString('languageCode');
  }
}

class _LanguageInheritedWidget extends InheritedWidget {
  final _LanguageProviderState state;

  _LanguageInheritedWidget(Widget child, this.state) : super(child: child);

  @override
  bool updateShouldNotify(_LanguageInheritedWidget old) => true;
}

class LanguageSwitch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: MousePointer(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Builder(
              builder: (context) {
                if (LanguageProvider.lang(context) == 'de-DE') {
                  return Image(image: WebsiteImageProvider.of(context).de,);
                }
                return Image(image: WebsiteImageProvider.of(context).gb,);
              },
            ),
          ),
        ),
        onTap: () {
          if (LanguageProvider.lang(context) == 'de-DE') {
            LanguageProvider.setLang(context, 'en-EN');
          } else {
            LanguageProvider.setLang(context, 'de-DE');
          }
        },
      ),
    );
  }
}
