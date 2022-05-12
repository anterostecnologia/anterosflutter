library draggable_home;

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class AnterosDraggableHome extends StatefulWidget {
  @override
  _AnterosDraggableHomeState createState() => _AnterosDraggableHomeState();

  /// Leading: Um widget a ser exibido antes do título da barra de ferramentas.
  final Widget? leading;

  /// Title: Um widget para exibir título no AppBar
  final Widget title;

  /// Center Title: Permite alternar o título do centro. Por padrão, o título está no centro.
  final bool centerTitle;

  /// Action: Uma lista de widgets a serem exibidos em uma linha após o widget do título.
  final List<Widget>? actions;

  /// Sempre mostre liderança e ação : Isso torna a liderança e a ação sempre visíveis. O valor padrão é falso.
  final bool alwaysShowLeadingAndAction;

  /// Sempre mostre título : Isso torna o título sempre visível. O valor padrão é falso.
  final bool alwaysShowTitle;

  /// Drawer: As gavetas são normalmente usadas com a propriedade Scaffold.drawer.
  final Widget? drawer;

  /// Header Expanded Height : Altura do widget de cabeçalho. A altura é um dobro entre 0,0 e 1,0. O valor padrão da altura é de 0,35 e deve ser menor que Stretchmaxheigh
  final double headerExpandedHeight;

  /// Header Widget: Um widget para exibir o cabeçalho acima do corpo.
  final Widget headerWidget;

  /// headerBottomBar: Widget da barra de ferramentas ou barra de ferramentas logo acima do corpo.

  final Widget? headerBottomBar;

  /// backgroundColor: A cor do widget material subjacente a todo o DraggableHome body.
  final Color? backgroundColor;

  /// appBarColor: A cor da barra de aplicativos do andaime.
  final Color? appBarColor;

  /// curvedBodyRadius: Cria uma borda superior esquerda e o raio superior direito do corpo, o raio padrão do corpo é de 20,0. Para nenhum raio, basta definir o valor para 0.
  final double curvedBodyRadius;

  /// body: Um widget para o corpo
  final List<Widget> body;

  /// fullyStretchable: Permite alternar de expandir totalmente a arrastamento do DraggableHome. Defina isso como true para permitir que o usuário expanda completamente o cabeçalho.
  final bool fullyStretchable;

  /// stretchTriggerOffset: O deslocamento da oposição necessário para expandir completamente o cabeçalho.
  final double stretchTriggerOffset;

  /// expandedBody: Um widget a ser exibido quando totalmente expandido como cabeçalho ou corpo expandido acima do corpo.
  final Widget? expandedBody;

  /// stretchMaxHeight: Altura do expandedBody widget. A altura é um dobro entre 0,0 e 0,95. O valor padrão da altura é 0,9 e deve ser maior que headerExpandedHeight
  final double stretchMaxHeight;

  /// floatingActionButton: Um objeto que define uma posição para o FloatingActionButton com base no Scaffold's ScaffoldPrelayoutGeometry.
  final Widget? floatingActionButton;

  /// bottomSheet: Uma folha inferior persistente mostra informações que complementam o conteúdo principal do aplicativo. Uma folha inferior persistente permanece visível mesmo quando o usuário interage com outras partes do aplicativo.
  final Widget? bottomSheet;

  /// bottomNavigationBarHeight: Isso exige ao usar a altura personalizada para ajustar a altura do corpo. Isso não afeta bottomNavigationBar.
  final double? bottomNavigationBarHeight;

  /// bottomNavigationBar: As barras de lanches deslizam por baixo da barra de navegação inferior enquanto as folhas de fundo são empilhadas na parte superior.
  final Widget? bottomNavigationBar;

  /// floatingActionButtonLocation: Um objeto que define uma posição para o FloatingActionButton com base no Scaffold's ScaffoldPrelayoutGeometry.

  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// floatingActionButtonAnimator: Provedor de animações para mover o FloatingActionButton entre FloatingActionButtonLocations.
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  /// Isso criará DraggableHome.
  const AnterosDraggableHome({
    Key? key,
    this.leading,
    required this.title,
    this.centerTitle = true,
    this.actions,
    this.alwaysShowLeadingAndAction = false,
    this.alwaysShowTitle = false,
    this.headerExpandedHeight = 0.35,
    required this.headerWidget,
    this.headerBottomBar,
    this.backgroundColor,
    this.appBarColor,
    this.curvedBodyRadius = 20,
    required this.body,
    this.drawer,
    this.fullyStretchable = false,
    this.stretchTriggerOffset = 200,
    this.expandedBody,
    this.stretchMaxHeight = 0.9,
    this.bottomSheet,
    this.bottomNavigationBarHeight = kBottomNavigationBarHeight,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
  })  : assert(headerExpandedHeight > 0.0 &&
            headerExpandedHeight < stretchMaxHeight),
        assert(
          (stretchMaxHeight > headerExpandedHeight) && (stretchMaxHeight < .95),
        ),
        super(key: key);
}

class _AnterosDraggableHomeState extends State<AnterosDraggableHome> {
  final BehaviorSubject<bool> isFullyExpanded =
      BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<bool> isFullyCollapsed =
      BehaviorSubject<bool>.seeded(false);

