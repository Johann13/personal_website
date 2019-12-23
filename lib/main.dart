import 'package:easy_localization/easy_localization_delegate.dart';
import 'package:easy_localization/easy_localization_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_util/flutter_web_util.dart';
import 'package:personal_website/other/background_animation.dart';
import 'package:personal_website/pages/about_page.dart';
import 'package:personal_website/pages/contact_page.dart';
import 'package:personal_website/pages/home_page.dart';
import 'package:personal_website/pages/projects_page.dart';

import 'main/main_container.dart';

void main() => runApp(EasyLocalization(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: MaterialApp(
        title: 'Johann Feser',
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        supportedLocales: [
          Locale('en', 'EN'),
          Locale('de', 'DE'),
        ],
        locale: data.savedLocale,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasylocaLizationDelegate(
            locale: data.locale,
            path: 'assets/lang',
          ),
        ],
        theme: ThemeData.dark(),
        home: Stack(
          children: <Widget>[
            Positioned.fill(
              child: BackgroundAnimation(),
            ),
            Positioned.fill(
              child: Navigator(
                initialRoute: '/',
                onUnknownRoute: (route) {
                  return SimpleWebRoute(
                    settings: route,
                    builder: (context) {
                      return MainContainer(
                        title: 'Home',
                        child: HomePage(),
                      );
                    },
                    title: 'Home',
                  );
                },
                onGenerateRoute: (route) {
                  String name = route.name.split('/')[1];
                  switch (name) {
                    case 'projects':
                      return SimpleWebRoute(
                        settings: route,
                        builder: (context) {
                          return MainContainer(
                            title: 'Projects',
                            child: ProjectsPage(),
                          );
                        },
                        title: 'Projects',
                      );
                      break;
                    case 'about':
                      return SimpleWebRoute(
                        settings: route,
                        builder: (context) {
                          return MainContainer(
                            title: 'About',
                            child: AboutPage(),
                          );
                        },
                        title: 'About',
                      );
                      break;
                    case 'contact':
                      return SimpleWebRoute(
                        settings: route,
                        builder: (context) {
                          return MainContainer(
                            title: 'Contact',
                            child: ContactPage(),
                          );
                        },
                        title: 'Contact',
                      );
                      break;
                  }

                  return SimpleWebRoute(
                    settings: route,
                    builder: (context) {
                      return MainContainer(
                        title: 'Home',
                        child: HomePage(),
                      );
                    },
                    title: 'Home',
                  );
                },

              ),
            ),
          ],
        ),
      ),
    );
  }
}
