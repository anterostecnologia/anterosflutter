import 'package:anteros_flutter_app/screens/button/grouped/grouped_buttons_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:anteros_flutter_app/screens/button/like_buttons.dart';
import 'icon_buttons.dart';
import 'pill_buttons.dart';
import 'shadow_buttons.dart';
import 'social_buttons.dart';
import 'square_buttons.dart';
import 'standard_buttons.dart';

class ButtonTypes extends StatefulWidget {
  @override
  _ButtonTypesState createState() => _ButtonTypesState();
}

class _ButtonTypesState extends State<ButtonTypes> {
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
            'Buttons',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            makeButtonsNew(context, 'Grouped Buttons', GroupedButtonTypes()),
            makeButtons(context, 'Standard Buttons', StandardButtons()),
            makeButtons(context, 'Pills Buttons', PillsButtons()),
            makeButtons(context, 'Square Buttons', SquareButtons()),
            makeButtons(context, 'Shadow Buttons', ShadowButtons()),
            makeButtons(context, 'Social Buttons', SocialButtons()),
            makeButtons(context, 'Icons Buttons', IconButtons()),
            makeButtons(context, 'Social Buttons', SocialButtons()),
            makeButtons(context, 'Like Buttons', LikeButtons()),
          ],
        ),
      );

  GestureDetector makeButtons(
      BuildContext context, String title, StatefulWidget pageButton) {
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

  GestureDetector makeButtonsNew(
      BuildContext context, String title, StatefulWidget pageButton) {
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
          avatar: AnterosBadge(
            text: 'new',
            color: Color.fromARGB(255, 24, 206, 11),
            shape: AnterosBadgeShape.pills,
          ),
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
