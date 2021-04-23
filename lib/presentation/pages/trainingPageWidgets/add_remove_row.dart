import 'package:calisthenics_logger_2/core/util/theme.dart';
import 'package:flutter/material.dart';

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
