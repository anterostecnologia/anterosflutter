import 'package:anterosflutter/anterosflutter.dart';
import 'package:anterosflutter/components/debug_inspect/src/utils/utils.dart';
import 'package:anterosflutter/components/debug_inspect/src/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart' as wdb;

/// Wraps your application in the debug inspect zone
///
/// {@tool snippet}
///
/// This sample shows how to define an app with a plugin.
///
/// ```dart
///AnterosDebugInpectView(
///  builder: (context) {
///    return const Scaffold(
///      body: Text('Your app home widget'),
///    );
///  },
/// ),
/// ```
/// {@end-tool}
class AnterosDebugInspectView extends StatefulWidget {
  AnterosDebugInspectView({
    Key? key,
    this.icon = const Icon(Icons.bug_report),
    required this.builder,
    this.enabled = kDebugMode,
    this.customActions,
  })  : _bottomSheetManager = BottomSheetManager(
          items: [],
          commonItems: [],
        ),
        super(key: key);

  /// Widget that displayed at DebugFriend action header
  final Widget icon;

  /// Should return your application widget for which DebugFriend is applied
  final wdb.WidgetBuilder builder;

  /// When this field is [true] - debug friend is running in your app
  /// in other case - [AnterosDebugInspectButton] going sleep
  /// By default this field get value from const [kDebugMode]
  final bool enabled;

  /// Custom actions menu items
  /// They are shown on the 4th page of the menu
  final List<ActionCard>? customActions;

  final BottomSheetManager _bottomSheetManager;

  @override
  State<AnterosDebugInspectView> createState() =>
      _AnterosDebugInspectViewState();
}

class _AnterosDebugInspectViewState extends State<AnterosDebugInspectView> {
  @override
  void initState() {
    if (widget.enabled) {
      WidgetsBinding.instance!.addPostFrameCallback(
        (timeStamp) => _insertOverlay(context),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder.call(context);
  }

  void _insertOverlay(BuildContext context) {
    return Overlay.of(context)!.insert(
      OverlayEntry(
        builder: (context) {
          return AnterosDebugInspectButton(
            onTap: () {
              widget._bottomSheetManager.showDebugMenu(
                context,
                customActionCards: widget.customActions,
              );
            },
            child: widget.icon,
          );
        },
      ),
    );
  }
}
