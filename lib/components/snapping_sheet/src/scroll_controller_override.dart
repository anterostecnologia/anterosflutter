import 'package:anterosflutter/anterosflutter.dart';
import 'package:anterosflutter/components/snapping_sheet/src/sheet_size_calculator.dart';
import 'package:anterosflutter/components/snapping_sheet/src/snapping_calculator.dart';
import 'package:flutter/widgets.dart';

class AnterosScrollControllerOverride extends StatefulWidget {
  final AnterosSheetSizeCalculator sizeCalculator;
  final ScrollController scrollController;
  final AnterosSheetLocation sheetLocation;
  final Widget child;

  final Function(double) dragUpdate;
  final VoidCallback dragEnd;
  final double currentPosition;
  final AnterosSnappingCalculator snappingCalculator;
  final Axis axis;

  AnterosScrollControllerOverride({
    required this.sizeCalculator,
    required this.scrollController,
    required this.dragUpdate,
    required this.dragEnd,
    required this.currentPosition,
    required this.snappingCalculator,
    required this.child,
    required this.sheetLocation,
    required this.axis,
  });

  @override
  _AnterosScrollControllerOverrideState createState() =>
      _AnterosScrollControllerOverrideState();
}

class _AnterosScrollControllerOverrideState
    extends State<AnterosScrollControllerOverride> {
  AnterosDragDirection? _currentDragDirection;
  double _currentLockPosition = 0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.removeListener(_onScrollUpdate);
    widget.scrollController.addListener(_onScrollUpdate);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScrollUpdate);
    super.dispose();
  }

  void _onScrollUpdate() {
    if (!_allowScrolling) _lockScrollPosition(widget.scrollController);
  }

  void _overrideScroll(double dragAmount) {
    if (!_allowScrolling) widget.dragUpdate(dragAmount);
  }

  void _setLockPosition() {
    if (_currentDragDirection == AnterosDragDirection.up &&
            widget.sheetLocation == AnterosSheetLocation.below ||
        _currentDragDirection == AnterosDragDirection.down &&
            widget.sheetLocation == AnterosSheetLocation.above) {
      _currentLockPosition = widget.scrollController.position.pixels;
    } else {
      _currentLockPosition = 0;
    }
  }

  bool get _allowScrolling {
    if (widget.sheetLocation == AnterosSheetLocation.below) {
      if (_currentDragDirection == AnterosDragDirection.up) {
        if (widget.currentPosition >= _biggestSnapPos)
          return true;
        else
          return false;
      }
      if (_currentDragDirection == AnterosDragDirection.down) {
        if (widget.scrollController.position.pixels > 0) return true;
        if (widget.currentPosition <= _smallestSnapPos)
          return true;
        else
          return false;
      }
    }

    if (widget.sheetLocation == AnterosSheetLocation.above) {
      if (_currentDragDirection == AnterosDragDirection.down) {
        if (widget.currentPosition <= _smallestSnapPos) {
          return true;
        } else
          return false;
      }
      if (_currentDragDirection == AnterosDragDirection.up) {
        if (widget.scrollController.position.pixels > 0) return true;
        if (widget.currentPosition >= _biggestSnapPos)
          return true;
        else
          return false;
      }
    }

    return false;
  }

  double get _biggestSnapPos =>
      widget.snappingCalculator.getBiggestPositionPixels();
  double get _smallestSnapPos =>
      widget.snappingCalculator.getSmallestPositionPixels();

  void _lockScrollPosition(ScrollController controller) {
    controller.position.setPixels(_currentLockPosition);
  }

  void _setDragDirection(double dragAmount) {
    this._currentDragDirection =
        dragAmount > 0 ? AnterosDragDirection.down : AnterosDragDirection.up;
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: (dragEvent) {
        final dragValue = widget.axis == Axis.horizontal
            ? -dragEvent.delta.dx
            : dragEvent.delta.dy;
        _setDragDirection(dragValue);
        _setLockPosition();
        _overrideScroll(dragValue);
      },
      onPointerUp: (_) {
        if (!_allowScrolling)
          widget.scrollController.jumpTo(_currentLockPosition);
        widget.dragEnd();
      },
      child: widget.child,
    );
  }
}
