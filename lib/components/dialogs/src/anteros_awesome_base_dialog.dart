import 'package:flutter/material.dart';

/// Define variantes de animações de entrada
enum EntryAnimation {
  /// Aparece no centro, a animação de entrada de diálogo padrão de material, ou seja, desbotamento lento no centro da tela.
  normal,

  /// entra na tela horizontalmente da esquerda
  left,

  /// entra na tela horizontalmente a partir da direita
  right,

  /// entra na tela horizontalmente do topo
  top,

  /// entra na tela horizontalmente de baixo
  bottom,

  /// entra na tela do canto superior esquerdo
  topLeft,

  /// entra na tela do canto superior direito
  topRight,

  /// entra na tela do canto inferior esquerdo
  bottomLeft,

  /// entra na tela do canto inferior direito
  bottomRight,
}

class AnterosBaseAwesomeDialog extends StatefulWidget {
  const AnterosBaseAwesomeDialog({
    Key? key,
    required this.imageWidget,
    required this.title,
    required this.onOkButtonPressed,
    required this.description,
    required this.onlyOkButton,
    required this.onlyCancelButton,
    required this.buttonOkText,
    required this.buttonCancelText,
    required this.buttonOkColor,
    required this.buttonCancelColor,
    required this.cornerRadius,
    required this.buttonRadius,
    required this.entryAnimation,
    required this.onCancelButtonPressed,
  }) : super(key: key);

  final Widget imageWidget;
  final Text title;
  final Text? description;
  final bool onlyOkButton;
  final bool onlyCancelButton;
  final Text? buttonOkText;
  final Text? buttonCancelText;
  final Color buttonOkColor;
  final Color buttonCancelColor;
  final double buttonRadius;
  final double cornerRadius;
  final VoidCallback? onOkButtonPressed;
  final VoidCallback? onCancelButtonPressed;
  final EntryAnimation entryAnimation;

  @override
  _AnterosBaseAwesomeDialogState createState() =>
      _AnterosBaseAwesomeDialogState();
}

class _AnterosBaseAwesomeDialogState extends State<AnterosBaseAwesomeDialog>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  late Animation<Offset> _entryAnimation;

  get _start {
    switch (widget.entryAnimation) {
      case EntryAnimation.normal:
        break;
      case EntryAnimation.top:
        return const Offset(0.0, -1.0);
      case EntryAnimation.topLeft:
        return const Offset(-1.0, -1.0);
      case EntryAnimation.topRight:
        return const Offset(1.0, -1.0);
      case EntryAnimation.left:
        return const Offset(-1.0, 0.0);
      case EntryAnimation.right:
        return const Offset(1.0, 0.0);
      case EntryAnimation.bottom:
        return const Offset(0.0, 1.0);
      case EntryAnimation.bottomLeft:
        return const Offset(-1.0, 1.0);
      case EntryAnimation.bottomRight:
        return const Offset(1.0, 1.0);
    }
  }

  get _isDefaultEntryAnimation =>
      widget.entryAnimation == EntryAnimation.normal;

  @override
  void initState() {
    super.initState();
    if (!_isDefaultEntryAnimation) {
      _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
      );
      _entryAnimation =
          Tween<Offset>(begin: _start, end: const Offset(0.0, 0.0)).animate(
        CurvedAnimation(
          parent: _animationController!,
          curve: Curves.easeIn,
        ),
      )..addListener(() => setState(() {}));
      _animationController!.forward();
    }
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  Widget _buildPortraitWidget(BuildContext context, Widget imageWidget) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(widget.cornerRadius),
                topLeft: Radius.circular(widget.cornerRadius)),
            child: imageWidget,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: widget.title,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget.description,
              ),
              _buildButtonsBar(context)
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLandscapeWidget(BuildContext context, Widget imageWidget) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(widget.cornerRadius),
                bottomLeft: Radius.circular(widget.cornerRadius)),
            child: imageWidget,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: widget.title,
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: widget.description,
              ),
              _buildButtonsBar(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButtonsBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: !widget.onlyOkButton
            ? MainAxisAlignment.spaceEvenly
            : MainAxisAlignment.center,
        children: <Widget>[
          if (!widget.onlyOkButton) ...[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(widget.buttonCancelColor),
                foregroundColor:
                    MaterialStateProperty.all<Color>(widget.buttonCancelColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(widget.buttonRadius)),
                ),
              ),
              onPressed: widget.onCancelButtonPressed ??
                  () => Navigator.of(context).pop(),
              child: widget.buttonCancelText ??
                  const Text(
                    'Cancela',
                    style: TextStyle(color: Colors.white),
                  ),
            )
          ],
          if (!widget.onlyCancelButton) ...[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(widget.buttonOkColor),
                foregroundColor:
                    MaterialStateProperty.all<Color>(widget.buttonOkColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(widget.buttonRadius)),
                ),
              ),
              onPressed: widget.onOkButtonPressed,
              child: widget.buttonOkText ??
                  const Text('OK', style: TextStyle(color: Colors.white)),
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        transform: !_isDefaultEntryAnimation
            ? Matrix4.translationValues(
                _entryAnimation.value.dx * width,
                _entryAnimation.value.dy * width,
                0,
              )
            : null,
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * (isPortrait ? 0.8 : 0.6),
        child: Material(
          type: MaterialType.card,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.cornerRadius)),
          elevation: Theme.of(context).dialogTheme.elevation ?? 24.0,
          child: isPortrait
              ? _buildPortraitWidget(context, widget.imageWidget)
              : _buildLandscapeWidget(context, widget.imageWidget),
        ),
      ),
    );
  }
}
