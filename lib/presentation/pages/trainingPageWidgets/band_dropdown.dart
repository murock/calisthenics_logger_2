import 'package:flutter/material.dart';

class BandDropdown extends StatefulWidget {
  const BandDropdown({
    Key? key,
  }) : super(key: key);

  @override
  _BandDropdownState createState() => _BandDropdownState();
}

class _BandDropdownState extends State<BandDropdown> {
  String? dropdownValue = 'Red';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          dropdownColor: Colors.black,
          //  style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.red.shade900,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Green', 'Purple', 'Black', 'Red']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Text(
          'Band',
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }
}
