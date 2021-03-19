import 'package:flutter/material.dart';

class SubTitleText2 extends StatelessWidget {
  final String text;

  const SubTitleText2(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: Theme.of(context).textTheme.subtitle2,
    );
  }
}
