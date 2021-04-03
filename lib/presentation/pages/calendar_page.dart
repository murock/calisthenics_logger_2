import 'package:calisthenics_logger_2/presentation/widgets/styled_Container.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Scaffold.dart';
import 'package:calisthenics_logger_2/presentation/widgets/workout_list.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:calisthenics_logger_2/core/constants.dart';

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
    ExerciseData _examplePullUpData =
        new ExerciseData('Pull Up', 4, DateTime.now(), [
      ExerciseRowData('1', '4', '5', '', 'wide'),
      ExerciseRowData('2', '5', '5', '', 'wide'),
      ExerciseRowData('3', '4', '10', '', 'wide'),
    ]);

    ExerciseData _examplePushUpData =
        new ExerciseData('Push Up', 3, DateTime.now(), [
      ExerciseRowData('1', '15', '', 'red', ''),
      ExerciseRowData('2', '20', '', 'purple', ''),
    ]);

    ExerciseData _exampleDeadliftData =
        new ExerciseData('Deadlift', 3, DateTime.now(), [
      ExerciseRowData('1', '15', '5', '', ''),
      ExerciseRowData('2', '20', '15', '', ''),
      ExerciseRowData('3', '15', '25', '', ''),
      ExerciseRowData('4', '20', '125', '', ''),
    ]);

    _events = {
      _selectedDay.subtract(Duration(days: 0)): [
        _examplePullUpData,
        _examplePushUpData,
        _exampleDeadliftData,
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
    return StyledScaffold.withSampleData(
      title: 'Calendar',
      body: StyledContainer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _buildTableCalendar(),
            Expanded(
              child: WorkoutList(
                exerciseData: _selectedEvents,
              ),
            ),
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
}
