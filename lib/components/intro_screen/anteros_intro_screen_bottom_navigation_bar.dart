import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosIntroScreenBottomNavigationBar extends StatefulWidget {
  const AnterosIntroScreenBottomNavigationBar({
    Key? key,
    required this.pageController,
    required this.currentIndex,
    required this.pageCount,
    this.child,
    this.navigationBarColor = AnterosColors.SUCCESS,
    this.navigationBarHeight = 50,
    this.navigationBarShape,
    this.navigationBarWidth,
    this.navigationBarPadding = const EdgeInsets.all(8),
    this.navigationBarMargin = const EdgeInsets.all(8),
    this.showDivider = true,
    this.dividerColor = Colors.white,
    this.dividerHeight = 1,
    this.dividerThickness = 2,
    this.dotShape,
    this.inactiveColor = AnterosColors.DANGER,
    this.activeColor = AnterosColors.PRIMARY,
    this.dotHeight = 12,
    this.dotWidth = 12,
    this.dotMargin = const EdgeInsets.symmetric(horizontal: 2),
    this.backButton,
    this.forwardButton,
    this.doneButton,
    this.skipButton,
    this.onDoneTap,
    this.onForwardButtonTap,
    this.onBackButtonTap,
    this.onSkipTap,
    this.forwardButtonText = 'NEXT',
    this.backButtonText = 'BACK',
    this.doneButtonText = 'GO',
    this.skipButtonText = 'SKIP',
    this.skipButtonTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    this.doneButtonTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    this.backButtonTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    this.forwardButtonTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    this.showButton = true,
    this.showPagination = true,
  }) : super(key: key);

  /// controlador padrão para o componente [AnterosIntroScreen]
  final PageController pageController;

  /// define o currentIndex dos slides [AnterosIntroScreen], o valor padrão é 0
  final int currentIndex;

  /// define o comprimento dos slides [AnterosIntroScreen], o valor padrão é 0
  final int pageCount;

  /// define [AnterosIntroScreenBottomNavigationBar], leva qualquer widget
  final Widget? child;

  /// define a altura [AnterosIntroScreenBottomNavigationBar]
  final double navigationBarHeight;

  /// define a largura de [AnterosIntroScreenBottomNavigationBar]
  final double? navigationBarWidth;

  /// define o preenchimento [AnterosIntroScreenBottomNavigationBar]
  final EdgeInsets navigationBarPadding;

  /// define a margem [AnterosIntroScreenBottomNavigationBar]
  final EdgeInsets navigationBarMargin;

  /// define a cor [AnterosIntroScreenBottomNavigationBar]
  final Color navigationBarColor;

  /// define a forma de [AnterosIntroScreenBottomNavigationBar]
  final ShapeBorder? navigationBarShape;

  /// Chamado quando o [forwardButtonText] é tocado
  final VoidCallback? onForwardButtonTap;

  /// Chamado quando o [backButtonText] é tocado
  final VoidCallback? onBackButtonTap;

  /// Chamado quando o [doneButtonText] é tocado
  final VoidCallback? onDoneTap;

  /// Chamado quando o [skipButtonText] é tocado
  final VoidCallback? onSkipTap;

  /// define o widget backButton
  final Widget? backButton;

  /// define o widget forwardButton
  final Widget? forwardButton;

  /// define o widget doneButton
  final Widget? doneButton;

  /// define o widget skipButton
  final Widget? skipButton;

  /// define o texto backButton
  final String backButtonText;

  /// define o texto forwardButton
  final String forwardButtonText;

  /// define o texto doneButton
  final String doneButtonText;

  /// define o texto skipButton
  final String skipButtonText;

  /// define o estilo de texto skipButton
  final TextStyle skipButtonTextStyle;

  /// define o estilo de texto doneButton
  final TextStyle doneButtonTextStyle;

  /// define o backButton textStyle
  final TextStyle backButtonTextStyle;

  /// define o textStyle forwardButton
  final TextStyle forwardButtonTextStyle;

  /// no estado verdadeiro, exibe [Divisor], o padrão é verdadeiro
  final bool showDivider;

  /// no estado verdadeiro, exibe botões, o padrão é verdadeiro
  final bool showButton;

  /// no estado verdadeiro, exibe a paginação, o padrão é verdadeiro
  final bool showPagination;

  /// define a altura do divisor
  final double dividerHeight;

  /// define a espessura do divisor
  final double dividerThickness;

  /// define a cor do divisor
  final Color dividerColor;

  /// define a forma de paginação
  final ShapeBorder? dotShape;

  /// define a cor inativa da paginação
  final Color inactiveColor;

  /// define a cor ativa da paginação
  final Color activeColor;

  /// define a altura da paginação
  final double dotHeight;

  /// define a largura da paginação
  final double dotWidth;

  /// define a paginação entre o espaço
  final EdgeInsets dotMargin;

  @override
  _AnterosIntroScreenBottomNavigationBarState createState() =>
      _AnterosIntroScreenBottomNavigationBarState();
}

