import 'package:anteros_flutter_app/screens/snapping_sheet/shared/appbar.dart';
import 'package:anteros_flutter_app/screens/snapping_sheet/shared/default_grabbing.dart';
import 'package:anteros_flutter_app/screens/snapping_sheet/shared/dummy_background.dart';
import 'package:anteros_flutter_app/screens/snapping_sheet/shared/dummy_content.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';

class PreviewPage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DarkAppBar(title: "Snapping Sheet").build(context),
      body: AnterosSnappingSheet(
        lockOverflowDrag: true,
        snappingPositions: [
          AnterosSnappingPosition.factor(
            positionFactor: 0.0,
            grabbingContentOffset: AnterosGrabbingContentOffset.top,
          ),
          AnterosSnappingPosition.factor(
            snappingCurve: Curves.elasticOut,
            snappingDuration: Duration(milliseconds: 1750),
            positionFactor: 0.5,
          ),
          AnterosSnappingPosition.factor(positionFactor: 0.9),
        ],
        child: DummyBackgroundContent(),
        grabbingHeight: 75,
        grabbing: DefaultGrabbing(),
        sheetBelow: AnterosSnappingSheetContent(
          childScrollController: _scrollController,
          draggable: true,
          child: DummyContent(
            controller: _scrollController,
          ),
        ),
      ),
    );
  }
}
