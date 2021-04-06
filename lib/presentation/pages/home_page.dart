import 'package:calisthenics_logger_2/core/constants.dart';
import 'package:calisthenics_logger_2/core/util/theme.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Container.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Scaffold.dart';
import 'package:calisthenics_logger_2/presentation/widgets/workout_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StyledScaffold.withSampleData(
      title: 'Calisthenics Logger',
      body: StyledContainer(
        child: Column(
          children: [
            Theme(
              data: pinkTheme(),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 40,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          'Today',
                          style: TextStyle(
                            fontFamily: FONT_FAMILY,
                            fontSize: 35,
                            color: FONT_COLOUR,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 40,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: WorkoutList.withSampleData(),
            ),
          ],
        ),
      ),
    );
  }
}
