import 'package:calisthenics_logger_2/core/util/theme.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Container.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Scaffold.dart';
import 'package:flutter/material.dart';

class TrainingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StyledScaffold.withSampleData(
      title: 'Training',
      body: StyledContainer(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                'Pull Up - Today',
                style: Theme.of(context).textTheme.headline1,
                //  style: TextStyle(color: Colors.red),
              ),
            ),
            ExerciseInput(
              mainText: '10',
              subText: 'Reps',
            ),
            ExerciseInput(
              mainText: '20',
              subText: 'kgs',
            ),
            BandDropdown(),
            AddRemoveRow(),
            Flexible(
              child: Container(
                height: 200,
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    color: Colors.white,
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(1),
                    child: RecordedExerciseItem(
                      setNum: (index + 1).toString(),
                      reps: (index + 7).toString(),
                    ),
                  ),
                ),
              ),
            )
          ],
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
        ),
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
            heroTag: null,
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.delete),
            heroTag: null,
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
          heroTag: null,
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
          heroTag: null,
        )
      ],
    );
  }
}
