import 'dart:async';
import 'package:flutter/material.dart';

class AnterosBottomSheet extends StatefulWidget {
  /// Abre a planilha de baixo como um pop-up nas planilhas atuais, tem diferentes opções de personalização.
  AnterosBottomSheet({
    Key? key,
    required this.contentBody,
    this.stickyHeader,
    this.stickyFooter,
    required this.controller,
    this.minContentHeight = 0,
    this.maxContentHeight = 300,
    this.elevation = 0.0,
    this.stickyFooterHeight = 0.0,
    this.stickyHeaderHeight = 0.0,
    this.animationDuration = 1200,
    this.enableExpandableContent = false,
  })  : assert(elevation >= 0.0),
        assert(minContentHeight >= 0.0),
        super(key: key) {
    controller.height = minContentHeight;
    controller.animationDuration = animationDuration;
  }

  /// [minContentHeight] controla a altura mínima do corpo do conteúdo.
  /// o corpo do conteúdo com [minContentHeight] é exibido apenas quando [enableExpandableContent] é false.
  /// Deve ser maior ou igual a 0. O valor padrão é 0.
  final double minContentHeight;

  /// [MaxContentHeight] controla a altura máxima do corpo de conteúdo.
  /// deve ser maior ou igual a 0. O valor padrão é 300.
  final double maxContentHeight;

  /// [Stickyheader] é o cabeçalho da Anterosbottomsheet.
  /// O usuário pode interagir deslizando ou tocando no [Stickyheader]
  final Widget? stickyHeader;

  /// [contentBody] é o corpo de AnterosBottomSheet.
  /// O usuário pode interagir deslizando ou tocando no [contentBody]
  final Widget contentBody;

  /// [stickyFooter] é o rodapé de AnterosBottomSheet.
  /// O usuário pode interagir deslizando ou tocando no [stickyFooter]
  final Widget? stickyFooter;

  /// [stickyFooterHeight] define a altura do [stickyFooter] do AnterosBottomSheet.
  final double stickyFooterHeight;

  /// [stickyHeaderHeight] define a altura do [stickyHeader] do AnterosBottomSheet.
  final double stickyHeaderHeight;

  /// [elevation] controla a sombra abaixo do material AnterosBottomSheet.
  /// Deve ser maior ou igual a 0. O valor padrão é 0.
  final double elevation;

  /// [enableExpandableContent] permite que [contentBody] se expanda.
  /// O valor padrão é false.
  final bool enableExpandableContent;

  /// [controller] usado para controlar o comportamento do AnterosBottomSheet como hide/show
  final AnterosBottomSheetController controller;

  /// Define a duração da animação de arrastar do AnterosBottomSheet
  /// O valor padrão é 300.
  final int animationDuration;

  @override
  _AnterosBottomSheetState createState() => _AnterosBottomSheetState();
}

