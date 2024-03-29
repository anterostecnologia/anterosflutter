import 'package:anterosflutter/anterosflutter.dart';
import 'package:anterosflutter/components/dialogs/src/anteros_dialog_widget.dart';
import 'package:flutter/material.dart';

class AnterosDialog {
  //================================Atributo pop -up======================================
  List<Widget> widgetList = []; //Todos os componentes dentro da janela Dialog
  static BuildContext? _context; //Contexto Dialog
  BuildContext? context; //Contexto Dialog

  double? width; //Largura Dialog
  double? height; //Aparecer
  Duration duration =
      const Duration(milliseconds: 250); //A hora da animação Dialog aparece
  AnterosDialogGravity gravity =
      AnterosDialogGravity.center; //Posição da janela instalada
  bool gravityAnimationEnable =
      false; //Se a animação padrão da posição Dialog está disponível
  Color barrierColor =
      Colors.black.withOpacity(.3); //A cor de fundo fora da janela Dialog
  BoxConstraints? constraints; //Aparecer
  Function(Widget child, Animation<double> animation)?
      animatedFunc; //Animação popular de animação
  bool barrierDismissible =
      true; //Você clica para aparecer o desaparecimento externo
  EdgeInsets margin =
      const EdgeInsets.all(0.0); //A distância externa do layout pop -up

  /// Usado para múltiplos navigator situação aninhada，O padrão é true
  /// @params useRootNavigator=false，push Ele usa o layout atual context
  /// @params useRootNavigator=true，push É um layout de raiz aninhado context
  bool useRootNavigator = true;

  Decoration? decoration; // A decoração na janela Dialog é mutuamente exclusiva
  Color backgroundColor = Colors.white; // A cor de fundo na janela Dialog
  double borderRadius = 0.0;

  Function()? showCallBack; // Exibir retorno de chamada
  Function()? dismissCallBack; // Desaparecer

  get isShowing => _isShowing; // Se a janela Dialog atual é visível
  bool _isShowing = false;

  //============================================================================
  static void init(BuildContext ctx) {
    _context = ctx;
  }

  AnterosDialog build([BuildContext? ctx]) {
    if (ctx == null && _context != null) {
      this.context = _context;
      return this;
    }
    this.context = ctx;
    return this;
  }

  AnterosDialog widget(Widget child) {
    this.widgetList.add(child);
    return this;
  }

  AnterosDialog text(
      {padding,
      text,
      color,
      fontSize,
      alignment,
      textAlign,
      maxLines,
      textDirection,
      overflow,
      fontWeight,
      fontFamily}) {
    return this.widget(
      Padding(
        padding: padding ?? EdgeInsets.all(0.0),
        child: Align(
          alignment: alignment ?? Alignment.centerLeft,
          child: Text(
            text ?? "",
            textAlign: textAlign,
            maxLines: maxLines,
            textDirection: textDirection,
            overflow: overflow,
            style: TextStyle(
              color: color ?? Colors.black,
              fontSize: fontSize ?? 14.0,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
            ),
          ),
        ),
      ),
    );
  }

