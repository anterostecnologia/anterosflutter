import 'package:anteros_flutter_app/screens/snapping_sheet/shared/appbar.dart';
import 'package:anteros_flutter_app/screens/snapping_sheet/shared/default_grabbing.dart';
import 'package:anteros_flutter_app/screens/snapping_sheet/shared/dummy_background.dart';
import 'package:anteros_flutter_app/screens/snapping_sheet/shared/dummy_content.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';

class PreviewReversePage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DarkAppBar(title: "Snapping Sheet - Reverse").build(context),
      body: AnterosSnappingSheet(
        lockOverflowDrag: true,
        snappingPositions: [
          AnterosSnappingPosition.factor(
            grabbingContentOffset: AnterosGrabbingContentOffset.bottom,
            positionFactor: 1.0,
          ),
          AnterosSnappingPosition.factor(
            snappingCurve: Curves.elasticOut,
            snappingDuration: Duration(milliseconds: 1750),
            positionFactor: 0.5,
          ),
          AnterosSnappingPosition.factor(
            positionFactor: 0.1,
            grabbingContentOffset: AnterosGrabbingContentOffset.top,
          ),
        ],
        child: DummyBackgroundContent(),
        grabbingHeight: 75,
        grabbing: DefaultGrabbing(
          reverse: true,
        ),
        sheetAbove: AnterosSnappingSheetContent(
          childScrollController: _scrollController,
          draggable: true,
          child: DummyContent(
            reverse: true,
            controller: _scrollController,
          ),
        ),
      ),
    );
  }
}
