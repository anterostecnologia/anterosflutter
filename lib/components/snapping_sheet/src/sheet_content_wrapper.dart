import 'package:anterosflutter/anterosflutter.dart';
import 'package:anterosflutter/components/snapping_sheet/src/on_drag_wrapper.dart';
import 'package:anterosflutter/components/snapping_sheet/src/scroll_controller_override.dart';
import 'package:anterosflutter/components/snapping_sheet/src/sheet_size_calculator.dart';
import 'package:anterosflutter/components/snapping_sheet/src/snapping_calculator.dart';
import 'package:flutter/widgets.dart';

class AnterosSheetContentWrapper extends StatefulWidget {
  final AnterosSheetSizeCalculator sizeCalculator;
  final AnterosSnappingSheetContent? sheetData;

  final Function(double) dragUpdate;
  final VoidCallback dragEnd;
  final double currentPosition;
  final AnterosSnappingCalculator snappingCalculator;
  final Axis axis;

  const AnterosSheetContentWrapper(
      {Key? key,
      required this.sheetData,
      required this.sizeCalculator,
      required this.currentPosition,
      required this.snappingCalculator,
      required this.dragUpdate,
      required this.dragEnd,
      required this.axis})
      : super(key: key);

  @override
  _AnterosSheetContentWrapperState createState() =>
      _AnterosSheetContentWrapperState();
}

class _AnterosSheetContentWrapperState
    extends State<AnterosSheetContentWrapper> {
  Widget _wrapWithDragWrapper(Widget child) {
    return AnterosOnDragWrapper(
      axis: widget.axis,
      dragEnd: widget.dragEnd,
      child: child,
      dragUpdate: widget.dragUpdate,
    );
  }

  Widget _wrapWithScrollControllerOverride(Widget child) {
    return AnterosScrollControllerOverride(
      axis: widget.axis,
      sizeCalculator: widget.sizeCalculator,
      scrollController: widget.sheetData!.childScrollController!,
      dragUpdate: widget.dragUpdate,
      dragEnd: widget.dragEnd,
      currentPosition: widget.currentPosition,
      snappingCalculator: widget.snappingCalculator,
      sheetLocation: widget.sheetData!.location,
      child: child,
    );
  }

  Widget _wrapWithNecessaryWidgets(Widget child) {
    Widget wrappedChild = child;
    if (widget.sheetData!.draggable) {
      if (widget.sheetData!.childScrollController != null) {
        wrappedChild = _wrapWithScrollControllerOverride(wrappedChild);
      } else {
        wrappedChild = _wrapWithDragWrapper(wrappedChild);
      }
    }
    return wrappedChild;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.sheetData == null) return SizedBox();
    return widget.sizeCalculator.positionWidget(
      child: _wrapWithNecessaryWidgets(widget.sheetData!.child),
    );
  }
}
