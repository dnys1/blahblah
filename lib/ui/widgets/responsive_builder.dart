import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  final double breakpoint;
  final Widget Function(BuildContext) smallBuilder;
  final Widget Function(BuildContext) largeBuilder;

  ResponsiveBuilder({
    this.breakpoint = 500,
    @required this.smallBuilder,
    @required this.largeBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    if (size < breakpoint) {
      return smallBuilder(context);
    } else {
      return largeBuilder(context);
    }
  }
}
