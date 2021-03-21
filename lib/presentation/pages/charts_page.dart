import 'package:calisthenics_logger_2/core/constants.dart';
import 'package:calisthenics_logger_2/presentation/widgets/completed_set_item_builder.dart';
import 'package:calisthenics_logger_2/presentation/widgets/sub_title_text_2.dart';
import 'package:calisthenics_logger_2/presentation/widgets/body_text_2.dart';
import 'package:calisthenics_logger_2/presentation/widgets/headline_text_2.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Results',
          style: Theme.of(context).textTheme.headline1,
        ),
        backgroundColor: APP_BAR_COLOUR,
      ),
      drawer: Drawer(
        child: StyledContainer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: BodyText2('Home'),
                onTap: () {
                  Navigator.pushNamed(context, '/training');
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                leading: Icon(Icons.build),
                title: BodyText2('Tools'),
                onTap: () {
                  Navigator.pushNamed(context, '/tools');
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                leading: Icon(Icons.calendar_today_rounded),
                title: BodyText2('Calendar'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...BuildDrawerSection('Hollow Body', '5 Sets'),
                    ...BuildDrawerSection('Pull Ups', '3 Sets'),
                    ...BuildDrawerSection('Pistol Squats', '3 Sets'),
                    ...BuildDrawerSection('Human Flag', '3 Sets'),
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
      ),
      body: StyledContainer(
        child: Column(
          children: [
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
