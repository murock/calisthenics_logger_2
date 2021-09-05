import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef void IntCallback(num val);

class ExerciseInput extends StatefulWidget {
  final int value;
  final String subText;
  final IntCallback valueCallback;

  const ExerciseInput({
    Key? key,
    required this.value,
    required this.subText,
    required this.valueCallback,
  }) : super(key: key);

  @override
  _ExerciseInputState createState() => _ExerciseInputState();
}

class _ExerciseInputState extends State<ExerciseInput> {
  late int _value;

  void _incrementValue() {
    setState(() {
      _value++;
    });
    this.widget.valueCallback(_value);
  }

  void _decrementValue() {
    setState(() {
      _value--;
    });
    this.widget.valueCallback(_value);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _value = this.widget.value;
    this.widget.valueCallback(_value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 100),
          child: FloatingActionButton(
            onPressed: _decrementValue,
            child: const Icon(Icons.remove),
            heroTag: null,
          ),
        ),
        Expanded(
          child: Column(
            children: [
              TextFormField(
                controller: TextEditingController(text: _value.toString()),
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
              ),
              Text(
                this.widget.subText,
                style: Theme.of(context).textTheme.subtitle2,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 100),
          child: FloatingActionButton(
            onPressed: _incrementValue,
            child: const Icon(Icons.add),
            heroTag: null,
          ),
        )
      ],
    );
  }
}
