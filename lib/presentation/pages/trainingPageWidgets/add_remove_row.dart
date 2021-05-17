import 'package:calisthenics_logger_2/core/util/theme.dart';
import 'package:calisthenics_logger_2/presentation/bloc/tracked_exercise_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRemoveRow extends StatelessWidget {
  final Function onAddClick;
  final Function onRemoveClick;

  const AddRemoveRow({
    Key? key,
    required this.onAddClick,
    required this.onRemoveClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: pinkTheme(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () => onAddClick(),
            child: const Icon(Icons.add),
            heroTag: null,
          ),
          FloatingActionButton(
            onPressed: () => onRemoveClick(),
            child: const Icon(Icons.delete),
            heroTag: null,
          ),
        ],
      ),
    );
  }
}
