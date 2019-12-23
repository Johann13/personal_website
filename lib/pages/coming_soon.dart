import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Coming Soon...',
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