  @override
  void dispose() {
    isFullyExpanded.close();
    isFullyCollapsed.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double appBarHeight =
        AppBar().preferredSize.height + widget.curvedBodyRadius;

    final double topPadding = MediaQuery.of(context).padding.top;

    final double expandedHeight =
        MediaQuery.of(context).size.height * widget.headerExpandedHeight;

    final double fullyExpandedHeight =
        MediaQuery.of(context).size.height * (widget.stretchMaxHeight);

    return Scaffold(
      backgroundColor:
          widget.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      drawer: widget.drawer,
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.axis == Axis.vertical) {
            // isFullyCollapsed
            if ((isFullyExpanded.value) &&
                notification.metrics.extentBefore > 100) {
              isFullyExpanded.add(false);
            }
            //isFullyCollapsed
            if (notification.metrics.extentBefore >
                expandedHeight - AppBar().preferredSize.height - 40) {
              if (!(isFullyCollapsed.value)) isFullyCollapsed.add(true);
            } else {
              if ((isFullyCollapsed.value)) isFullyCollapsed.add(false);
            }
          }
          return false;
        },
        child: sliver(context, appBarHeight, fullyExpandedHeight,
            expandedHeight, topPadding),
      ),
      bottomSheet: widget.bottomSheet,
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
    );
  }

  CustomScrollView sliver(
    BuildContext context,
    double appBarHeight,
    double fullyExpandedHeight,
    double expandedHeight,
    double topPadding,
  ) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        StreamBuilder<List<bool>>(
          stream: CombineLatestStream.list<bool>([
            isFullyCollapsed.stream,
            isFullyExpanded.stream,
          ]),
          builder: (BuildContext context, AsyncSnapshot<List<bool>> snapshot) {
            final List<bool> streams = (snapshot.data ?? [false, false]);
            final bool fullyCollapsed = streams[0];
            final bool fullyExpanded = streams[1];

            return SliverAppBar(
              backgroundColor:
                  !fullyCollapsed ? widget.backgroundColor : widget.appBarColor,
              leading: widget.alwaysShowLeadingAndAction
                  ? widget.leading
                  : !fullyCollapsed
                      ? const SizedBox()
                      : widget.leading,
              actions: widget.alwaysShowLeadingAndAction
                  ? widget.actions
                  : !fullyCollapsed
                      ? []
                      : widget.actions,
              elevation: 0,
              pinned: true,
              stretch: true,
              centerTitle: widget.centerTitle,
              title: widget.alwaysShowTitle
                  ? widget.title
                  : AnimatedOpacity(
                      opacity: fullyCollapsed ? 1 : 0,
                      duration: const Duration(milliseconds: 100),
                      child: widget.title,
                    ),
              collapsedHeight: appBarHeight,
              expandedHeight:
                  fullyExpanded ? fullyExpandedHeight : expandedHeight,
              flexibleSpace: Stack(
                children: [
                  FlexibleSpaceBar(
                    background: Container(
                      margin: const EdgeInsets.only(bottom: 0.2),
                      child: fullyExpanded
                          ? (widget.expandedBody ?? const SizedBox())
                          : widget.headerWidget,
                    ),
                  ),
                  Positioned(
                    bottom: -1,
                    left: 0,
                    right: 0,
                    child: roundedCorner(context),
                  ),
                  Positioned(
                    bottom: 0 + widget.curvedBodyRadius,
                    child: AnimatedContainer(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      curve: Curves.easeInOutCirc,
                      duration: const Duration(milliseconds: 100),
                      height: fullyCollapsed
                          ? 0
                          : fullyExpanded
                              ? 0
                              : kToolbarHeight,
                      width: MediaQuery.of(context).size.width,
                      child: fullyCollapsed
                          ? const SizedBox()
                          : fullyExpanded
                              ? const SizedBox()
                              : widget.headerBottomBar ?? Container(),
                    ),
                  )
                ],
              ),
              stretchTriggerOffset: widget.stretchTriggerOffset,
              onStretchTrigger: widget.fullyStretchable
                  ? () async {
                      if (!fullyExpanded) isFullyExpanded.add(true);
                    }
                  : null,
            );
          },
        ),
        sliverList(context, appBarHeight + topPadding),
      ],
    );
  }

  Container roundedCorner(BuildContext context) {
    return Container(
      height: widget.curvedBodyRadius,
      decoration: BoxDecoration(
        color:
            widget.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(widget.curvedBodyRadius),
        ),
      ),
    );
  }

  SliverList sliverList(BuildContext context, double topHeight) {
    final double bottomPadding =
        widget.bottomNavigationBar == null ? 0 : kBottomNavigationBarHeight;
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height -
                    topHeight -
                    bottomPadding,
                color: widget.backgroundColor ??
                    Theme.of(context).scaffoldBackgroundColor,
              ),
              Column(
                children: [
                  expandedUpArrow(),
                  //Body
                  ...widget.body
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  StreamBuilder<bool> expandedUpArrow() {
    return StreamBuilder<bool>(
      stream: isFullyExpanded.stream,
      builder: (context, snapshot) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: (snapshot.data ?? false) ? 25 : 0,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Icon(
              Icons.keyboard_arrow_up_rounded,
              color: (snapshot.data ?? false) ? null : Colors.transparent,
            ),
          ),
        );
      },
    );
  }
}
