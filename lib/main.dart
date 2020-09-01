import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:personal_website/app_localizations.dart';
import 'package:personal_website/main/main_container.dart';
import 'package:personal_website/other/background_animation.dart';
import 'package:personal_website/other/f_animation.dart';
import 'package:personal_website/other/image_provider.dart';
import 'package:personal_website/other/language_provider.dart';
import 'package:personal_website/pages/contact_page.dart';
import 'package:personal_website/pages/home_page.dart';
import 'package:personal_website/pages/projects_page.dart';
import 'package:screen_size_util/screen_size_util.dart';
import 'package:ycapp_dart_util/ui/web_routes.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundAnimation(
      child: WebsiteImageProvider(
        builder: (context) {
          return LanguageProvider(
            builder: (context) {
              return Builder(builder: (context) {
                return MaterialApp(
                  title: 'Johann Feser',
                  debugShowCheckedModeBanner: false,
                  debugShowMaterialGrid: false,
                  supportedLocales: [
                    const Locale('en', 'EN'),
                    const Locale('de', 'DE'),
                  ],
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  locale: LanguageProvider.locale(context),
                  theme: ThemeData(
                      brightness: Brightness.dark,
                      primaryColor: Colors.green,
                      accentColor: Colors.greenAccent),
                  initialRoute: '/',
                  onUnknownRoute: (route) {
                    return SimpleWebRoute(
                      settings: route,
                      builder: (context) {
                        return _Nav(
                          initialRoute: '/',
                        );
                      },
                      title: 'Johann Feser',
                    );
                  },
                  onGenerateRoute: (route) {
                    String name = route.name.split('/')[1];
                    switch (name) {
                      case 'projects':
                        return SimpleWebRoute(
                          settings: route,
                          builder: (context) {
                            return _Nav(
                              initialRoute: '/project',
                            );
                          },
                          title: 'Johann Feser',
                        );
                        break;
                      case 'about':
                        return SimpleWebRoute(
                          settings: route,
                          builder: (context) {
                            return _Nav(
                              initialRoute: '/about',
                            );
                          },
                          title: 'Johann Feser',
                        );
                        break;
                      case 'contact':
                        return SimpleWebRoute(
                          settings: route,
                          builder: (context) {
                            return _Nav(
                              initialRoute: '/contact',
                            );
                          },
                          title: 'Johann Feser',
                        );
                      case 'f':
                        return SimpleWebRoute(
                          settings: route,
                          builder: (context) {
                            return _Nav(
                              initialRoute: '/f',
                            );
                          },
                          title: 'f',
                        );
                        break;
                    }
                    return SimpleWebRoute(
                      settings: route,
                      builder: (context) {
                        return _Nav(
                          initialRoute: '/',
                        );
                      },
                      title: 'Johann Feser',
                    );
                  },
                );
              });
            },
          );
        },
      ),
    );
  }
}

class _Nav extends StatelessWidget {
  final String initialRoute;

  const _Nav({Key key, @required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        /*
        Positioned.fill(
          child: BackgroundAnimation(),
        ),*/
        Positioned.fill(
          child: Navigator(
            initialRoute: initialRoute,
            onUnknownRoute: (route) {
              return SimpleWebRoute(
                settings: route,
                builder: (context) {
                  return MainContainer(
                    title: 'Home',
                    child: HomePage(),
                  );
                },
                title: 'Johann Feser',
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
                    title: 'Johann Feser',
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
                    title: 'Johann Feser',
                  );
                case 'f':
                  return SimpleWebRoute(
                    settings: route,
                    builder: (context) {
                      return Container(
                        width: MediaQuery.of(context).width,
                        height: MediaQuery.of(context).height,
                        child: Center(
                          child: Container(
                            width: 200,
                            height: 200,
                            child: FAnimation(),
                          ),
                        ),
                      );
                    },
                    title: 'f',
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
                title: 'Johann Feser',
              );
            },
          ),
        ),
      ],
    );
  }
}
