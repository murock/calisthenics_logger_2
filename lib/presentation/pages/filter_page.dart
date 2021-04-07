import 'package:calisthenics_logger_2/presentation/widgets/styled_Container.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Scaffold.dart';
import 'package:calisthenics_logger_2/presentation/widgets/sub_title_text_2.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StyledScaffold.withSampleData(
      title: 'Filter',
      body: StyledContainer(
        child: Column(
          children: [
            SubTitleText2('Progression'),
            Expanded(
              child: Wrap(
                children: [
                  Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        print('Card tapped');
                      },
                      child: Text(
                        'Handstand',
                        textWidthBasis: TextWidthBasis.longestLine,
                      ),
                    ),
                  ),
                  Card(
                    child: Text(
                      'Human Flag',
                      textWidthBasis: TextWidthBasis.longestLine,
                    ),
                  ),
                  Card(
                    child: FilterItem(),
                  ),
                ],
              ),
            ),
            SubTitleText2('Muscle Group')
          ],
        ),
      ),
    );
  }
}

class FilterItem extends StatefulWidget {
  const FilterItem({
    Key? key,
  }) : super(key: key);

  @override
  _FilterItemState createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Card(
        child: ListTile(
          title: Text(
            'Back Lever',
            textWidthBasis: TextWidthBasis.longestLine,
          ),
          onTap: () {
            this.isSelected = !this.isSelected;
            print(this.isSelected);
            setState(() {});
          },
          selected: this.isSelected,
          tileColor: Colors.red,
        ),
      ),
    );
  }
}
