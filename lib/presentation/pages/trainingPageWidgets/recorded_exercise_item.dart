import 'package:calisthenics_logger_2/data/datasources/database/tracked_exercise_db_helper.dart';
import 'package:flutter/material.dart';

class RecordedExerciseItem extends StatelessWidget {
  final String setNum;
  final String reps;
  final String weight;
  final String holdTime;
  final String band;
  final String tempo;
  final String tool;
  final String rest;
  final String cluster;

  const RecordedExerciseItem({
    Key? key,
    required this.setNum,
    required this.reps,
    required this.weight,
    required this.holdTime,
    required this.band,
    required this.tempo,
    required this.tool,
    required this.rest,
    required this.cluster,
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
            children: _createGridRow(),
          ),
        ),
      ),
    );
  }

  List<FieldText> _createGridRow() {
    List<FieldText> row = [];
    row.add(FieldText(field: setNum));
    if (_isFieldPopulated(reps) && _isFieldPopulated(cluster)) {
      String combinedField = reps + cluster;
      row.add(FieldText(
        field: combinedField,
        suffix: 'reps',
      ));
    } else if (_isFieldPopulated(reps)) {
      row.add(FieldText(
        field: reps,
        suffix: 'reps',
      ));
    }
    if (_isFieldPopulated(weight)) {
      row.add(FieldText(
        field: weight,
        suffix: 'kgs',
      ));
    }
    if (_isFieldPopulated(holdTime)) {
      row.add(FieldText(
        field: holdTime,
        suffix: 's',
      ));
    }
    if (_isFieldPopulated(band)) {
      row.add(FieldText(
        field: band,
        suffix: 'band',
      ));
    }
    if (_isFieldPopulated(tempo)) {
      row.add(FieldText(
        field: tempo,
      ));
    }
    if (_isFieldPopulated(tool)) {
      row.add(FieldText(
        field: tool,
      ));
    }
    if (_isFieldPopulated(rest)) {
      row.add(FieldText(
        field: rest,
        suffix: 's rest',
      ));
    }
    return row;
  }

  bool _isFieldPopulated(String field) {
    if (field.isNotEmpty && field != '-') {
      return true;
    }
    return false;
  }
}

class FieldText extends StatelessWidget {
  const FieldText({
    Key? key,
    required this.field,
    this.suffix,
  }) : super(key: key);

  final String? field;
  final String? suffix;

  @override
  Widget build(BuildContext context) {
    if (field == '') {
      return Container();
    }
    String? displayText = '$field';
    if (suffix != null) {
      displayText += ' $suffix';
    }
    return Text(
      '$displayText',
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
