import 'package:calisthenics_logger_2/presentation/widgets/body_text_2.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Container.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Scaffold.dart';
import 'package:calisthenics_logger_2/presentation/widgets/sub_title_text_2.dart';
import 'package:flutter/material.dart';

List<FilterItem> progressions = [
  FilterItem(text: 'Standalone'),
  FilterItem(text: 'Pistol Squat'),
  FilterItem(
    text: 'L-Sit',
    selected: true,
  ),
  FilterItem(text: 'Back Lever'),
  FilterItem(text: 'Front Lever'),
  FilterItem(text: 'Planche'),
  FilterItem(text: 'Muscle up'),
  FilterItem(
    text: 'Handstand',
    selected: true,
  ),
  FilterItem(text: 'Human Flag'),
];

List<FilterItem> muscleGroups = [
  FilterItem(text: 'Shoulders'),
  FilterItem(text: 'Triceps'),
  FilterItem(text: 'Biceps'),
  FilterItem(text: 'Chest'),
  FilterItem(text: 'Back'),
  FilterItem(text: 'Legs'),
  FilterItem(text: 'Abs'),
  FilterItem(text: 'Cardio'),
];

List<String> allExercises = [
  'Pike Push Up',
  'Single Leg Deadlift',
  'Dragon Flag',
  'Horizontal Row',
  'Pull Up',
  'Push Up',
];

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StyledScaffold.withSampleData(
      title: 'Exercise Selection',
      body: StyledContainer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FilterDropDown(
                title: 'Progression',
                children: progressions,
              ),
              FilterDropDown(
                title: 'Muscle Group',
                children: muscleGroups,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: editingController,
                style: Theme.of(context).textTheme.bodyText2,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) =>
                      Text(allExercises[index]),
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    color: Colors.grey,
                  ),
                  itemCount: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterDropDown extends StatefulWidget {
  final List<FilterItem> children;
  final String title;
  const FilterDropDown({
    Key? key,
    required this.children,
    required this.title,
  }) : super(key: key);

  @override
  _FilterDropDownState createState() => _FilterDropDownState();
}

class _FilterDropDownState extends State<FilterDropDown> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(title: SubTitleText2(this.widget.title), children: [
      Wrap(
        children: this.widget.children,
      ),
    ]);
  }
}

class FilterItem extends StatefulWidget {
  final String text;
  final bool selected;

  const FilterItem({
    Key? key,
    required this.text,
    this.selected = false,
  }) : super(key: key);

  @override
  _FilterItemState createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  bool? isSelected;

  @override
  Widget build(BuildContext context) {
    isSelected ??= widget.selected;
    return Card(
      //elevation: 0,
      color: Colors.transparent,
      child: IntrinsicWidth(
        child: ListTile(
          title: BodyText2(widget.text),
          onTap: () {
            setState(() {
              this.isSelected = !this.isSelected!;
            });
          },
          selected: this.isSelected!,
          tileColor: Colors.transparent,
          selectedTileColor: Colors.grey.withAlpha(150),
        ),
      ),
    );
  }
}
