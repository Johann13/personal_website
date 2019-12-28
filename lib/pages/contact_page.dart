import 'package:flutter/widgets.dart';
import 'package:personal_website/app_localizations.dart';
import 'package:personal_website/other/markdown_widget.dart';
import 'package:screen_size_util/screen_size_util.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      large: (_) => _Content(),
      extraSmall: (_) => _Content(
        fontSize: 16,
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final double fontSize;

  const _Content({Key key, this.fontSize = 18}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          AppLocalizations.of(context).translations['menu']['contact'],
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Markdown(
          AppLocalizations.of(context).translations['contact'],
          textStyle: TextStyle(fontSize: fontSize),
        ),
      ],
    );
  }
}
