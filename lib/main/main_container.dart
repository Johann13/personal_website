import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/main/navigation.dart';
import 'package:personal_website/other/footer.dart';
import 'package:screen_size_util/screen_size_util.dart';

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
      body: ResponsiveBuilder(
        extraLarge: (context) => _Desktop(
          title: title+'L',
          child: child,
        ),
        medium: (_) => _TabletPortrait(
          title: title+'M',
          child: child,
        ),
        extraSmall: (_) => _Mobile(
          title: title+'S',
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
    return Container(
      width: MediaQuery.of(context).width,
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).width * (2 / 3),
            height: MediaQuery.of(context).height * .1,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Johann Feser',
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ),
                  SiteNavigation(
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                ],
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
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: MediaQuery.of(context).height * .8,
                          ),
                          child: Container(
                            width: MediaQuery.of(context).width * (2 / 3),
                            child: Card(
                              child: Container(
                                child: AnimatedPadding(
                                  duration: Duration(seconds: 1),
                                  padding: const EdgeInsets.all(8.0),
                                  child: child,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).width * (2 / 3),
                          child: Footer(),
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
                        width: MediaQuery.of(context).width * .9,
                        height: MediaQuery.of(context).height * 0.1,
                        child: Card(
                          child: Center(
                            child: Text(
                              'Johann Feser',
                              style: Theme.of(context).textTheme.headline,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).height * .8,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).width * .9,
                          child: Card(
                            child: Container(
                              child: AnimatedPadding(
                                duration: Duration(seconds: 1),
                                padding: const EdgeInsets.all(8.0),
                                child: child,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).width * .9,
                        child: Footer(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).height * .1,
            ),
            width: MediaQuery.of(context).width * .9,
            child: Card(
              child: CollapsedMenu(),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabletPortrait extends StatelessWidget {
  final String title;
  final Widget child;

  const _TabletPortrait({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).orientation;
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
                        width: MediaQuery.of(context).width * .9,
                        height: MediaQuery.of(context).height * 0.1,
                        child: Card(
                          child: Center(
                            child: Text(
                              'Johann Feser',
                              style: Theme.of(context).textTheme.headline,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).height * .8,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).width * .9,
                          child: Card(
                            child: Container(
                              child: AnimatedPadding(
                                duration: Duration(seconds: 1),
                                padding: const EdgeInsets.all(8.0),
                                child: child,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).width * .9,
                        child: Footer(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).height * .1,
            ),
            width: MediaQuery.of(context).width * .9,
            child: Card(
              child: CollapsedMenu(),
            ),
          ),
        ],
      ),
    );
  }
}
