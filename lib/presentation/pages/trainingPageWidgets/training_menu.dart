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

  _toggleValue(int i) {
    setState(() {
      print('toggling value ' + i.toString());
      if (checkedList.length > i) {
        checkedList[i] = !checkedList[i];
      }
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(itemBuilder: (_) {
      return ['Reps', 'Time', 'Tools', 'Band', 'Weighted', 'Tempo', 'Cluster']
          .asMap()
          .map((i, choice) => MapEntry(
                i,
                PopupMenuItem(
                  child: ListTile(
                    title: Text(
                      choice,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    trailing: Checkbox(
                      value: this.checkedList[i],
                      activeColor: CONTRAST_COLOUR,
                      onChanged: (bool? value) {
                        _toggleValue(i);
                      },
                    ),
                    onTap: () {
                      _toggleValue(i);
                    },
                  ),
                  // child: TextCheckbox(
                  //   text: choice,
                  //   value: this.checkedList[i],
                  // ),
                  value: choice,
                ),
              ))
          .values
          .toList();
    });
  }
}

class TextCheckbox extends StatefulWidget {
  final String text;
  bool? value;
  TextCheckbox({Key? key, required this.text, this.value = false})
      : super(key: key);

  @override
  _TextCheckboxState createState() => _TextCheckboxState();
}

class _TextCheckboxState extends State<TextCheckbox> {
  _toggleValue(bool? value) {
    setState(() {
      if (widget.value != null) {
        print('changing widget value');
        print(widget.value);
        widget.value = !widget.value!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Text(
            widget.text,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          onTap: () {
            setState(
              () {
                if (widget.value != null) {
                  print('changing widget value');
                  print(widget.value);
                  widget.value = !widget.value!;
                }
              },
            );
          },
        ),
        Checkbox(
          value: widget.value,
          activeColor: CONTRAST_COLOUR,
          onChanged: _toggleValue,
        )
      ],
    );
  }
}
