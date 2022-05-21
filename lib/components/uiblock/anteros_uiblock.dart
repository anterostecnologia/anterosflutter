library uiblock;

import 'dart:ui';

import 'package:anterosflutter/components/uiblock/default_uiblock_loader.dart';
import 'package:anterosflutter/components/uiblock/uiblock_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef AsyncChildBuilder<T> = Widget Function(
    BuildContext context, AsyncSnapshot<T> snapshot);

class AnterosUIBlock extends StatelessWidget {
  AnterosUIBlock({
    Key? key,
    required this.builder,
    required this.loadingStateFromFuture,
    this.loaderBuilder,
    this.customLoaderChild,
    this.loadingTextWidget,
    this.offset,
    this.barrierOpacity = 0.4,
    this.barrierColor = Colors.black45,
    this.canDissmiss = false,
    this.hideBuilderOnNullData = false,
  }) : super(key: key);

  /// a function to build the body of block page
  final ChildBuilder? loaderBuilder;

  /// a custom loader widget to show in place of default loader
  final Widget? customLoaderChild;

  /// show custom text widget below default loader
  final Widget? loadingTextWidget;

  /// child widget to show underneath the loader barrier
  final AsyncChildBuilder builder;

  /// Future<dynamic> to auto uiblock and unblock.
  /// Blocks UI if future.value is null
  /// Unblocks UI if future hasData or hasError
  final Future<dynamic> Function() loadingStateFromFuture;
  final double barrierOpacity;
  final Color barrierColor;
  final Offset? offset;
  final bool canDissmiss;

  /// whether to show or hide builder func data when ui is blocked
  final bool hideBuilderOnNullData;

  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: WillPopScope(
        onWillPop: () async {
          return canDissmiss;
        },
        child: FutureBuilder<dynamic>(
          future: loadingStateFromFuture(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData || snapshot.hasError) {
              return builder(context, snapshot);
            } else {
              return new Stack(
                children: [
                  !hideBuilderOnNullData
                      ? builder(context, snapshot)
                      : Container(),
                  Opacity(
                    opacity: barrierOpacity,
                    child: ModalBarrier(
                      dismissible: canDissmiss,
                      color: barrierColor,
                    ),
                  ),
                  _buildLoader(context),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoader(BuildContext context) {
    if (loaderBuilder != null) {
      return loaderBuilder!(context);
    }

    final _customLoaderChild = customLoaderChild != null
        ? customLoaderChild!
        : AnterosUIBlockDefaultLoader();

    final _loadingTextWidget =
        loadingTextWidget != null ? loadingTextWidget! : Container();

    final _defaultLoader = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _customLoaderChild,
        _loadingTextWidget,
      ],
    );

    if (offset != null) {
      return Positioned(
        child: _defaultLoader,
        left: offset!.dx,
        top: offset!.dy,
      );
    }

    return Center(
      child: _defaultLoader,
    );
  }

  /// blocks complete ui
  /// do not forget to call unblock after this
  static void block(
    BuildContext context, {
    ChildBuilder? childBuilder,
    Widget? customLoaderChild,
    Widget? loadingTextWidget,
    Color? backgroundColor,
    bool? canDissmissOnBack,
    ImageFilter? imageFilter,
    bool? safeAreaLeft,
    bool? safeAreaTop,
    bool? safeAreaRight,
    bool? safeAreaBottom,
    EdgeInsets? safeAreaMinimumPadding,
    bool? safeAreaMaintainBottomViewPadding,
    bool isSlideTransitionDefault = true,
    BuildBlockModalTransitions? customBuildBlockModalTransitions,
  }) {
    Navigator.of(context).push(
      AnterosUIBlockModal<void>(
        childBuilder: childBuilder,
        customLoaderChild: customLoaderChild,
        loadingTextWidget: loadingTextWidget,
        backgroundColor: backgroundColor,
        canDissmissOnBack: canDissmissOnBack,
        imageFilter: imageFilter,
        left: safeAreaLeft,
        top: safeAreaTop,
        right: safeAreaRight,
        bottom: safeAreaBottom,
        minimum: safeAreaMinimumPadding,
        maintainBottomViewPadding: safeAreaMaintainBottomViewPadding,
        isSlideTransitionDefault: isSlideTransitionDefault,
        buildBlockModalTransitions: customBuildBlockModalTransitions,
      ),
    );
  }

  /// unblocks previously called block
  static void unblock(BuildContext context) {
    Navigator.of(context).pop(context);
  }

  /// blocks complete ui
  /// do not forget to call unblock after this
  static Future<T?> blockWithData<T>(
    BuildContext context, {
    ChildBuilder? childBuilder,
    Widget? customLoaderChild,
    Widget? loadingTextWidget,
    Color? backgroundColor,
    ImageFilter? imageFilter,
    bool? safeAreaLeft,
    bool? safeAreaTop,
    bool? safeAreaRight,
    bool? safeAreaBottom,
    EdgeInsets? safeAreaMinimumPadding,
    bool? safeAreaMaintainBottomViewPadding,
    bool isSlideTransitionDefault = true,
    BuildBlockModalTransitions? customBuildBlockModalTransitions,
  }) async {
    return await Navigator.of(context).push<T>(
      AnterosUIBlockModal<T>(
        childBuilder: childBuilder,
        customLoaderChild: customLoaderChild,
        loadingTextWidget: loadingTextWidget,
        backgroundColor: backgroundColor,
        canDissmissOnBack: true, // this cannot be false for data routes
        imageFilter: imageFilter,
        left: safeAreaLeft,
        top: safeAreaTop,
        right: safeAreaRight,
        bottom: safeAreaBottom,
        minimum: safeAreaMinimumPadding,
        maintainBottomViewPadding: safeAreaMaintainBottomViewPadding,
        isSlideTransitionDefault: isSlideTransitionDefault,
        buildBlockModalTransitions: customBuildBlockModalTransitions,
      ),
    );
  }

  /// unblocks previously called block with return data
  static void unblockWithData(BuildContext context, dynamic onPopData) {
    Navigator.of(context).pop(onPopData);
  }
}
