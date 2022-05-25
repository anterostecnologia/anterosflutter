import 'package:anteros_flutter_app/screens/snapping_sheet/shared/appbar.dart';
import 'package:anteros_flutter_app/screens/snapping_sheet/shared/dummy_background.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';

class PlaceholderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DarkAppBar(title: "Placeholder Example").build(context),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: AnterosSnappingSheet(
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
              snappingCurve: Curves.bounceOut,
              snappingDuration: Duration(seconds: 1),
              positionFactor: 1.0,
            ),
          ],
          child: DummyBackgroundContent(),
          grabbingHeight: 100,
          grabbing: Container(
            color: Colors.white.withOpacity(0.75),
            child: Placeholder(color: Colors.black),
          ),
          sheetAbove: AnterosSnappingSheetContent(
            draggable: true,
            child: Container(
                color: Colors.white.withOpacity(0.75),
                child: Placeholder(color: Colors.green)),
          ),
          sheetBelow: AnterosSnappingSheetContent(
            draggable: true,
            child: Container(
              color: Colors.white.withOpacity(0.75),
              child: Placeholder(color: Colors.green[800] ?? Colors.green),
            ),
          ),
        ),
      ),
    );
  }
}