class _AnterosIntroScreenBottomNavigationBarState
    extends State<AnterosIntroScreenBottomNavigationBar> {
  late PageController _pageController;
  late int currentIndex;
  List<Widget>? pages;

  @override
  void initState() {
    _pageController = widget.pageController;
    currentIndex = _pageController.initialPage;
    _pageController = widget.pageController;
    _pageController.addListener(() {
      if (mounted) {
        final index = _pageController.page?.round();
        if (index != null) {
          setState(() {
            currentIndex = index;
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onForwardButton() {
    widget.pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  void onBackButton() {
    widget.pageController.previousPage(
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          widget.showDivider
              ? Divider(
                  height: widget.dividerHeight,
                  thickness: widget.dividerThickness,
                  color: widget.dividerColor,
                )
              : Container(),
          Container(
            height: widget.navigationBarHeight,
            width: widget.navigationBarWidth,
            child: Material(
              shape: widget.navigationBarShape,
              color: widget.navigationBarColor,
              child: Container(
                padding: widget.navigationBarPadding,
                margin: widget.navigationBarMargin,
                child: widget.child != null
                    ? Row(
                        children: [widget.child!],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          widget.showButton
                              ? InkWell(
                                  child: currentIndex == 0
                                      ? widget.skipButton ??
                                          Text(widget.skipButtonText,
                                              style: widget.skipButtonTextStyle)
                                      : widget.backButton ??
                                          Text(widget.backButtonText,
                                              style:
                                                  widget.backButtonTextStyle),
                                  onTap: currentIndex == 0
                                      ? widget.onSkipTap
                                      : widget.onBackButtonTap ?? onBackButton,
                                )
                              : Container(),
                          widget.showPagination
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: getDotsList(),
                                )
                              : Container(),
                          widget.showButton
                              ? InkWell(
                                  child: currentIndex == widget.pageCount - 1
                                      ? widget.doneButton ??
                                          Text(widget.doneButtonText,
                                              style: widget.doneButtonTextStyle)
                                      : widget.forwardButton ??
                                          Text(widget.forwardButtonText,
                                              style: widget
                                                  .forwardButtonTextStyle),
                                  onTap: currentIndex == widget.pageCount - 1
                                      ? widget.onDoneTap
                                      : widget.onForwardButtonTap ??
                                          onForwardButton,
                                )
                              : Container(),
                        ],
                      ),
              ),
            ),
          )
        ],
      );

  List<Widget> getDotsList() {
    final List<Widget> list = [];
    for (int i = 0; i < widget.pageCount; i++) {
      list.add(Container(
        margin: widget.dotMargin,
        child: Material(
          shape: widget.dotShape ??
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          color: currentIndex == i ? widget.activeColor : widget.inactiveColor,
          child: Container(
            width: widget.dotWidth,
            height: widget.dotHeight,
          ),
        ),
      ));
    }
    return list;
  }
}
