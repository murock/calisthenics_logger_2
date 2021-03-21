import 'package:calisthenics_logger_2/presentation/widgets/headline_text_2.dart';
import 'package:calisthenics_logger_2/presentation/widgets/sub_title_text_2.dart';
import 'package:flutter/material.dart';

List<Widget> BuildDrawerSection(final String title, final String text) {
  return [
    HeadlineText2(title),
    SubTitleText2(text),
    Divider(color: Colors.grey),
  ];
}
