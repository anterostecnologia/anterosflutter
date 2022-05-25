import 'package:anteros_flutter_app/screens/button/grouped/examples/customizable_example/customizable_example_controller.dart';
import 'package:anteros_flutter_app/screens/button/grouped/examples/customizable_example/widgets/group_button_bottom_panel.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomizableExample extends StatelessWidget {
  CustomizableExample({Key? key}) : super(key: key);
  final controller = AnterosGroupButtonController(
    onDisablePressed: (i) => debugPrint('Disable Button #$i pressed'),
  );
  final customizableController = CustomizableExampleController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: customizableController,
      builder: (context, child) {
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
              'Customizable Buttons',
              style: TextStyle(fontSize: 17),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: AnterosGroupButton(
              controller: controller,
              isRadio: false,
              buttons: customizableController.buttons
                  .map((i) => '${i + 1}')
                  .toList(),
              onSelected: (val, i, selected) =>
                  debugPrint('Button: $val index: $i $selected'),
            ),
          ),
          bottomNavigationBar: GroupButtonBottomPanel(
            controller: controller,
            customizableController: customizableController,
          ),
        );
      },
    );
  }
}