class _AnterosBottomSheetState extends State<AnterosBottomSheet>
    with TickerProviderStateMixin {
  final StreamController<double?> _streamController =
      StreamController.broadcast();
  bool? isDragDirectionUp;
  bool showBottomSheet = false;
  late void Function() _controllerListener;
  late double position;
  bool showContent = false;

  void _onVerticalDragUpdate(data) {
    _setAnimationDuration();
    if (widget.controller.height != null &&
        ((widget.controller.height! - data.delta.dy) >
            widget.minContentHeight) &&
        ((widget.controller.height! - data.delta.dy) <
            widget.maxContentHeight)) {
      isDragDirectionUp = data.delta.dy <= 0;
      widget.controller.height = widget.controller.height! - data.delta.dy;
    }
  }

  void _onVerticalDragEnd(data) {
    _setAnimationDuration();
    if (isDragDirectionUp != null) {
      if (isDragDirectionUp! && widget.controller.value) {
        _showBottomSheet();
      } else if (!isDragDirectionUp! && !widget.controller.value) {
        _hideBottomSheet();
      } else {
        widget.controller.value = isDragDirectionUp!;
      }
    }
  }

  void _onTap() {
    final bool isBottomSheetOpened =
        widget.controller.height == widget.maxContentHeight;
    widget.controller.value = !isBottomSheetOpened;
  }

  @override
  void initState() {
    super.initState();
    position = widget.minContentHeight;
    widget.controller.value = showBottomSheet;
    _controllerListener = () {
      widget.controller.value ? _showBottomSheet() : _hideBottomSheet();
    };
    widget.controller.addListener(_controllerListener);
  }

  @override
  Widget build(BuildContext context) {
    final BottomSheetThemeData bottomSheetTheme =
        Theme.of(context).bottomSheetTheme;
    final double elevation =
        widget.elevation == 0.0 ? bottomSheetTheme.elevation ?? 0.0 : 0.0;
    final Widget bottomSheet = Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        widget.stickyHeader == null
            ? Container()
            : GestureDetector(
                onVerticalDragUpdate: _onVerticalDragUpdate,
                onVerticalDragEnd: _onVerticalDragEnd,
                onTap: _onTap,
                child: Container(
                  height: widget.stickyHeaderHeight,
                  child: widget.stickyHeader,
                ),
              ),
        !widget.enableExpandableContent
            ? AnimatedBuilder(
                animation: widget.controller,
                builder: (_, Widget? child) => AnimatedContainer(
                  curve: Curves.easeOut,
                  duration: Duration(
                      milliseconds: widget.controller.animationDuration),
                  height: widget.controller.height,
                  child: GestureDetector(
                      onVerticalDragUpdate: _onVerticalDragUpdate,
                      onVerticalDragEnd: _onVerticalDragEnd,
                      onTap: _onTap,
                      child: widget.contentBody),
                ),
              )
            : widget.controller.height == widget.minContentHeight
                ? Container()
                : StreamBuilder(
                    stream: _streamController.stream,
                    initialData: widget.controller.height,
                    builder: (BuildContext context, AsyncSnapshot snapshot) =>
                        AnimatedContainer(
                      curve: Curves.easeOut,
                      duration: Duration(
                          milliseconds: widget.controller.animationDuration),
                      height: !snapshot.hasData
                          ? widget.minContentHeight
                          : snapshot.data,
                      child: GestureDetector(
                        onVerticalDragUpdate: (DragUpdateDetails details) {
                          if (widget.controller.height != null &&
                              ((widget.controller.height! - details.delta.dy) >
                                  widget.minContentHeight) &&
                              ((widget.controller.height! - details.delta.dy) <
                                  (MediaQuery.of(context).size.height * 0.8 -
                                      widget.stickyFooterHeight -
                                      widget.stickyHeaderHeight))) {
                            isDragDirectionUp = details.delta.dy <= 0;
                            widget.controller.height =
                                widget.controller.height! - details.delta.dy;
                          }

                          _streamController.add(widget.controller.height);
                        },
                        onVerticalDragEnd: _onVerticalDragEnd,
                        onTap: _onTap,
                        behavior: HitTestBehavior.translucent,
                        child: widget.contentBody,
                      ),
                    ),
                  ),
        widget.stickyFooter == null
            ? Container()
            : AnimatedBuilder(
                animation: widget.controller,
                builder: (_, Widget? child) => AnimatedContainer(
                  curve: Curves.easeOut,
                  duration: Duration(
                      milliseconds: widget.controller.animationDuration),
                  height: widget.controller.height != widget.minContentHeight
                      ? widget.stickyFooterHeight
                      : 0.0,
                  child: GestureDetector(
                    onVerticalDragUpdate: _onVerticalDragUpdate,
                    onVerticalDragEnd: _onVerticalDragEnd,
                    onTap: _onTap,
                    child: widget.stickyFooter,
                  ),
                ),
              ),
      ],
    );
    return Material(
      elevation: elevation,
      child: bottomSheet,
    );
  }

  void _hideBottomSheet() {
    setState(() {
      showContent = false;
    });
    widget.controller.height = widget.minContentHeight;
  }

  void _showBottomSheet() {
    setState(() {
      showContent = true;
    });
    widget.controller.height = widget.maxContentHeight;
  }

  @override
  void dispose() {
    widget.controller.removeListener(_controllerListener);
    super.dispose();
  }

  void _setAnimationDuration() {
    widget.controller.animationDuration = widget.animationDuration;
  }
}

class AnterosBottomSheetController extends ValueNotifier<bool> {
  AnterosBottomSheetController() : super(false);

  /// Define a altura do contentBody do AnterosBottomSheet
  double? _height;

  /// Define a duração da animação de arrastar do AnterosBottomSheet
  late int animationDuration;

  // ignore: desnecessário_getters_setters
  set height(double? value) => _height = value;

  // ignore: desnecessário_getters_setters
  double? get height => _height;
  bool get isBottomSheetOpened => value;
  void hideBottomSheet() => value = false;
  void showBottomSheet() => value = true;
}
