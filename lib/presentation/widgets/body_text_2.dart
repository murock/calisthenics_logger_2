import 'package:flutter/material.dart';

class BodyText2 extends StatelessWidget {
  final String text;

  const BodyText2(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}
