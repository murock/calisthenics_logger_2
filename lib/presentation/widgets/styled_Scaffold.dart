import 'package:calisthenics_logger_2/core/constants.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Container.dart';
import 'package:flutter/material.dart';

import 'body_text_2.dart';

class StyledScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget> completedSetDrawerItems;

  const StyledScaffold(
      {Key? key,
      required this.title,
      required this.body,
      required this.completedSetDrawerItems})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.title,
          style: Theme.of(context).textTheme.headline1,
        ),
        backgroundColor: APP_BAR_COLOUR,
      ),
      backgroundColor: Colors.transparent,
      drawer: Drawer(
        child: StyledContainer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: BodyText2('Home'),
                onTap: () {
                  Navigator.pushNamed(context, '/training');
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                leading: Icon(Icons.build),
                title: BodyText2('Tools'),
                onTap: () {
                  Navigator.pushNamed(context, '/tools');
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                leading: Icon(Icons.calendar_today_rounded),
                title: BodyText2('Calendar'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: this.completedSetDrawerItems),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
      ),
      body: this.body,
    );
  }
}
