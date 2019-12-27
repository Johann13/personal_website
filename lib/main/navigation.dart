import 'package:flutter/material.dart';
import 'package:flutter_web_util/flutter_web_util.dart';

class SiteNavigation extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double padding;

  const SiteNavigation({
    Key key,
    this.padding = 4.0,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            right: padding,
          ),
          child: MousePointer(
            child: FlatButton(
              child: Text('Home'),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: padding,
            right: padding,
          ),
          child: MousePointer(
            child: FlatButton(
              child: Text('Projects'),
              onPressed: () {
                Navigator.pushNamed(context, '/projects');
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: padding),
          child: MousePointer(
            child: FlatButton(
              child: Text('Contact'),
              onPressed: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
          ),
        ),
      ],
    );
  }
}
