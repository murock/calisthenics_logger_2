import 'package:calisthenics_logger_2/presentation/pages/charts_page.dart';
import 'package:calisthenics_logger_2/presentation/widgets/body_text_2.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Container.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Scaffold.dart';
import 'package:calisthenics_logger_2/presentation/widgets/sub_title_text_2.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:calisthenics_logger_2/core/constants.dart';

class ExerciseData {
  final String exerciseName;
  final int numPopulatedFields;
  final List<ExerciseRowData> rowData;

  ExerciseData(this.exerciseName, this.numPopulatedFields, this.rowData);
}

class ExerciseRowData {
  final String setNum;
  final String reps;
  final String weight;
  final String band;
  final String tool;

  ExerciseRowData(this.setNum, this.reps, this.weight, this.band, this.tool);
}

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

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
    ExerciseData _examplePullUpData = new ExerciseData('Pull Up', 4, [
      ExerciseRowData('1', '4', '5', '', 'wide'),
      ExerciseRowData('2', '5', '5', '', 'wide'),
      ExerciseRowData('3', '4', '10', '', 'wide'),
    ]);

    ExerciseData _examplePushUpData = new ExerciseData('Push Up', 3, [
      ExerciseRowData('1', '15', '', 'red', ''),
      ExerciseRowData('2', '20', '', 'purple', ''),
    ]);

    ExerciseData _exampleDeadliftData = new ExerciseData('Deadlift', 3, [
      ExerciseRowData('1', '15', '5', '', ''),
      ExerciseRowData('2', '20', '15', '', ''),
      ExerciseRowData('3', '15', '25', '', ''),
      ExerciseRowData('4', '20', '125', '', ''),
    ]);

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
      title: 'Calendar',
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
        selectedColor: CONTRAST_COLOUR,
        todayColor: CONTRAST_COLOUR_LIGHTER,
        markersColor: Colors.grey[700],
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
      children: _selectedEvents.map((event) {
        ExerciseData exerciseData = event;
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            title: _getListTileTitleWidget(exerciseData.exerciseName),
            subtitle: _getExerciseGrid(
                exerciseData.numPopulatedFields, exerciseData.rowData),
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

  GridView _getExerciseGrid(int columnCount, List<ExerciseRowData> data) {
    GridView grid = GridView.count(
      shrinkWrap: true,
      childAspectRatio: 7.0,
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
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        BodyText2(text),
        SubTitleText2(
          ' ' + this.subText,
        ),
      ],
    );
  }
}
