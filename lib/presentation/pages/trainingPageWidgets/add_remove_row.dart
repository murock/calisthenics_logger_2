import 'package:calisthenics_logger_2/core/util/theme.dart';
import 'package:calisthenics_logger_2/presentation/bloc/tracked_exercise_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            onPressed: () {
              addButtonClick(context);
            },
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

  void addButtonClick(BuildContext context) {
    BlocProvider.of<TrackedExerciseBloc>(context)
        .add(GetTrackedExerciseForDateAndName('Pull Up', DateTime.now()));
  }
}
