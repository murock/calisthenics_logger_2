import 'package:calisthenics_logger_2/core/constants.dart';
import 'package:flutter/material.dart';

class TrainingMenu extends StatefulWidget {
  final bool includeReps;
  final bool includeTime;
  final bool includeTools;
  final bool includeBand;
  final bool includeWeight;
  final bool includeTempo;
  final bool includeCluster;
  TrainingMenu({
    Key? key,
    this.includeReps = false,
    this.includeTime = false,
    this.includeTools = false,
    this.includeBand = false,
    this.includeWeight = false,
    this.includeTempo = false,
    this.includeCluster = false,
  }) : super(key: key);

  @override
  _TrainingMenuState createState() => _TrainingMenuState();
}

class _TrainingMenuState extends State<TrainingMenu> {
  late List<bool> checkedList;

  @override
  void initState() {
    super.initState();
    checkedList = [
      widget.includeReps,
      widget.includeTime,
      widget.includeTools,
      widget.includeBand,
      widget.includeWeight,
      widget.includeTempo,
      widget.includeCluster,
    ];
  }

  _toggleValue(int i) {
    setState(() {
      if (checkedList.length > i) {
        checkedList[i] = !checkedList[i];
      }
    });
  }

  _test() {
    setState(() {
      checkedList[0] = !checkedList[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(itemBuilder: (context) {
      return ['Reps', 'Time', 'Tools', 'Band', 'Weighted', 'Tempo', 'Cluster']
          .asMap()
          .map((i, choice) => MapEntry(
                i,
                PopupMenuItem(
                  child: StatefulBuilder(
                    builder: (_context, _setState) => CheckboxListTile(
                      activeColor: CONTRAST_COLOUR,
                      value: this.checkedList[i],
                      onChanged: (value) =>
                          _setState(() => this.checkedList[i] = value!),
                      title: Text(
                        choice,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ),
                  value: choice,
                ),
              ))
          .values
          .toList();
    });
  }
}
