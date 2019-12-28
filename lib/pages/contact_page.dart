import 'package:flutter/widgets.dart';
import 'package:flutter_web_util/flutter_web_util.dart';
import 'package:personal_website/app_localizations.dart';
import 'package:personal_website/other/markdown_widget.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktop: (_) => _Content(),
      mobile: (_) => _Content(
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
          AppLocalizations.of(context).translations['contact'],
          style: TextStyle(fontSize: fontSize),
        ),
        LinkWidget(
          text: 'Email',
          url: 'mailto:johannfeser@gmail.com',
          linkStyle: TextStyle(fontSize: fontSize),
        ),
      ],
    );
  }
}
