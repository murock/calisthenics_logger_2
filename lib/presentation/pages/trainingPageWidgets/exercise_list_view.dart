import 'package:calisthenics_logger_2/domain/entities/tracked_exercise.dart';
import 'package:calisthenics_logger_2/presentation/pages/trainingPageWidgets/recorded_exercise_item.dart';
import 'package:flutter/material.dart';

class ExerciseListView extends StatelessWidget {
  final GroupedTrackedExercises trackedExercises;

  const ExerciseListView({
    Key? key,
    required this.trackedExercises,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPopulated = trackedExercises.trackedExercises.length > 0;
    return Flexible(
      child: Container(
        height: 200,
        child: !isPopulated
            ? Container()
            : ListView.separated(
                separatorBuilder: (BuildContext context, int index) => Divider(
                  color: Colors.white,
                ),
                itemCount: trackedExercises.trackedExercises[0].rows.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(1),
                  child: RecordedExerciseItem(
                    setNum:
                        trackedExercises.trackedExercises[0].rows[index].setNum,
                    reps: trackedExercises.trackedExercises[0].rows[index].reps,
                    weight:
                        trackedExercises.trackedExercises[0].rows[index].weight,
                    holdTime: trackedExercises
                        .trackedExercises[0].rows[index].holdTime,
                    band: trackedExercises.trackedExercises[0].rows[index].band,
                    tempo:
                        trackedExercises.trackedExercises[0].rows[index].tempo,
                    tool: trackedExercises.trackedExercises[0].rows[index].tool,
                    rest: trackedExercises.trackedExercises[0].rows[index].rest,
                    cluster: trackedExercises
                        .trackedExercises[0].rows[index].cluster,
                  ),
                ),
              ),
      ),
    );
  }
}
