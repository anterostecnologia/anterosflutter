import 'package:anteros_flutter_app/screens/snapping_sheet/pages/menu.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnappingSheetScreen extends StatelessWidget {
  final ScrollController listViewController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return AnterosSnappingSheet(
      child: Background(),
      lockOverflowDrag: true,
      snappingPositions: [
        AnterosSnappingPosition.factor(
          positionFactor: 0.0,
          snappingCurve: Curves.easeOutExpo,
          snappingDuration: Duration(seconds: 1),
          grabbingContentOffset: AnterosGrabbingContentOffset.top,
        ),
        AnterosSnappingPosition.factor(
          snappingCurve: Curves.elasticOut,
          snappingDuration: Duration(milliseconds: 1750),
          positionFactor: 0.5,
        ),
        AnterosSnappingPosition.factor(
          grabbingContentOffset: AnterosGrabbingContentOffset.bottom,
          snappingCurve: Curves.easeInExpo,
          snappingDuration: Duration(seconds: 1),
          positionFactor: 0.9,
        ),
      ],
      grabbing: GrabbingWidget(),
      grabbingHeight: 75,
      sheetAbove: null,
      sheetBelow: AnterosSnappingSheetContent(
        draggable: true,
        childScrollController: listViewController,
        child: Container(
          color: Colors.white,
          child: ListView.builder(
            controller: listViewController,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(15),
                color: Colors.green[200],
                height: 100,
                child: Center(
                  child: Text(index.toString()),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Widgets below are just helper widgets for this example

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Placeholder(
        color: Colors.green[200]!,
      ),
    );
  }
}

class GrabbingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(blurRadius: 25, color: Colors.black.withOpacity(0.2)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            width: 100,
            height: 7,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Container(
            color: Colors.grey[200],
            height: 2,
            margin: EdgeInsets.all(15).copyWith(top: 0, bottom: 0),
          )
        ],
      ),
    );
  }
}

class PageWrapperSnappingSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          'Snapping sheet',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Menu();
                }),
              ),
            },
          )
        ],
      ),
      body: SnappingSheetScreen(),
    );
  }
}
