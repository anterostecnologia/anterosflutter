import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowItemPage extends StatefulWidget {
  RowItemPage({Key? key}) : super(key: key);

  @override
  State<RowItemPage> createState() => _RowItemPageState();
}

class _RowItemPageState extends State<RowItemPage> {
  Widget get _spacer => SizedBox(height: 12);
  Widget get _cardSpacer => SizedBox(height: 4);
  bool _darkMode = false;

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
          'Row Item example',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Column(children: <Widget>[
            AnterosCard(
              margin: EdgeInsets.all(14),
              boxFit: BoxFit.cover,
              content: Padding(
                padding: EdgeInsets.all(4),
                child: Column(children: <Widget>[
                  AnterosRowItem.textToText('English', 'Hello'),
                  _spacer,
                  AnterosRowItem.textToText('Español', 'Hola'),
                  _spacer,
                  AnterosRowItem.textToText('English', 'Bye'),
                  _spacer,
                  AnterosRowItem.textToText('Español', 'Adiós'),
                ]),
              ),
            ),
            _cardSpacer,
            AnterosCard(
              boxFit: BoxFit.cover,
              margin: EdgeInsets.only(left: 14, right: 14),
              content: Padding(
                padding: EdgeInsets.all(4),
                child: Column(children: <Widget>[
                  AnterosRowItem.textToText(
                    'English',
                    'Hello',
                    titleStyle: TextStyle(color: Colors.blue),
                    descriptionStyle: TextStyle(fontSize: 18),
                  ),
                  _spacer,
                  AnterosRowItem.textToText(
                    'Español',
                    'Hola',
                    titleStyle: TextStyle(color: Colors.red),
                    descriptionStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  _spacer,
                  AnterosRowItem.textToText(
                    'English',
                    'Bye',
                    titleStyle: TextStyle(color: Colors.blue),
                    descriptionStyle: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  _spacer,
                  AnterosRowItem.textToText(
                    'Español',
                    'Adiós',
                    titleStyle: TextStyle(color: Colors.red),
                    descriptionStyle: TextStyle(letterSpacing: 3),
                  ),
                ]),
              ),
            ),
            _cardSpacer,
            AnterosCard(
              boxFit: BoxFit.cover,
              margin: EdgeInsets.only(left: 14, right: 14),
              content: Padding(
                padding: EdgeInsets.all(4),
                child: Column(children: <Widget>[
                  AnterosRowItem.boolean('Firefox', true),
                  _spacer,
                  AnterosRowItem.boolean(
                    'Chrome',
                    false,
                    iconStyle: IconBooleanStyle.filled,
                  ),
                  _spacer,
                  AnterosRowItem.boolean(
                    'Firefox',
                    true,
                    iconColor: Theme.of(context).accentColor,
                    iconStyle: IconBooleanStyle.filled,
                  ),
                  _spacer,
                  AnterosRowItem.boolean(
                    'Chrome',
                    false,
                    iconColor: Theme.of(context).accentColor,
                  ),
                ]),
              ),
            ),
            _cardSpacer,
            AnterosCard(
              boxFit: BoxFit.cover,
              margin: EdgeInsets.only(left: 14, right: 14),
              content: Padding(
                padding: EdgeInsets.all(4),
                child: Column(children: <Widget>[
                  AnterosRowItem.tap(
                    'Android',
                    'Click here',
                    onTap: () => print('Clicked!'),
                  ),
                  _spacer,
                  AnterosRowItem.tap(
                    'iOS',
                    'Click here',
                    onTap: () => print('Clicked!'),
                  ),
                  _spacer,
                  AnterosRowItem.tap(
                    'Windows Phone',
                    'Don\'t click',
                  ),
                  _spacer,
                  AnterosRowItem.tap(
                    'Symbian',
                    'Don\'t click',
                  ),
                ]),
              ),
            ),
            _cardSpacer,
            AnterosCard(
              boxFit: BoxFit.cover,
              margin: EdgeInsets.only(left: 14, right: 14),
              content: Padding(
                  padding: EdgeInsets.all(4),
                  child: Column(children: <Widget>[
                    AnterosRowItem.textToSwitchBool('Dark mode', _darkMode,
                        onChanged: (bool) {
                      setState(() {
                        _darkMode = bool;
                      });
                    }),
                    _spacer,
                    AnterosRowItem.iconToSwitchBool('Dark mode icon', _darkMode,
                        icon: Icons.dark_mode, onChanged: (bool) {
                      setState(() {
                        _darkMode = bool;
                      });
                    }),
                    _spacer,
                    AnterosRowItem.iconToText("Vasco", "Torcida sofrida",
                        iconSize: 24, icon: Icons.abc_outlined),
                    _spacer,
                    AnterosRowItem.iconToText("Vasco", "Torcida sofrida",
                        iconSize: 24,
                        image: AssetImage("lib/assets/images/time_vasco.png")),
                    _spacer,
                    AnterosRowItem.textToIcon("Palmeiras", "Ganhando tudo",
                        iconSize: 24,
                        image:
                            AssetImage("lib/assets/images/time_palmeiras.png")),
                  ])),
            ),
            _cardSpacer,
            AnterosCard(
              boxFit: BoxFit.cover,
              margin: EdgeInsets.only(left: 14, right: 14, bottom: 14),
              content: Padding(
                  padding: EdgeInsets.all(4),
                  child: Column(children: <Widget>[
                    AnterosRowItem.anyToText(
                      AnterosButton(
                        text: "Ação 1",
                        onPressed: () {},
                      ),
                      'Ação 2',
                    ),
                    _spacer,
                    AnterosRowItem.textToAny(
                        'Ação 1',
                        AnterosButton(
                          text: "Ação 2",
                          onPressed: () {},
                        )),
                    _spacer,
                    AnterosRowItem.anyToAny(
                        AnterosButton(
                          text: "Ação 1",
                          onPressed: () {},
                        ),
                        AnterosButton(
                          text: "Ação 2",
                          onPressed: () {},
                        )),
                  ])),
            ),
          ]),
        ],
      ),
    );
  }
}
