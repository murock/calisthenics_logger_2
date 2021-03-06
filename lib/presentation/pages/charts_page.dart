import 'package:calisthenics_logger_2/core/constants.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Scaffold.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Container.dart';

/// Y axis options, Reps, Weight, Hold time
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ChartsPage extends StatelessWidget {
  final List<charts.Series<dynamic, DateTime>> seriesList;
  final bool animate;

  const ChartsPage({Key? key, required this.seriesList, required this.animate})
      : super(key: key);

  /// Creates a [LineChart] with sample data and no transition.
  factory ChartsPage.withSampleData() {
    return new ChartsPage(
      seriesList: _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StyledScaffold.withSampleData(
      title: 'Results',
      body: StyledContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                'Pull Up',
                style: Theme.of(context).textTheme.headline1,
                //  style: TextStyle(color: Colors.red),
              ),
            ),
            Container(
              height: 400,
              child: charts.TimeSeriesChart(
                seriesList,
                animate: animate,
                domainAxis: new charts.DateTimeAxisSpec(
                    renderSpec: new charts.SmallTickRendererSpec(

                        // Tick and Label styling here.
                        labelStyle: new charts.TextStyleSpec(
                            fontFamily: FONT_FAMILY,
                            fontSize: FONT_SIZE_BODY_TEXT1, // size in Pts.
                            color: charts.MaterialPalette.white),

                        // Change the line colors to match text color.
                        lineStyle: new charts.LineStyleSpec(
                            color: charts.MaterialPalette.white))),
                primaryMeasureAxis: new charts.NumericAxisSpec(
                    renderSpec: new charts.GridlineRendererSpec(

                        // Tick and Label styling here.
                        labelStyle: new charts.TextStyleSpec(
                            fontFamily: FONT_FAMILY,
                            fontSize: FONT_SIZE_BODY_TEXT1, // size in Pts.
                            color: charts.MaterialPalette.white),

                        // Change the line colors to match text color.
                        lineStyle: new charts.LineStyleSpec(
                            color: charts.MaterialPalette.white))),
                behaviors: [
                  new charts.ChartTitle(
                    'Reps',
                    behaviorPosition: charts.BehaviorPosition.start,
                    titleStyleSpec: charts.TextStyleSpec(
                      fontFamily: FONT_FAMILY,
                      fontSize: FONT_SIZE_HEADLINE1,
                      color: charts.MaterialPalette.white,
                    ),
                    innerPadding: 8,
                    outerPadding: 0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<ExerciseDataForCharts, DateTime>>
      _createSampleData() {
    final data = [
      new ExerciseDataForCharts(new DateTime(2021, 2, 1), 3),
      new ExerciseDataForCharts(new DateTime(2021, 3, 2), 5),
      new ExerciseDataForCharts(new DateTime(2021, 3, 6), 10),
      new ExerciseDataForCharts(new DateTime(2021, 4, 1), 15),
    ];

    final data2 = [
      new ExerciseDataForCharts(new DateTime(2021, 1, 1), 3),
      new ExerciseDataForCharts(new DateTime(2021, 1, 10), 5),
      new ExerciseDataForCharts(new DateTime(2021, 2, 1), 10),
      new ExerciseDataForCharts(new DateTime(2021, 2, 20), 15),
    ];

    return [
      new charts.Series<ExerciseDataForCharts, DateTime>(
        id: 'blue',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (ExerciseDataForCharts sales, _) => sales.time,
        measureFn: (ExerciseDataForCharts sales, _) => sales.reps,
        data: data,
      ),
      new charts.Series<ExerciseDataForCharts, DateTime>(
        id: 'green',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (ExerciseDataForCharts sales, _) => sales.time,
        measureFn: (ExerciseDataForCharts sales, _) => sales.reps,
        data: data2,
      )
    ];
  }
}

class ExerciseDataForCharts {
  final DateTime time;
  final int reps;

  ExerciseDataForCharts(this.time, this.reps);
}
