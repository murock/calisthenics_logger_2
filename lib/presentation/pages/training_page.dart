import 'package:calisthenics_logger_2/core/constants.dart';
import 'package:flutter/material.dart';

class TrainingPage extends StatelessWidget {
  Color gradientStart = Colors.indigo[900]; //Change start gradient color here
  Color gradientEnd = Colors.blueGrey[900]; //Change end gradient color here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Training Page"),
      // ),
      body: new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [START_GRADIENT_COLOUR, END_GRADIENT_COLOUR],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: new Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  'Pull Up',
                  style: Theme.of(context).textTheme.headline1,
                  //  style: TextStyle(color: Colors.red),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(Icons.remove),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Text(
                          "10",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          "Reps",
                          style: Theme.of(context).textTheme.subtitle2,
                        )
                      ],
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(Icons.add),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
