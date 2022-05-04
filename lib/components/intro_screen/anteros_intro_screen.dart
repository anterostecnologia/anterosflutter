import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosIntroScreen extends StatefulWidget {
  /// A tela de introdução do Anteros é um Slider interativo exclusivo virtual que ajuda os usuários a começar a usar um aplicativo.
  /// Ele tem muitos recursos que ajudam a criar controles deslizantes de tela de introdução personalizados.
  /// Apresenta telas informativas aos usuários com diversas possibilidades de customização.
  const AnterosIntroScreen({
    Key? key,
    required this.pageController,
    required this.currentIndex,
    required this.pageCount,
    required this.slides,
    this.color,
    this.width,
    this.height,
    this.borderRadius,
    this.border,
    this.introScreenBottomNavigationBar,
    this.showIntroScreenBottomNavigationBar = false,
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
    this.inactiveColor = AnterosColors.LIGHT,
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

  /// define a lista de slides
  final List<Widget> slides;

  /// permite controlar slides [AnterosIntroScreen]
  final PageController pageController;

  /// define a cor de fundo dos slides [AnterosIntroScreen]
  final Color? color;

  /// define a altura dos slides [AnterosIntroScreen]
  final double? height;

  /// define a largura dos slides [AnterosIntroScreen]
  final double? width;

  /// define o raio da borda [AnterosIntroScreen] para definir a forma dos slides
  final BorderRadius? borderRadius;

  /// define a borda dos slides [AnterosIntroScreen]
  final Border? border;

  /// define a barra de navegação inferior do [AnterosIntroScreen]
  final AnterosIntroScreenBottomNavigationBar? introScreenBottomNavigationBar;

  /// no estado verdadeiro, exibe [AnterosIntroScreenBottomNavigationBar], o padrão é falso
  final bool showIntroScreenBottomNavigationBar;

  /// define o currentIndex dos slides [AnterosIntroScreen], o valor padrão é 0
  final int currentIndex;

  /// define o comprimento dos slides [AnterosIntroScreen], o valor padrão é 0
  final int pageCount;

  /// define o filho de [AnterosIntroScreenBottomNavigationBar], leva qualquer widget
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

  /// Chamado quando o botão avançar é tocado
  final VoidCallback? onForwardButtonTap;

  /// Chamado quando o botão voltar é tocado
  final VoidCallback? onBackButtonTap;

  /// Chamado quando o botão concluído é tocado
  final VoidCallback? onDoneTap;

  /// Chamado quando o botão pular é tocado
  final VoidCallback? onSkipTap;

  /// pega qualquer Widget para definir o widget backButton,
  final Widget? backButton;

  /// pega qualquer Widget para definir o widget forwardButton
  final Widget? forwardButton;

  /// pega qualquer Widget para definir o widget doneButton
  final Widget? doneButton;

  /// pega qualquer Widget para definir o widget skipButton
  final Widget? skipButton;

  /// usa String para definir o texto de backButton
  final String backButtonText;

  /// pega String para definir o texto forwardButton
  final String forwardButtonText;

  /// pega String para definir o texto doneButton
  final String doneButtonText;

  /// pega String para definir o texto skipButton
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
  _AnterosIntroScreenState createState() => _AnterosIntroScreenState();
}

class _AnterosIntroScreenState extends State<AnterosIntroScreen> {
  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(0),
            border: widget.border ?? Border.all(width: 0),
            color: widget.color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: PageView(
                  controller: widget.pageController,
                  children: widget.slides,
                ),
              ),
              widget.showIntroScreenBottomNavigationBar
                  ? widget.introScreenBottomNavigationBar ??
                      AnterosIntroScreenBottomNavigationBar(
                        pageController: widget.pageController,
                        pageCount: widget.slides.length,
                        currentIndex: widget.currentIndex,
                        child: widget.child,
                        navigationBarColor: widget.navigationBarColor,
                        navigationBarHeight: widget.navigationBarHeight,
                        navigationBarShape: widget.navigationBarShape,
                        navigationBarWidth: widget.navigationBarWidth,
                        navigationBarPadding: widget.navigationBarPadding,
                        navigationBarMargin: widget.navigationBarMargin,
                        showDivider: widget.showDivider,
                        dividerColor: widget.dividerColor,
                        dividerHeight: widget.dividerHeight,
                        dividerThickness: widget.dividerThickness,
                        dotShape: widget.dotShape,
                        inactiveColor: widget.inactiveColor,
                        activeColor: widget.activeColor,
                        dotHeight: widget.dotHeight,
                        dotWidth: widget.dotWidth,
                        dotMargin: widget.dotMargin,
                        backButton: widget.backButton,
                        forwardButton: widget.forwardButton,
                        doneButton: widget.doneButton,
                        skipButton: widget.skipButton,
                        onDoneTap: widget.onDoneTap,
                        onForwardButtonTap: widget.onForwardButtonTap,
                        onBackButtonTap: widget.onBackButtonTap,
                        onSkipTap: widget.onSkipTap,
                        forwardButtonText: widget.forwardButtonText,
                        backButtonText: widget.backButtonText,
                        doneButtonText: widget.doneButtonText,
                        skipButtonText: widget.skipButtonText,
                        skipButtonTextStyle: widget.skipButtonTextStyle,
                        doneButtonTextStyle: widget.doneButtonTextStyle,
                        backButtonTextStyle: widget.backButtonTextStyle,
                        forwardButtonTextStyle: widget.forwardButtonTextStyle,
                        showButton: widget.showButton,
                        showPagination: widget.showPagination,
                      )
                  : Container(),
            ],
          ),
        ),
      );
}
