import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridPage extends StatefulWidget {
  const GridPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _GridPageState createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  int _index = 0;

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
            'Responsive Grid',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: AnterosFloatingNavbar(
          backgroundColor: Theme.of(context).primaryColor,
          onTap: (int val) => setState(() => _index = val),
          currentIndex: _index,
          items: [
            AnterosFloatingNavbarItem(icon: Icons.list, title: 'List'),
            AnterosFloatingNavbarItem(icon: Icons.table_rows, title: 'Layout'),
            AnterosFloatingNavbarItem(
                icon: Icons.align_horizontal_center, title: 'Cross Align'),
          ],
        ),
        body: getLayoutByIndex(_index));
  }

  Widget _buildGridList() {
    return AnterosGridList(
        rowMainAxisAlignment: MainAxisAlignment.center,
        desiredItemWidth: 100,
        minSpacing: 10,
        children: [
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8,
          9,
          10,
          11,
          12,
          13,
          14,
          15,
          16,
          17,
          18,
          19,
          20
        ].map((i) {
          return Container(
            height: ((i % 5) + 1) * 100.0,
            alignment: const Alignment(0, 0),
            color: Colors.cyan,
            child: Text(i.toString()),
          );
        }).toList());
  }

  Widget _buildGridLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        AnterosGridRow(
          children: [
            AnterosGridCol(
              lg: 12,
              child: Container(
                height: 100,
                alignment: const Alignment(0, 0),
                color: Colors.purple,
                child: const Text("lg : 12"),
              ),
            ),
            AnterosGridCol(
              xs: 6,
              md: 3,
              child: Container(
                height: 100,
                alignment: const Alignment(0, 0),
                color: Colors.green,
                child: const Text("xs : 6 \r\nmd : 3"),
              ),
            ),
            AnterosGridCol(
              xs: 6,
              md: 3,
              child: Container(
                height: 100,
                alignment: const Alignment(0, 0),
                color: Colors.orange,
                child: const Text("xs : 6 \r\nmd : 3"),
              ),
            ),
            AnterosGridCol(
              xs: 6,
              md: 3,
              child: Container(
                height: 100,
                alignment: const Alignment(0, 0),
                color: Colors.red,
                child: const Text("xs : 6 \r\nmd : 3"),
              ),
            ),
            AnterosGridCol(
              xs: 6,
              md: 3,
              child: Container(
                height: 100,
                alignment: const Alignment(0, 0),
                color: Colors.blue,
                child: const Text("xs : 6 \r\nmd : 3"),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGridLayout_testCrossAlign() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        AnterosGridRow(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AnterosGridCol(
              xs: 6,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    color: Colors.blue,
                    margin: const EdgeInsets.all(10),
                  ), // height 100px
                  Container(
                    height: 100,
                    color: Colors.blueGrey,
                    margin: const EdgeInsets.all(10),
                  ) // height 100px
                ],
              ),
            ),
            AnterosGridCol(
              xs: 6,
              child: Container(
                height: 400,
                color: Colors.black45,
                margin: const EdgeInsets.all(10),
              ), // height 500px
            )
          ],
        ),
      ],
    );
  }

  getLayoutByIndex(int index) {
    switch (index) {
      case 0:
        return _buildGridList();
      case 1:
        return _buildGridLayout();
      case 2:
        return _buildGridLayout_testCrossAlign();
      default:
    }
  }
}
