import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectableContainerPage extends StatefulWidget {
  @override
  _SelectableContainerPageState createState() =>
      _SelectableContainerPageState();
}

class _SelectableContainerPageState extends State<SelectableContainerPage> {
  bool _select1 = false;
  bool _select2 = false;
  bool _select3 = false;

  @override
  Widget build(BuildContext context) {
    var textStyles = Theme.of(context).textTheme;
    return Scaffold(
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
          'Selectable Containers',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: AnterosSelectableContainer(
              child: buildTextContentOfContainer(
                  'Selectable Container', 'Default theme colors', textStyles),
              onValueChanged: (newValue) {
                setState(() {
                  _select1 = newValue;
                });
              },
              selected: _select1,
              padding: 8.0,
            ),
          ),
          const SizedBox(height: 16.0),
          AnterosSelectableContainer(
            selectedBorderColor: Colors.teal.shade700,
            selectedBackgroundColor: Colors.grey.shade100,
            unselectedBorderColor: Colors.teal.shade600,
            unselectedBackgroundColor: Colors.grey.shade200,
            iconAlignment: Alignment.topLeft,
            icon: Icons.thumb_up,
            unselectedIcon: Icons.add_box,
            iconSize: 24,
            unselectedOpacity: 1,
            selectedOpacity: 0.8,
            selected: _select2,
            padding: 8.0,
            child: buildTextContentOfContainer('Custom color',
                'Icon, size, position en opacitiy changed', textStyles),
            onValueChanged: (newValue) {
              setState(() {
                _select2 = newValue;
              });
            },
          ),
          const SizedBox(height: 16.0),
          AnterosSelectableContainer(
            iconSize: 20,
            icon: Icons.star,
            iconColor: Colors.yellowAccent,
            unselectedOpacity: 0.3,
            opacityAnimationDuration: 300,
            elevation: 4.0,
            selected: _select3,
            child: buildDemoContent3(),
            padding: 16.0,
            onValueChanged: (newValue) {
              setState(() {
                _select3 = newValue;
              });
            },
          ),
          const SizedBox(height: 16.0),
          Expanded(child: SelectableContainerGrid()),
        ],
      ),
    );
  }

  Widget buildTextContentOfContainer(
      String title, String subtitle, TextTheme textStyles) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: textStyles.headline5,
        ),
        Text(
          subtitle,
          style: textStyles.bodyText1,
        ),
      ],
    );
  }

  Widget buildDemoContent3() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('images/flutter.png'),
              radius: 25.0,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              'Develop with Flutter',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                  color: Colors.blue.shade700),
            ),
          ],
        )
      ],
    );
  }
}

final List<Color> kGridElements = [
  Colors.amber[800]!,
  Colors.deepOrange[800]!,
  Colors.brown[400]!,
  Colors.blueGrey[400]!,
  Colors.blue[400]!,
  Colors.indigo[400]!,
];

class SelectableContainerGrid extends StatefulWidget {
  const SelectableContainerGrid({Key? key}) : super(key: key);

  @override
  _SelectableContainerGridState createState() =>
      _SelectableContainerGridState();
}

class _SelectableContainerGridState extends State<SelectableContainerGrid> {
  final List<bool> _selectedItems = [];

  @override
  void initState() {
    super.initState();
    kGridElements.forEach((element) {
      _selectedItems.add(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: _buildElements(),
    );
  }

  List<Widget> _buildElements() {
    List<Widget> ret = [];

    for (var i = 0; i < kGridElements.length; i++) {
      ret.add(AnterosSelectableContainer(
        selectedBackgroundColor: kGridElements[i],
        unselectedBackgroundColor: kGridElements[i],
        selectedBorderColor: Theme.of(context).dialogBackgroundColor,
        unselectedBorderColor: Theme.of(context).dialogBackgroundColor,
        selected: _selectedItems[i],
        unselectedIcon: Icons.check_box_outline_blank,
        icon: Icons.check_box,
        iconAlignment: Alignment.topRight,
        iconSize: 24,
        iconColor: Colors.deepOrange[400]!,
        onValueChanged: (_) {
          _valueSelected(i);
        },
        child: SizedBox(
          height: 100,
          width: 100,
          child: Image.asset(
            'lib/assets/images/dog$i.jpg',
            fit: BoxFit.fitWidth,
          ),
        ),
      ));
    }
    return ret;
  }

  void _valueSelected(int index) {
    setState(() {
      _selectedItems[index] = !_selectedItems[index];
    });
  }
}
