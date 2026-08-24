import 'package:flutter/material.dart';

class PageHeading extends StatelessWidget {
  const PageHeading({super.key, required this.heading});
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Text(heading, style: Theme.of(context).textTheme.headlineLarge);
  }
}
