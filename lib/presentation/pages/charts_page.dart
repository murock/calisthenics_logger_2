import 'package:calisthenics_logger_2/core/constants.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styledContainer.dart';

/// Example of a simple line chart.
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
    return StyledContainer(
      child: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Text(
            'Results',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 40,
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
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<ExerciseData, DateTime>> _createSampleData() {
    final data = [
      new ExerciseData(new DateTime(2021, 2, 1), 3),
      new ExerciseData(new DateTime(2021, 3, 2), 5),
      new ExerciseData(new DateTime(2021, 3, 6), 10),
      new ExerciseData(new DateTime(2021, 4, 1), 15),
    ];

    return [
      new charts.Series<ExerciseData, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (ExerciseData sales, _) => sales.time,
        measureFn: (ExerciseData sales, _) => sales.reps,
        data: data,
      )
    ];
  }
}

class ExerciseData {
  final DateTime time;
  final int reps;

  ExerciseData(this.time, this.reps);
}
