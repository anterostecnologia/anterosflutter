import 'package:anteros_flutter_app/screens/button/grouped/examples/button_builder_example/example.dart';
import 'package:anteros_flutter_app/screens/button/grouped/examples/common_example/example.dart';
import 'package:anteros_flutter_app/screens/button/grouped/examples/customizable_example/customizable_example.dart';
import 'package:anteros_flutter_app/screens/button/grouped/examples/extended_example/example.dart';
import 'package:anteros_flutter_app/screens/button/grouped/examples/full_options_example/full_options_example.dart';
import 'package:anteros_flutter_app/screens/button/grouped/examples/generics_example/generics_example.dart';
import 'package:anteros_flutter_app/screens/button/grouped/examples/styles_example/example.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anterosflutter/anterosflutter.dart';

class GroupedButtonTypes extends StatefulWidget {
  @override
  _GroupedButtonTypesState createState() => _GroupedButtonTypesState();
}

class _GroupedButtonTypesState extends State<GroupedButtonTypes> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: AnterosColors.DARK,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Icon(
                CupertinoIcons.back,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          title: const Text(
            'Grouped Buttons',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            makeButtons(context, 'Commons Buttons', CommonExample()),
            makeButtons(context, 'Generics Buttons', GenericsExample()),
            makeButtons(
                context, 'Full options selected', FullOptionsSelectedExample()),
            makeButtons(context, 'Button Builder', ButtonBuilderExample()),
            makeButtons(context, 'Customizable', CustomizableExample()),
            makeButtons(context, 'Styles Buttons', StylesExample()),
            makeButtons(
                context, 'Extended Buttons', GroupButtonExtendedExample()),
          ],
        ),
      );

  GestureDetector makeButtons(
      BuildContext context, String title, Widget pageButton) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => pageButton),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            color: AnterosColors.DARK,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.40), blurRadius: 5)
            ]),
        child: AnterosListTile(
          color: AnterosColors.DARK,
          title: Text(
            title,
            style: TextStyle(color: AnterosColors.WHITE),
          ),
          icon: Icon(
            CupertinoIcons.forward,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
