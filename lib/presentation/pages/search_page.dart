import 'package:calisthenics_logger_2/presentation/widgets/body_text_2.dart';
import 'package:calisthenics_logger_2/presentation/widgets/headline_text_2.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Container.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Scaffold.dart';
import 'package:calisthenics_logger_2/presentation/widgets/sub_title_text_2.dart';
import 'package:flutter/material.dart';

List<String> progressions = [
  'Standalone',
  'Pistol Squat',
  'L-Sit',
  'Back Lever',
  'Front Lever',
  'Planche',
  'Muscle up',
  'Handstand',
  'Human Flag',
];

List<String> muscleGroups = [
  'Shoulders',
  'Triceps',
  'Biceps',
  'Chest',
  'Back',
  'Legs',
  'Abs',
  'Cardio',
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
                items: progressions,
              ),
              FilterDropDown(
                title: 'Muscle Group',
                items: muscleGroups,
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
  final List<String> items;
  final String title;
  const FilterDropDown({
    Key? key,
    required this.items,
    required this.title,
  }) : super(key: key);

  @override
  _FilterDropDownState createState() => _FilterDropDownState();
}

class _FilterDropDownState extends State<FilterDropDown> {
  List<FilterItem> filterItems = [];
  List<String> selectedProgressions = [];

  List<FilterItem> createFilterItems(List<String> itemList) {
    List<FilterItem> result = [];
    itemList.forEach((item) {
      bool selected = false;
      if (selectedProgressions.contains(item)) {
        selected = true;
      }
      result.add(FilterItem(
        text: item,
        addSelectedItem: addSelectedItem,
        removeSelectedItem: removeSelectedItem,
        selected: selected,
      ));
    });
    return result;
  }

  addSelectedItem(String item) {
    setState(() {
      selectedProgressions.add(item);
    });
  }

  removeSelectedItem(String item) {
    setState(() {
      if (selectedProgressions.contains(item)) {
        selectedProgressions.remove(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    filterItems = createFilterItems(this.widget.items);
    return ExpansionTile(
        title: Row(
          children: [
            SubTitleText2(this.widget.title),
            SizedBox(width: 10),
            Expanded(child: HeadlineText2(selectedProgressions.join(', '))),
          ],
        ),
        children: [
          Wrap(
            children: filterItems, //this.widget.children,
          ),
        ]);
  }
}

class FilterItem extends StatefulWidget {
  final String text;
  final bool selected;
  final addSelectedItem;
  final removeSelectedItem;

  const FilterItem({
    Key? key,
    required this.text,
    this.selected = false,
    this.addSelectedItem,
    this.removeSelectedItem,
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
              if (this.isSelected!) {
                widget.addSelectedItem(widget.text);
              } else {
                widget.removeSelectedItem(widget.text);
              }
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