  AnterosDialog singleButton(
      {padding,
      gravity,
      height,
      isClickAutoDismiss =
          true, //Depois de clicar no botão, desligue automaticamente
      withDivider = false, //Linha de segmentação intermediária
      text1,
      shape1 = AnterosButtonShape.rounded_square,
      type1 = AnterosButtonType.solid,
      size1 = AnterosSize.MEDIUM,
      color1 = AnterosColors.PRIMARY,
      icon1,
      textColor1 = Colors.white,
      fontSize1,
      fontWeight1,
      fontFamily1,
      buttonWidth1,
      VoidCallback? onTap1,
      buttonPadding1 = const EdgeInsets.symmetric(horizontal: 8),
      vertical = false}) {
    return this.widget(
      SizedBox(
        height: height ?? 45.0,
        child: !vertical
            ? Row(
                mainAxisAlignment: getRowMainAxisAlignment(gravity),
                children: <Widget>[
                  AnterosButton(
                    onPressed: () {
                      if (onTap1 != null) onTap1();
                      if (isClickAutoDismiss) {
                        dismiss();
                      }
                    },
                    shape: shape1,
                    size: size1,
                    padding: buttonPadding1,
                    icon: icon1,
                    color: color1,
                    width: buttonWidth1,
                    text: text1 ?? "",
                    textColor: textColor1 ?? null,
                    textStyle: TextStyle(
                      color: textColor1 ?? null,
                      fontSize: fontSize1 ?? null,
                      fontWeight: fontWeight1,
                      fontFamily: fontFamily1,
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: getRowMainAxisAlignment(gravity),
                children: <Widget>[
                  AnterosButton(
                    onPressed: () {
                      if (onTap1 != null) onTap1();
                      if (isClickAutoDismiss) {
                        dismiss();
                      }
                    },
                    shape: shape1,
                    size: size1,
                    padding: buttonPadding1,
                    icon: icon1,
                    color: color1,
                    width: buttonWidth1,
                    text: text1 ?? "",
                    textColor: textColor1 ?? null,
                    textStyle: TextStyle(
                      color: textColor1 ?? null,
                      fontSize: fontSize1 ?? null,
                      fontWeight: fontWeight1,
                      fontFamily: fontFamily1,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  AnterosDialog doubleButton(
      {padding,
      gravity,
      height,
      isClickAutoDismiss =
          true, //Depois de clicar no botão, desligue automaticamente
      withDivider = false, //Linha de segmentação intermediária
      text1,
      shape1 = AnterosButtonShape.rounded_square,
      type1 = AnterosButtonType.solid,
      size1 = AnterosSize.MEDIUM,
      color1 = AnterosColors.PRIMARY,
      icon1,
      textColor1 = Colors.white,
      fontSize1,
      fontWeight1,
      fontFamily1,
      buttonWidth1,
      VoidCallback? onTap1,
      buttonPadding1 = const EdgeInsets.symmetric(horizontal: 8),
      text2,
      shape2 = AnterosButtonShape.rounded_square,
      type2 = AnterosButtonType.solid,
      size2 = AnterosSize.MEDIUM,
      color2 = AnterosColors.DANGER,
      icon2,
      textColor2 = Colors.white,
      fontSize2,
      fontWeight2,
      fontFamily2,
      buttonWidth2 = false,
      onTap2,
      buttonPadding2 = const EdgeInsets.symmetric(horizontal: 8),
      vertical = false}) {
    return this.widget(
      SizedBox(
        height: height ?? 45.0,
        child: !vertical
            ? Row(
                mainAxisAlignment: getRowMainAxisAlignment(gravity),
                children: <Widget>[
                  AnterosButton(
                    onPressed: () {
                      if (onTap1 != null) onTap1();
                      if (isClickAutoDismiss) {
                        dismiss();
                      }
                    },
                    shape: shape1,
                    size: size1,
                    padding: buttonPadding1,
                    icon: icon1,
                    color: color1,
                    width: buttonWidth1,
                    text: text1 ?? "",
                    textColor: textColor1 ?? null,
                    textStyle: TextStyle(
                      color: textColor1 ?? null,
                      fontSize: fontSize1 ?? null,
                      fontWeight: fontWeight1,
                      fontFamily: fontFamily1,
                    ),
                  ),
                  Visibility(
                    visible: withDivider,
                    child: SizedBox(width: 8),
                  ),
                  AnterosButton(
                    onPressed: () {
                      if (onTap2 != null) onTap2();
                      if (isClickAutoDismiss) {
                        dismiss();
                      }
                    },
                    padding: buttonPadding2,
                    shape: shape2,
                    size: size2,
                    icon: icon2,
                    width: buttonWidth2,
                    color: color2,
                    text: text2 ?? "",
                    textColor: textColor2 ?? null,
                    textStyle: TextStyle(
                      color: textColor2 ?? null,
                      fontSize: fontSize2 ?? null,
                      fontWeight: fontWeight2,
                      fontFamily: fontFamily2,
                    ),
                  )
                ],
              )
            : Column(
                mainAxisAlignment: getRowMainAxisAlignment(gravity),
                children: <Widget>[
                  AnterosButton(
                    onPressed: () {
                      if (onTap1 != null) onTap1();
                      if (isClickAutoDismiss) {
                        dismiss();
                      }
                    },
                    shape: shape1,
                    size: size1,
                    padding: buttonPadding1,
                    icon: icon1,
                    color: color1,
                    width: buttonWidth1,
                    text: text1 ?? "",
                    textColor: textColor1 ?? null,
                    textStyle: TextStyle(
                      color: textColor1 ?? null,
                      fontSize: fontSize1 ?? null,
                      fontWeight: fontWeight1,
                      fontFamily: fontFamily1,
                    ),
                  ),
                  Visibility(
                    visible: withDivider,
                    child: SizedBox(height: 4),
                  ),
                  AnterosButton(
                    onPressed: () {
                      if (onTap2 != null) onTap2();
                      if (isClickAutoDismiss) {
                        dismiss();
                      }
                    },
                    padding: buttonPadding2,
                    shape: shape2,
                    width: buttonWidth2,
                    size: size2,
                    icon: icon2,
                    color: color2,
                    text: text2 ?? "",
                    textColor: textColor2 ?? null,
                    textStyle: TextStyle(
                      color: textColor2 ?? null,
                      fontSize: fontSize2 ?? null,
                      fontWeight: fontWeight2,
                      fontFamily: fontFamily2,
                    ),
                  )
                ],
              ),
      ),
    );
  }

  AnterosDialog listViewOfListTile({
    List<ListTileItem>? items,
    double? height,
    isClickAutoDismiss = true,
    Function(int)? onClickItemListener,
  }) {
    return this.widget(
      Container(
        height: height,
        child: ListView.builder(
          padding: EdgeInsets.all(0.0),
          shrinkWrap: true,
          itemCount: items?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return Material(
              color: Colors.white,
              child: InkWell(
                child: ListTile(
                  onTap: () {
                    if (onClickItemListener != null) {
                      onClickItemListener(index);
                    }
                    if (isClickAutoDismiss) {
                      dismiss();
                    }
                  },
                  contentPadding: items?[index].padding ?? EdgeInsets.all(0.0),
                  leading: items?[index].leading,
                  title: Text(
                    items?[index].text ?? "",
                    style: TextStyle(
                      color: items?[index].color ?? null,
                      fontSize: items?[index].fontSize ?? null,
                      fontWeight: items?[index].fontWeight,
                      fontFamily: items?[index].fontFamily,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  AnterosDialog listViewOfRadioButton({
    List<RadioItem>? items,
    double? height,
    Color? color,
    Color? activeColor,
    int? intialValue,
    Function(int)? onClickItemListener,
  }) {
    Size size = MediaQuery.of(context!).size;
    return this.widget(
      Container(
        height: height,
        constraints: BoxConstraints(
          minHeight: size.height * .1,
          minWidth: size.width * .1,
          maxHeight: size.height * .5,
        ),
        child: AnterosRadioListTileDialog(
          items: items,
          intialValue: intialValue,
          color: color,
          activeColor: activeColor,
          onChanged: onClickItemListener,
        ),
      ),
    );
  }

  AnterosDialog circularProgress(
      {padding, backgroundColor, valueColor, strokeWidth}) {
    return this.widget(Padding(
      padding: padding,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 4.0,
        backgroundColor: backgroundColor,
        valueColor: AlwaysStoppedAnimation<Color>(valueColor),
      ),
    ));
  }

  AnterosDialog divider({color, height}) {
    return this.widget(
      Divider(
        color: color ?? Colors.grey[300],
        height: height ?? 0.1,
      ),
    );
  }

  ///  X coordenada
  ///  y coordenada
  void show([x, y]) {
    var mainAxisAlignment = getColumnMainAxisAlignment(gravity);
    var crossAxisAlignment = getColumnCrossAxisAlignment(gravity);
    if (x != null && y != null) {
      gravity = AnterosDialogGravity.leftTop;
      margin = EdgeInsets.only(left: x, top: y);
    }
    AnterosCustomDialog(
      gravity: gravity,
      gravityAnimationEnable: gravityAnimationEnable,
      context: this.context!,
      barrierColor: barrierColor,
      animatedFunc: animatedFunc,
      barrierDismissible: barrierDismissible,
      duration: duration,
      child: Padding(
        padding: margin,
        child: Column(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: <Widget>[
            Material(
              clipBehavior: Clip.antiAlias,
              type: MaterialType.transparency,
              borderRadius: BorderRadius.circular(borderRadius),
              child: Container(
                width: width ?? null,
                height: height ?? null,
                decoration: decoration ??
                    BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadius),
                      color: backgroundColor,
                    ),
                constraints: constraints ?? BoxConstraints(),
                child: CustomDialogChildren(
                  widgetList: widgetList,
                  isShowingChange: (bool isShowingChange) {
                    // showing or dismiss Callback
                    if (isShowingChange) {
                      showCallBack?.call();
                    } else {
                      dismissCallBack?.call();
                    }
                    _isShowing = isShowingChange;
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void dismiss() {
    if (_isShowing) {
      Navigator.of(context!, rootNavigator: useRootNavigator).pop();
    }
  }

  getColumnMainAxisAlignment(gravity) {
    var mainAxisAlignment = MainAxisAlignment.start;
    switch (gravity) {
      case AnterosDialogGravity.bottom:
      case AnterosDialogGravity.leftBottom:
      case AnterosDialogGravity.rightBottom:
        mainAxisAlignment = MainAxisAlignment.end;
        break;
      case AnterosDialogGravity.top:
      case AnterosDialogGravity.leftTop:
      case AnterosDialogGravity.rightTop:
        mainAxisAlignment = MainAxisAlignment.start;
        break;
      case AnterosDialogGravity.left:
        mainAxisAlignment = MainAxisAlignment.center;
        break;
      case AnterosDialogGravity.right:
        mainAxisAlignment = MainAxisAlignment.center;
        break;
      case AnterosDialogGravity.center:
      default:
        mainAxisAlignment = MainAxisAlignment.center;
        break;
    }
    return mainAxisAlignment;
  }

  getColumnCrossAxisAlignment(gravity) {
    var crossAxisAlignment = CrossAxisAlignment.center;
    switch (gravity) {
      case AnterosDialogGravity.bottom:
        break;
      case AnterosDialogGravity.top:
        break;
      case AnterosDialogGravity.left:
      case AnterosDialogGravity.leftTop:
      case AnterosDialogGravity.leftBottom:
        crossAxisAlignment = CrossAxisAlignment.start;
        break;
      case AnterosDialogGravity.right:
      case AnterosDialogGravity.rightTop:
      case AnterosDialogGravity.rightBottom:
        crossAxisAlignment = CrossAxisAlignment.end;
        break;
      default:
        break;
    }
    return crossAxisAlignment;
  }

  getRowMainAxisAlignment(gravity) {
    var mainAxisAlignment = MainAxisAlignment.start;
    switch (gravity) {
      case AnterosDialogGravity.bottom:
        break;
      case AnterosDialogGravity.top:
        break;
      case AnterosDialogGravity.left:
        mainAxisAlignment = MainAxisAlignment.start;
        break;
      case AnterosDialogGravity.right:
        mainAxisAlignment = MainAxisAlignment.end;
        break;
      case AnterosDialogGravity.spaceEvenly:
        mainAxisAlignment = MainAxisAlignment.spaceEvenly;
        break;
      case AnterosDialogGravity.center:
      default:
        mainAxisAlignment = MainAxisAlignment.center;
        break;
    }
    return mainAxisAlignment;
  }
}

/// O conteúdo da janela pop-up é usado como um componente variável
class CustomDialogChildren extends StatefulWidget {
  final List<Widget> widgetList; //Todos os componentes dentro da janela pop -up
  final Function(bool)? isShowingChange;

  CustomDialogChildren({this.widgetList = const [], this.isShowingChange});

  @override
  CustomDialogChildState createState() => CustomDialogChildState();
}

class CustomDialogChildState extends State<CustomDialogChildren> {
  @override
  Widget build(BuildContext context) {
    if (widget.isShowingChange != null) {
      widget.isShowingChange!(true);
    }
    return Column(
      children: widget.widgetList,
    );
  }

  @override
  void dispose() {
    if (widget.isShowingChange != null) {
      widget.isShowingChange!(false);
    }
    super.dispose();
  }
}

/// Instalação da API do pacote
class AnterosCustomDialog {
  BuildContext _context;
  Widget _child;
  Duration? _duration;
  Color? _barrierColor;
  RouteTransitionsBuilder? _transitionsBuilder;
  bool? _barrierDismissible;
  AnterosDialogGravity? _gravity;
  bool _gravityAnimationEnable;
  Function? _animatedFunc;

  AnterosCustomDialog({
    required Widget child,
    required BuildContext context,
    Duration? duration,
    Color? barrierColor,
    RouteTransitionsBuilder? transitionsBuilder,
    AnterosDialogGravity? gravity,
    bool gravityAnimationEnable = false,
    Function? animatedFunc,
    bool? barrierDismissible,
  })  : _child = child,
        _context = context,
        _gravity = gravity,
        _gravityAnimationEnable = gravityAnimationEnable,
        _duration = duration,
        _barrierColor = barrierColor,
        _animatedFunc = animatedFunc,
        _transitionsBuilder = transitionsBuilder,
        _barrierDismissible = barrierDismissible {
    this.show();
  }

  show() {
    //fix transparent error
    if (_barrierColor == Colors.transparent) {
      _barrierColor = Colors.white.withOpacity(0.0);
    }

    showGeneralDialog(
      context: _context,
      barrierColor: _barrierColor ?? Colors.black.withOpacity(.3),
      barrierDismissible: _barrierDismissible ?? true,
      barrierLabel: "",
      transitionDuration: _duration ?? const Duration(milliseconds: 250),
      transitionBuilder: _transitionsBuilder ?? _buildMaterialDialogTransitions,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Builder(
          builder: (BuildContext context) {
            return _child;
          },
        );
      },
    );
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    Animation<Offset> custom;
    switch (_gravity) {
      case AnterosDialogGravity.top:
      case AnterosDialogGravity.leftTop:
      case AnterosDialogGravity.rightTop:
        custom = Tween<Offset>(
          begin: const Offset(0.0, -1.0),
          end: const Offset(0.0, 0.0),
        ).animate(animation);
        break;
      case AnterosDialogGravity.left:
        custom = Tween<Offset>(
          begin: const Offset(-1.0, 0.0),
          end: const Offset(0.0, 0.0),
        ).animate(animation);
        break;
      case AnterosDialogGravity.right:
        custom = Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: const Offset(0.0, 0.0),
        ).animate(animation);
        break;
      case AnterosDialogGravity.bottom:
      case AnterosDialogGravity.leftBottom:
      case AnterosDialogGravity.rightBottom:
        custom = Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: const Offset(0.0, 0.0),
        ).animate(animation);
        break;
      case AnterosDialogGravity.center:
      default:
        custom = Tween<Offset>(
          begin: const Offset(0.0, 0.0),
          end: const Offset(0.0, 0.0),
        ).animate(animation);
        break;
    }

    //Animação personalizada
    if (_animatedFunc != null) {
      return _animatedFunc!(child, animation);
    }

    //Não há necessidade de ser animado por padrão
    if (!_gravityAnimationEnable) {
      custom = Tween<Offset>(
        begin: const Offset(0.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation);
    }

    return SlideTransition(
      position: custom,
      child: child,
    );
  }
}

//================================Gravidade======================================
enum AnterosDialogGravity {
  left,
  top,
  bottom,
  right,
  center,
  rightTop,
  leftTop,
  rightBottom,
  leftBottom,
  spaceEvenly,
}
//============================================================================

//================================Entidade Dialog======================================
class ListTileItem {
  ListTileItem({
    this.padding,
    this.leading,
    this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
  });

  EdgeInsets? padding;
  Widget? leading;
  String? text;
  Color? color;
  double? fontSize;
  FontWeight? fontWeight;
  String? fontFamily;
}

class RadioItem {
  RadioItem({
    this.padding,
    this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.onTap,
  });

  EdgeInsets? padding;
  String? text;
  Color? color;
  double? fontSize;
  FontWeight? fontWeight;
  Function(int)? onTap;
}
//============================================================================
