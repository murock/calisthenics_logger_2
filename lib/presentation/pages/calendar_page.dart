import 'package:calisthenics_logger_2/presentation/widgets/styled_Container.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Scaffold.dart';
import 'package:calisthenics_logger_2/presentation/widgets/workout_list.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:calisthenics_logger_2/core/constants.dart';
import 'dart:collection';

final dateNow = DateTime.now();

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

final kEvents = LinkedHashMap<DateTime, List>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = {
  DateTime.now(): [
    _examplePullUpData,
    _examplePushUpData,
    _exampleDeadliftData,
  ],
};

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with TickerProviderStateMixin {
  late final ValueNotifier<List> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
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
              child: ValueListenableBuilder<List>(
                valueListenable: _selectedEvents,
                builder: (context, value, _) {
                  return WorkoutList(
                    exerciseData: value,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableCalendar() {
    return TableCalendar(
      firstDay: DateTime(2021, 1, 1),
      lastDay: DateTime(dateNow.year + 1, dateNow.month, dateNow.day),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      calendarFormat: _calendarFormat,
      eventLoader: _getEventsForDay,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedDecoration: const BoxDecoration(
          color: CONTRAST_COLOUR,
          shape: BoxShape.circle,
        ),
        todayDecoration: const BoxDecoration(
          color: CONTRAST_COLOUR_LIGHTER,
          shape: BoxShape.circle,
        ),
        markerDecoration: const BoxDecoration(
          color: Color(0xFF616161),
          shape: BoxShape.circle,
        ),
        outsideDaysVisible: false,
        weekendTextStyle: TextStyle().copyWith(color: Colors.white),
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
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onDaySelected: _onDaySelected,
    );
  }
}
