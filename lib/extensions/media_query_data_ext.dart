import 'package:flutter/widgets.dart';

extension SimpleMediaQueryData on MediaQueryData {
  double get height => this.size.height;

  double get width => this.size.width;
}
