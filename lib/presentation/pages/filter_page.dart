import 'package:calisthenics_logger_2/presentation/widgets/styled_Container.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Scaffold.dart';
import 'package:calisthenics_logger_2/presentation/widgets/sub_title_text_2.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StyledScaffold.withSampleData(
      title: 'Filter',
      body: StyledContainer(
        child: Column(
          children: [
            SubTitleText2('Progression'),
            ListView(),
            SubTitleText2('Muscle Group')
          ],
        ),
      ),
    );
  }
}
