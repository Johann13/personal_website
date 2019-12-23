import 'package:flutter/material.dart';
import 'package:personal_website/extensions/media_query_data_ext.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).width,
      height: MediaQuery.of(context).height * 0.1,
      color: Colors.blue,
    );
  }
}
