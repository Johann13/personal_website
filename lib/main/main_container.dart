import 'package:flutter/material.dart';
import 'package:flutter_web_util/screen_size/screen_size.dart';
import 'package:personal_website/extensions/media_query_data_ext.dart';
import 'package:personal_website/main/navigation.dart';
import 'package:personal_website/pages/coming_soon.dart';

class MainContainer extends StatelessWidget {
  final String title;
  final Widget child;

  const MainContainer({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ComingSoon(),
    );
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ResponsiveWidget(
        desktop: (context) => _Desktop(
          title: title,
          child: child,
        ),
        mobile: (_) => _Mobile(
          title: title,
          child: child,
        ),
      ),
    );
  }
}

class _Desktop extends StatelessWidget {
  final String title;
  final Widget child;

  const _Desktop({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SiteContainer(
      title: title,
      child: child,
      width: MediaQuery.of(context).width * (2 / 3),
    );
  }
}

class _Mobile extends StatelessWidget {
  final String title;
  final Widget child;

  const _Mobile({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).width,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).height * .85,
                        width: MediaQuery.of(context).width * .9,
                        child: Card(
                          child: Container(
                            height: MediaQuery.of(context).height * .85,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: child,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).width * .9,
                        height: MediaQuery.of(context).height * .1,
                      ),
                      Container(
                        width: MediaQuery.of(context).width * .9,
                        height: MediaQuery.of(context).height * .1,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).width * .9,
            height: MediaQuery.of(context).height * .1,
            child: Card(
              child: SiteNavigation(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SiteContainer extends StatelessWidget {
  final String title;
  final Widget child;
  final double width;

  const _SiteContainer({
    Key key,
    @required this.title,
    @required this.child,
    @required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).width,
      child: Column(
        children: <Widget>[
          Container(
            width: width,
            height: MediaQuery.of(context).height * .1,
            child: Card(
              child: SiteNavigation(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).width,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).height * .85,
                          width: width,
                          child: Card(
                            child: Container(
                              height: MediaQuery.of(context).height * .85,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: child,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).height * .1,
                          width: width,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
