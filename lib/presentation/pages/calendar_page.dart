import 'dart:developer';

import 'package:calisthenics_logger_2/presentation/pages/charts_page.dart';
import 'package:calisthenics_logger_2/presentation/widgets/body_text_2.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Container.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Scaffold.dart';
import 'package:calisthenics_logger_2/presentation/widgets/sub_title_text_2.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:calisthenics_logger_2/core/constants.dart';

class ExerciseRowData {
  final String exerciseName;
  final String setNum;
  final String reps;
  final String weight;

  ExerciseRowData(this.exerciseName, this.setNum, this.reps, this.weight);
}

class CalendarPage extends StatefulWidget {
  final String title;

  const CalendarPage({Key? key, required this.title}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with TickerProviderStateMixin {
  late Map<DateTime, List> _events;
  late List _selectedEvents;
  late AnimationController _animationController;
  late CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    List<ExerciseRowData> _examplePullUpData = [
      ExerciseRowData('Pull Up', '1', '4', '5'),
      ExerciseRowData('Pull Up', '2', '5', '5'),
      ExerciseRowData('Pull Up', '3', '4', '10'),
    ];

    List<ExerciseRowData> _examplePushUpData = [
      ExerciseRowData('Push Up', '1', '15', '5'),
      ExerciseRowData('Push Up', '2', '20', '5'),
    ];

    List<ExerciseRowData> _exampleDeadliftData = [
      ExerciseRowData('Deadlift', '1', '15', '5'),
      ExerciseRowData('Deadlift', '2', '20', '5'),
      ExerciseRowData('Deadlift', '3', '15', '5'),
      ExerciseRowData('Deadlift', '4', '20', '5'),
    ];

    _events = {
      _selectedDay.subtract(Duration(days: 0)): [
        _examplePullUpData,
        _examplePushUpData,
        _exampleDeadliftData
      ],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  @override
  Widget build(BuildContext context) {
    return StyledScaffold(
      title: widget.title,
      completedSetDrawerItems: createSampleDrawerItems(),
      body: StyledContainer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _buildTableCalendar(),
            Expanded(child: _buildEventList()),
          ],
        ),
      ),
    );
  }

  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: CONTRAST_COLOUR, // Colors.deepOrange[400],
        todayColor: CONTRAST_COLOUR_LIGHTER, //Colors.deepOrange[200],
        markersColor: Colors.grey[700], //Colors.brown[700],
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.white),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.grey[700]),
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: CONTRAST_COLOUR,
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: _getListTileTitleWidget(_extractExerciseName(event)),
                  subtitle: _getExerciseGrid(event),
                  dense: true,
                  onTap: () {
                    print('$event tapped!');
                    Navigator.pushNamed(context, '/training');
                  },
                ),
              ))
          .toList(),
    );
  }

  Widget _getListTileTitleWidget(String title) {
    return Column(
      children: [Text(title), Divider()],
    );
  }

  GridView _getExerciseGrid(List<ExerciseRowData> data) {
    GridView grid = GridView.count(
      shrinkWrap: true,
      childAspectRatio: 7.0,
      crossAxisCount: 3,
      children: [..._getExerciseGridWidgets(data)],
    );

    return grid;
  }

  List<Widget> _getExerciseGridWidgets(List<ExerciseRowData> rowData) {
    List<Widget> result = <Widget>[];
    rowData.forEach((exerciseRow) {
      log(exerciseRow.setNum);
      result.add(BodyText2(exerciseRow.setNum));
      result.add(ExerciseGridWidget(exerciseRow.weight, 'kgs'));
      result.add(ExerciseGridWidget(exerciseRow.reps, "reps"));
    });
    return result;
  }

  String _extractExerciseName(List<ExerciseRowData> data) {
    return data[0].exerciseName;
  }
}

class ExerciseGridWidget extends StatelessWidget {
  final String text;
  final String subText;
  const ExerciseGridWidget(
    this.text,
    this.subText, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BodyText2(text),
        SubTitleText2(
          this.subText,
        ),
      ],
    );
  }
}
