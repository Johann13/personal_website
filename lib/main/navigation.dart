import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_util/hover/hover_widget.dart';
import 'package:personal_website/other/language_provider.dart';

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
        NavButton(
          text: 'Home',
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          padding: EdgeInsets.only(
            right: padding,
          ),
        ),
        NavButton(
          text: 'Projects',
          onPressed: () {
            Navigator.pushNamed(context, '/projects');
          },
          padding: EdgeInsets.only(
            left: padding,
            right: padding,
          ),
        ),
        NavButton(
          text: 'Contact',
          onPressed: () {
            Navigator.pushNamed(context, '/contact');
          },
          padding: EdgeInsets.only(
            left: padding,
            right: padding,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: padding),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 16,
            ),
            child: LanguageSwitch(),
          ),
        ),
      ],
    );
  }
}

class NavButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;

  const NavButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.padding = const EdgeInsets.all(0.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: HoverColorWidget(
        builder: (BuildContext context, Color value) {
          return FlatButton(
            hoverColor: Colors.transparent,
            textColor: value,
            child: Text(
              text,
            ),
            onPressed: onPressed,
          );
        },
        value: Colors.white,
        hoverValue: Colors.green[300],
      ),
    );
  }
}

class CollapsedMenu extends StatelessWidget {
  final double padding;

  const CollapsedMenu({Key key, this.padding = 2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(height: 50,width: 50,),
          FlatButton(
            child: Text('Menu'),
            onPressed: () {
              Scaffold.of(context).showBottomSheet(
                (context) {
                  return _BottomSheetMenu();
                },
              );
            },
          ),
          Container(
            height: 50,
            width: 50,
            child: Padding(
              padding: EdgeInsets.only(left: padding),
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
                child: LanguageSwitch(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomSheetMenu extends StatelessWidget {
  final double padding;

  const _BottomSheetMenu({Key key, this.padding = 2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
      height: 160,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NavButton(
              text: 'Home',
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              padding: EdgeInsets.only(
                right: padding,
              ),
            ),
            NavButton(
              text: 'Projects',
              onPressed: () {
                Navigator.pushNamed(context, '/projects');
              },
              padding: EdgeInsets.only(
                left: padding,
                right: padding,
              ),
            ),
            NavButton(
              text: 'Contact',
              onPressed: () {
                Navigator.pushNamed(context, '/contact');
              },
              padding: EdgeInsets.only(
                left: padding,
                right: padding,
              ),
            ),
          ],
        ),
      ),
    );
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            NavButton(
              text: 'Home',
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              padding: EdgeInsets.only(
                right: padding,
              ),
            ),
            NavButton(
              text: 'Projects',
              onPressed: () {
                Navigator.pushNamed(context, '/projects');
              },
              padding: EdgeInsets.only(
                left: padding,
                right: padding,
              ),
            ),
            NavButton(
              text: 'Contact',
              onPressed: () {
                Navigator.pushNamed(context, '/contact');
              },
              padding: EdgeInsets.only(
                left: padding,
                right: padding,
              ),
            ),
            Container(
              height: 50,
              child: Padding(
                padding: EdgeInsets.only(left: padding),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  child: LanguageSwitch(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
