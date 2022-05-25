import 'package:anteros_flutter_app/screens/button/grouped/examples/extended_example/helper_widgets/helper_widgets.dart';
import 'package:anteros_flutter_app/screens/button/grouped/examples/extended_example/utils/extended_example_controller.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'radio_example_part.dart';
part 'checkbox_example_part.dart';

class GroupButtonExtendedExample extends StatefulWidget {
  @override
  GroupButtonExtendedExampleState createState() =>
      GroupButtonExtendedExampleState();
}

class GroupButtonExtendedExampleState
    extends State<GroupButtonExtendedExample> {
  Axis direction = Axis.horizontal;

  final _extendedExampleController = ExtendedExampleController();
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AnterosColors.DARK,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.back,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: const Text(
          'Extended Buttons',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                AnterosGroupButton(
                  controller: AnterosGroupButtonController(
                    selectedIndex: 0,
                    onDisablePressed: (i) =>
                        debugPrint('Disable Button #$i pressed'),
                  ),
                  options: AnterosGroupButtonOptions(
                    spacing: 7.5,
                    mainGroupAlignment: AnterosMainGroupAlignment.start,
                    groupingType: AnterosGroupingType.row,
                  ),
                  buttons: const ['Wrap', 'Column', 'Row'],
                  onSelected: (val, i, selected) {
                    _extendedExampleController.selectedGroupingType = i;
                  },
                ),
                AnterosGroupButton(
                  controller: AnterosGroupButtonController(
                    selectedIndex: 0,
                    onDisablePressed: (i) =>
                        debugPrint('Disable Button #$i pressed'),
                  ),
                  options: AnterosGroupButtonOptions(
                    mainGroupAlignment: AnterosMainGroupAlignment.start,
                    groupingType: AnterosGroupingType.row,
                    spacing: 7.5,
                  ),
                  buttons: const ['Radio', 'CheckBox'],
                  onSelected: (_, i, selected) {
                    _pageController.animateToPage(
                      i,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                    );
                  },
                ),
              ],
            ),
            AnimatedBuilder(
              animation: _extendedExampleController,
              builder: (context, child) {
                return Expanded(
                  child: PageView(
                    controller: _pageController,
                    children: _getSelectedPagesGroup(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getSelectedPagesGroup() {
    switch (_extendedExampleController.selectedGroupingType) {
      case 1:
        return [
          _buildRadioExample(AnterosGroupingType.column),
          _buildCheckboxExample(AnterosGroupingType.column),
        ];
      case 2:
        return [
          _buildRadioExample(AnterosGroupingType.row),
          _buildCheckboxExample(AnterosGroupingType.row),
        ];
      case 0:
      default:
        return [
          _buildRadioExample(AnterosGroupingType.wrap, direction: direction),
          _buildCheckboxExample(AnterosGroupingType.wrap, direction: direction),
        ];
    }
  }
}
