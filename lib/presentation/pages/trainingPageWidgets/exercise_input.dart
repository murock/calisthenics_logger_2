import 'package:flutter/material.dart';

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
