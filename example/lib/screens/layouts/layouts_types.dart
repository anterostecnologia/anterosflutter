import 'package:anteros_flutter_app/screens/layouts/examples/pages/container_page.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/expanded_page.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/grid/layouts_grid_types.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/grid_page.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/listview_gridview_page.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/row_column_page.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/stack_page.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/widgets/items/row_column_items.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/widgets/items/stack_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:anteros_flutter_app/screens/button/like_buttons.dart';

class LayoutsTypes extends StatefulWidget {
  @override
  _LayoutsTypesState createState() => _LayoutsTypesState();
}

class _LayoutsTypesState extends State<LayoutsTypes> {
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
            'Layouts',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ContainerPage()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      color: AnterosColors.DARK,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.40),
                            blurRadius: 5)
                      ]),
                  child: AnterosListTile(
                      color: AnterosColors.DARK,
                      title: const Text(
                        'Container',
                        style: TextStyle(color: AnterosColors.WHITE),
                      ),
                      icon: Icon(
                        CupertinoIcons.forward,
                        color: Theme.of(context).primaryColor,
                      )),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ExpandedPage()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      color: AnterosColors.DARK,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.40),
                            blurRadius: 5)
                      ]),
                  child: AnterosListTile(
                      color: AnterosColors.DARK,
                      title: const Text(
                        'Expanded',
                        style: TextStyle(color: AnterosColors.WHITE),
                      ),
                      icon: Icon(
                        CupertinoIcons.forward,
                        color: Theme.of(context).primaryColor,
                      )),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ListViewGridViewPage()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      color: AnterosColors.DARK,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.40),
                            blurRadius: 5)
                      ]),
                  child: AnterosListTile(
                      color: AnterosColors.DARK,
                      title: const Text(
                        'Listview',
                        style: TextStyle(color: AnterosColors.WHITE),
                      ),
                      icon: Icon(
                        CupertinoIcons.forward,
                        color: Theme.of(context).primaryColor,
                      )),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => RowColumnPage()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      color: AnterosColors.DARK,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.40),
                            blurRadius: 5)
                      ]),
                  child: AnterosListTile(
                      color: AnterosColors.DARK,
                      title: const Text(
                        'Row/col',
                        style: TextStyle(color: AnterosColors.WHITE),
                      ),
                      icon: Icon(
                        CupertinoIcons.forward,
                        color: Theme.of(context).primaryColor,
                      )),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => StackPage()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      color: AnterosColors.DARK,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.40),
                            blurRadius: 5)
                      ]),
                  child: AnterosListTile(
                      color: AnterosColors.DARK,
                      title: const Text(
                        'Stack',
                        style: TextStyle(color: AnterosColors.WHITE),
                      ),
                      icon: Icon(
                        CupertinoIcons.forward,
                        color: Theme.of(context).primaryColor,
                      )),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => GridPage(
                              title: "Responsive Grid",
                            )),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      color: AnterosColors.DARK,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.40),
                            blurRadius: 5)
                      ]),
                  child: AnterosListTile(
                      color: AnterosColors.DARK,
                      title: const Text(
                        'Responsive Grid',
                        style: TextStyle(color: AnterosColors.WHITE),
                      ),
                      icon: Icon(
                        CupertinoIcons.forward,
                        color: Theme.of(context).primaryColor,
                      )),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => GridLayoutsTypes()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      color: AnterosColors.DARK,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.40),
                            blurRadius: 5)
                      ]),
                  child: AnterosListTile(
                      color: AnterosColors.DARK,
                      title: const Text(
                        'Grid Layout',
                        style: TextStyle(color: AnterosColors.WHITE),
                      ),
                      icon: Icon(
                        CupertinoIcons.forward,
                        color: Theme.of(context).primaryColor,
                      )),
                ))
          ],
        ),
      );
}
