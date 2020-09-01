import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/app_localizations.dart';
import 'package:personal_website/other/language_provider.dart';
import 'package:screen_size_util/screen_size_util.dart';
import 'package:ycapp_dart_util/ui/hover_widget.dart';

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
          text: AppLocalizations.of(context).translations['menu']['home'],
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          padding: EdgeInsets.only(
            right: padding,
          ),
        ),
        NavButton(
          text: AppLocalizations.of(context).translations['menu']['projects'],
          onPressed: () {
            Navigator.pushNamed(context, '/projects');
          },
          padding: EdgeInsets.only(
            left: padding,
            right: padding,
          ),
        ),
        NavButton(
          text: AppLocalizations.of(context).translations['menu']['contact'],
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
          Container(
            height: 50,
            width: 50,
          ),
          FlatButton(
            child: Text(AppLocalizations.of(context).translations['menu']['menu']),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return _BottomSheetMenu();
                  });
              /*
              Scaffold.of(context).showBottomSheet(
                (context) {
                },
              );*/
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
      width: MediaQuery.of(context).width * 0.8,
      height: 160,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NavButton(
            text: AppLocalizations.of(context).translations['menu']['home'],
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/');
            },
            padding: EdgeInsets.only(
              right: padding,
            ),
          ),
          NavButton(
            text: AppLocalizations.of(context).translations['menu']['projects'],
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/projects');
            },
            padding: EdgeInsets.only(
              left: padding,
              right: padding,
            ),
          ),
          NavButton(
            text: AppLocalizations.of(context).translations['menu']['contact'],
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/contact');
            },
            padding: EdgeInsets.only(
              left: padding,
              right: padding,
            ),
          ),
        ],
      ),
    );
  }
}
