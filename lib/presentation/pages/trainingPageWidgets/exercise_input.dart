import 'package:flutter/material.dart';

class ExerciseInput extends StatelessWidget {
  final int value;
  final String subText;

  const ExerciseInput({
    Key? key,
    required this.value,
    required this.subText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 100),
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.remove),
            heroTag: null,
          ),
        ),
        Column(
          children: [
            Text(
              this.value.toString(),
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              this.subText,
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 100),
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
            heroTag: null,
          ),
        )
      ],
    );
  }
}
