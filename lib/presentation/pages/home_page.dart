import 'package:calisthenics_logger_2/presentation/pages/calendar_page.dart';
import 'package:calisthenics_logger_2/presentation/pages/charts_page.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Container.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  List<ExerciseData> _exampleExerciseData() {
    List<ExerciseData> result = [
      _examplePullUpData,
      _examplePushUpData,
      _exampleDeadliftData,
    ];
    return result;
  }

  final ExerciseData _examplePullUpData =
      new ExerciseData('Pull Up', 4, DateTime.now(), [
    ExerciseRowData('1', '4', '5', '', 'wide'),
    ExerciseRowData('2', '5', '5', '', 'wide'),
    ExerciseRowData('3', '4', '10', '', 'wide'),
  ]);

  final ExerciseData _examplePushUpData =
      new ExerciseData('Push Up', 3, DateTime.now(), [
    ExerciseRowData('1', '15', '', 'red', ''),
    ExerciseRowData('2', '20', '', 'purple', ''),
  ]);

  final ExerciseData _exampleDeadliftData =
      new ExerciseData('Deadlift', 3, DateTime.now(), [
    ExerciseRowData('1', '15', '5', '', ''),
    ExerciseRowData('2', '20', '15', '', ''),
    ExerciseRowData('3', '15', '25', '', ''),
    ExerciseRowData('4', '20', '125', '', ''),
  ]);

  @override
  Widget build(BuildContext context) {
    return StyledScaffold(
      completedSetDrawerItems: createSampleDrawerItems(),
      title: 'Calisthenics Logger',
      body: StyledContainer(
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back_ios),
                Text('Today'),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
            Expanded(
              child: WorkoutList(
                exerciseData: _exampleExerciseData(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Takes a List<ExerciseData>
// and returns a ListView
// containing ListTile
// containing exercisename for title
// and girdview with sets listed
class WorkoutList extends StatelessWidget {
  final List<dynamic> exerciseData;

  const WorkoutList({Key? key, required this.exerciseData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: exerciseData.map((event) {
        ExerciseData exerciseData = event;
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            title: _getListTileTitleWidget(exerciseData.exerciseName),
            subtitle: _getExerciseGrid(exerciseData.numPopulatedFields,
                exerciseData.rowData, MediaQuery.of(context).size.width),
            dense: true,
            onTap: () {
              print('$event tapped!');
              Navigator.pushNamed(context, '/training');
            },
          ),
        );
      }).toList(),
    );
  }

  Widget _getListTileTitleWidget(String title) {
    return Column(
      children: [Text(title), Divider()],
    );
  }

  GridView _getExerciseGrid(
      int columnCount, List<ExerciseRowData> data, double width) {
    // Magic number area, TODO: understand how to set childAspect ratio based on number of columns
    // Magic number source: https://github.com/flutter/flutter/issues/29035
    var maxWidth = 500.0;
    var columns = (width ~/ maxWidth) + columnCount;
    var columnWidth = width / columns;
    var aspectRatio = columnWidth / 20;

    GridView grid = GridView.count(
      // Setting primary to false disables scrolling within the gridview
      primary: false,
      shrinkWrap: true,
      childAspectRatio: aspectRatio,
      crossAxisCount: columnCount,
      children: _getExerciseGridWidgets(data),
    );

    return grid;
  }

  List<Widget> _getExerciseGridWidgets(List<ExerciseRowData> rowData) {
    List<Widget> result = <Widget>[];
    rowData.forEach((exerciseRow) {
      result.add(ExerciseGridWidget(exerciseRow.setNum, ''));
      if (exerciseRow.weight.isNotEmpty) {
        result.add(ExerciseGridWidget(exerciseRow.weight, 'kgs'));
      }
      if (exerciseRow.band.isNotEmpty) {
        result.add(ExerciseGridWidget(exerciseRow.band, "band"));
      }
      if (exerciseRow.tool.isNotEmpty) {
        result.add(ExerciseGridWidget(exerciseRow.tool, ""));
      }
      if (exerciseRow.reps.isNotEmpty) {
        result.add(ExerciseGridWidget(exerciseRow.reps, "reps"));
      }
    });
    return result;
  }
}
