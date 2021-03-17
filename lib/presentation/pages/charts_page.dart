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
    return Column(
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
              behaviors: [
                new charts.ChartTitle('Top title text',
                    subTitle: 'kgs',
                    behaviorPosition: charts.BehaviorPosition.top,
                    titleOutsideJustification:
                        charts.OutsideJustification.start,
                    // Set a larger inner padding than the default (10) to avoid
                    // rendering the text too close to the top measure axis tick label.
                    // The top tick label may extend upwards into the top margin region
                    // if it is located at the top of the draw area.
                    innerPadding: 18),
                // new charts.ChartTitle('Bottom title text',
                //     behaviorPosition: charts.BehaviorPosition.bottom,
                //     titleOutsideJustification:
                //         charts.OutsideJustification.middleDrawArea),
                // new charts.ChartTitle('Start title',
                //     behaviorPosition: charts.BehaviorPosition.start,
                //     titleOutsideJustification:
                //         charts.OutsideJustification.middleDrawArea),
                // new charts.ChartTitle('End title',
                //     behaviorPosition: charts.BehaviorPosition.end,
                //     titleOutsideJustification:
                //         charts.OutsideJustification.middleDrawArea),
              ],
            )),
      ],
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<ExerciseData, DateTime>> _createSampleData() {
    final data = [
      new ExerciseData(new DateTime(2021, 2, 1), 5),
      new ExerciseData(new DateTime(2021, 3, 2), 25),
      new ExerciseData(new DateTime(2021, 3, 6), 100),
      new ExerciseData(new DateTime(2021, 4, 1), 75),
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

class SimpleLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleLineChart(this.seriesList, {required this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory SimpleLineChart.withSampleData() {
    return new SimpleLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList, animate: animate);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

class ExerciseData {
  final DateTime time;
  final int reps;

  ExerciseData(this.time, this.reps);
}
