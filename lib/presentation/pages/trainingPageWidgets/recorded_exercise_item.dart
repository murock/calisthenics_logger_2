import 'package:calisthenics_logger_2/core/constants.dart';
import 'package:flutter/material.dart';

class RecordedExerciseItem extends StatelessWidget {
  final int setNum;
  final int reps;
  final double weight;
  final int holdTime;
  final String band;
  final String tempo;
  final String tool;
  final int rest;
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
    row.add(FieldText(field: setNum.toString()));
    if (_isIntFieldPopulated(reps) && _isFieldPopulated(cluster)) {
      String combinedField = reps.toString() + cluster;
      row.add(FieldText(
        field: combinedField,
        suffix: 'reps',
      ));
    } else if (_isIntFieldPopulated(reps)) {
      row.add(FieldText(
        field: reps.toString(),
        suffix: 'reps',
      ));
    }
    if (_isDoubleFieldPopulated(weight)) {
      row.add(FieldText(
        field: weight.toString(),
        suffix: 'kgs',
      ));
    }
    if (_isIntFieldPopulated(holdTime)) {
      row.add(FieldText(
        field: holdTime.toString(),
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
    if (_isIntFieldPopulated(rest)) {
      row.add(FieldText(
        field: rest.toString(),
        suffix: 's rest',
        hasSpace: false,
      ));
    }
    return row;
  }

  bool _isDoubleFieldPopulated(double field) {
    if (field != UNPOPULATED_DOUBLE_VALUE) {
      return true;
    }
    return false;
  }

  bool _isIntFieldPopulated(int field) {
    if (field != UNPOPULATED_INT_VALUE) {
      return true;
    }
    return false;
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
    this.hasSpace = true,
  }) : super(key: key);

  final String? field;
  final String? suffix;
  final bool hasSpace;

  @override
  Widget build(BuildContext context) {
    if (field == '') {
      return Container();
    }
    String? displayText = '$field';
    if (suffix != null) {
      if (hasSpace) {
        displayText += ' $suffix';
      } else {
        displayText += suffix!;
      }
    }
    return Text(
      '$displayText',
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
