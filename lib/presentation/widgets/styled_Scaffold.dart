import 'package:calisthenics_logger_2/core/constants.dart';
import 'package:calisthenics_logger_2/presentation/widgets/drawer_section.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Container.dart';
import 'package:flutter/material.dart';

import 'body_text_2.dart';

class StyledScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget> completedSetDrawerItems;
  final List<Widget> appBarActions;

  factory StyledScaffold.withSampleData(
      {required String title, required Widget body}) {
    return new StyledScaffold(
      title: title,
      body: body,
      completedSetDrawerItems: createSampleDrawerItems(),
    );
  }

  StyledScaffold(
      {Key? key,
      required this.title,
      required this.body,
      required this.completedSetDrawerItems,
      this.appBarActions = const []})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.title,
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: this.appBarActions,
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
                  Navigator.pushNamed(context, '/');
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
                  Navigator.pushNamed(context, '/calender');
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
              ),
              ListTile(
                leading: Icon(Icons.add),
                title: BodyText2('Add Exercise'),
                onTap: () {
                  Navigator.pushNamed(context, '/search');
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

  static List<Widget> createSampleDrawerItems() {
    return [
      DrawerSection('Hollow Body', '5 Sets'),
      DrawerSection('Pull Ups', '3 Sets'),
      DrawerSection('Pistol Squats', '3 Sets'),
      DrawerSection('Human Flag', '3 Sets'),
    ];
  }
}
