

import 'package:flutter/material.dart';
import 'package:personal_website/main/navigation.dart';

class SiteTitle extends StatelessWidget {
  final String title;

  const SiteTitle({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline,
      ),
    );
  }
}

class DesktopHeader extends StatelessWidget {
  final String title;

  const DesktopHeader({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: SiteTitle(
                title: title,
              ),
            ),
            Expanded(
              child: SiteNavigation(
                mainAxisAlignment: MainAxisAlignment.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}