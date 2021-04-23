import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:calisthenics_logger_2/presentation/pages/trainingPageWidgets/add_remove_row.dart';
import 'package:calisthenics_logger_2/presentation/pages/trainingPageWidgets/band_dropdown.dart';
import 'package:calisthenics_logger_2/presentation/pages/trainingPageWidgets/exercise_input.dart';
import 'package:calisthenics_logger_2/presentation/pages/trainingPageWidgets/recorded_exercise_item.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Container.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Scaffold.dart';
import 'package:flutter/material.dart';

class TrainingDisplay extends StatelessWidget {
  final TrackedExercise trackedExercise;

  const TrainingDisplay({Key? key, required this.trackedExercise})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StyledScaffold.withSampleData(
      title: 'Training',
      body: StyledContainer(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                'Pull Up - Today',
                style: Theme.of(context).textTheme.headline1,
                //  style: TextStyle(color: Colors.red),
              ),
            ),
            ExerciseInput(
              mainText: '10',
              subText: 'Reps',
            ),
            ExerciseInput(
              mainText: '20',
              subText: 'kgs',
            ),
            BandDropdown(),
            AddRemoveRow(),
            Flexible(
              child: Container(
                height: 200,
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                        color: Colors.white,
                      ),
                  itemCount: 3,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(1),
                    child: RecordedExerciseItem(
                      setNum: (index + 1).toString(),
                      reps: (index + 7).toString(),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
