import 'package:flutter/material.dart';

class HeadlineText1 extends StatelessWidget {
  final String text;

  const HeadlineText1(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
