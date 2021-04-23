import 'package:flutter/material.dart';

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