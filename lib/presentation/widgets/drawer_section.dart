import 'package:calisthenics_logger_2/presentation/widgets/headline_text_2.dart';
import 'package:calisthenics_logger_2/presentation/widgets/sub_title_text_2.dart';
import 'package:flutter/material.dart';

class DrawerSection extends StatelessWidget {
  final String title;
  final String text;

  const DrawerSection(
    this.title,
    this.text, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/training');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadlineText2(title),
          SubTitleText2(text),
          Divider(color: Colors.grey),
        ],
      ),
    );
  }
}
