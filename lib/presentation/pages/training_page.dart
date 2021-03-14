import 'package:calisthenics_logger_2/core/constants.dart';
import 'package:calisthenics_logger_2/core/util/theme.dart';
import 'package:flutter/material.dart';

class TrainingPage extends StatelessWidget {
  Color? gradientStart = Colors.indigo[900]; //Change start gradient color here
  Color? gradientEnd = Colors.blueGrey[900]; //Change end gradient color here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Training Page"),
      // ),
      body: new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [START_GRADIENT_COLOUR, END_GRADIENT_COLOUR],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: new Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  'Pull Up',
                  style: Theme.of(context).textTheme.headline1,
                  //  style: TextStyle(color: Colors.red),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ExerciseInput(
                mainText: '10',
                subText: 'Reps',
              ),
              SizedBox(
                height: 40,
              ),
              ExerciseInput(
                mainText: '20',
                subText: 'kgs',
              ),
              SizedBox(
                height: 40,
              ),
              BandDropdown(),
              SizedBox(
                height: 40,
              ),
              AddRemoveRow(),
              Container(
                height: 100,
                child: ListView(
                  children: [
                    RecordedExerciseItem(setNum: '1', reps: '8  '),
                    RecordedExerciseItem(setNum: '2', reps: '9  '),
                    RecordedExerciseItem(setNum: '3', reps: '10'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RecordedExerciseItem extends StatelessWidget {
  final String? reps;
  final String? setNum;
  const RecordedExerciseItem({
    Key? key,
    @required this.reps,
    this.setNum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$setNum',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  '$reps reps',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  '20kgs',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  'Red band',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          )
          // Text(
          //   '1    $reps Reps    20kgs    Red band',
          //   style: Theme.of(context).textTheme.bodyText1,
          // ),
          ),
    );
  }
}

class BandDropdown extends StatefulWidget {
  const BandDropdown({
    Key? key,
  }) : super(key: key);

  @override
  _BandDropdownState createState() => _BandDropdownState();
}

class _BandDropdownState extends State<BandDropdown> {
  String? dropdownValue = 'Red';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          dropdownColor: Colors.black,
          //  style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.red.shade900,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Green', 'Purple', 'Black', 'Red']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Text(
          'Band',
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }
}

class AddRemoveRow extends StatelessWidget {
  const AddRemoveRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: pinkTheme(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}

class ExerciseInput extends StatelessWidget {
  final String mainText;
  final String subText;

  const ExerciseInput({
    Key? key,
    required this.mainText,
    required this.subText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.remove),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Text(
                this.mainText,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                this.subText,
                style: Theme.of(context).textTheme.subtitle2,
              )
            ],
          ),
        ),
        FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        )
      ],
    );
  }
}
