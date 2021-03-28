import 'package:calisthenics_logger_2/presentation/pages/charts_page.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Container.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Scaffold.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:calisthenics_logger_2/core/constants.dart';

// Example holidays
final Map<DateTime, List> _holidays = {
  DateTime(2020, 1, 1): ['New Year\'s Day'],
  DateTime(2021, 3, 29): ['Epiphany'],
  DateTime(2020, 2, 14): ['Valentine\'s Day'],
  DateTime(2020, 4, 21): ['Easter Sunday'],
  DateTime(2020, 4, 22): ['Easter Monday'],
};

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

    List<ExerciseRowData> _exampleExerciseData = [
      ExerciseRowData('Pull Up', '1', '4', '5kg'),
      ExerciseRowData('Pull Up', '2', '5', '5kg'),
      ExerciseRowData('Pull Up', '3', '4', '10kg'),
    ];

    _events = {
      _selectedDay.subtract(Duration(days: 27)): [_exampleExerciseData],
      // _selectedDay.subtract(Duration(days: 30)): [
      //   'Event A0',
      //   'Event B0',
      //   'Event C0'
      // ],
      // _selectedDay.subtract(Duration(days: 27)): ['hi'],
      // _selectedDay.subtract(Duration(days: 20)): [
      //   'Event A2',
      //   'Event B2',
      //   'Event C2',
      //   'Event D2'
      // ],
      // _selectedDay.subtract(Duration(days: 16)): ['Event A3', 'Event B3'],
      // _selectedDay.subtract(Duration(days: 10)): [
      //   'Event A4',
      //   'Event B4',
      //   'Event C4'
      // ],
      // _selectedDay.subtract(Duration(days: 4)): [
      //   'Event A5',
      //   'Event B5',
      //   'Event C5'
      // ],
      // _selectedDay.subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
      // _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
      // _selectedDay.add(Duration(days: 1)): [
      //   'Event A8',
      //   'Event B8',
      //   'Event C8',
      //   'Event D8'
      // ],
      // _selectedDay.add(Duration(days: 3)):
      //     Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
      // _selectedDay.add(Duration(days: 7)): [
      //   'Event A10',
      //   'Event B10',
      //   'Event C10'
      // ],
      // _selectedDay.add(Duration(days: 11)): ['Event A11', 'Event B11'],
      // _selectedDay.add(Duration(days: 17)): [
      //   'Event A12',
      //   'Event B12',
      //   'Event C12',
      //   'Event D12'
      // ],
      // _selectedDay.add(Duration(days: 22)): ['Event A13', 'Event B13'],
      // _selectedDay.add(Duration(days: 26)): [
      //   'Event A14',
      //   'Event B14',
      //   'Event C14'
      // ],
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
      holidays: _holidays,
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

// More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      locale: 'pl_PL',
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
        holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              color: CONTRAST_COLOUR_LIGHT, //Colors.deepOrange[300],
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
            color: Colors.amber[400],
            width: 100,
            height: 100,
            child: Text(
              '${date.day}',
              style: TextStyle().copyWith(fontSize: 16.0),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          if (holidays.isNotEmpty) {
            children.add(
              Positioned(
                right: -2,
                top: -2,
                child: _buildHolidaysMarker(),
              ),
            );
          }

          return children;
        },
      ),
      onDaySelected: (date, events, holidays) {
        _onDaySelected(date, events, holidays);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _calendarController.isSelected(date)
            ? Colors.brown[500]
            : _calendarController.isToday(date)
                ? Colors.brown[300]
                : Colors.blue[400],
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }

  Widget _buildButtons() {
    final dateTime = _events.keys.elementAt(_events.length - 2);

    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Month'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.month);
                });
              },
            ),
            RaisedButton(
              child: Text('2 weeks'),
              onPressed: () {
                setState(() {
                  _calendarController
                      .setCalendarFormat(CalendarFormat.twoWeeks);
                });
              },
            ),
            RaisedButton(
              child: Text('Week'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.week);
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        RaisedButton(
          child: Text(
              'Set day ${dateTime.day}-${dateTime.month}-${dateTime.year}'),
          onPressed: () {
            _calendarController.setSelectedDay(
              DateTime(dateTime.year, dateTime.month, dateTime.day),
              runCallback: true,
            );
          },
        ),
      ],
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Text(_extractExerciseData(event)),
                  onTap: () {
                    print('$event tapped!');
                    Navigator.pushNamed(context, '/training');
                  },
                ),
              ))
          .toList(),
    );
  }

  String _extractExerciseData(List<ExerciseRowData> data) {
    String result = data[0].exerciseName + '\n';
    data.forEach((exerciseRow) {
      String row = "";
      row += exerciseRow.setNum + '  ';
      row += exerciseRow.reps + '  ';
      row += exerciseRow.weight + '  ';
      result += row + '\n';
    });

    return result;
  }
}
