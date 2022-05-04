import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:anterosflutter/anterosflutter.dart';

/// Uma barra de ferramentas e outros componentes consistem em uma barra de ferramentas e outros widgets, como um
/// [AnterosTabBar][TabBar] e um [FlexibleSpaceBar].
/// O AnterosAppBar exibe os widgets da barra de ferramentas, [lead], [title] e [actions],
/// acima do [fundo] (se houver). O [bottom] geralmente é usado para um [TabBar].
class AnterosAppBar extends StatefulWidget implements PreferredSizeWidget {
  /// Cria uma barra de aplicativos de design de material.
  ///
  /// Os argumentos [primário], [toolbarOpacity], [bottomOpacity]
  /// e [automaticallyImplyLeading] não deve ser nulo. Além disso, se
  /// [elevation] for especificado, deve ser não negativo.
  ///
  /// If [backgroundColor], [elevation], [brightness], [iconTheme],
  /// [actionsIconTheme], ou [textTheme] são nulos, então seu AnterosAppBarTheme
  /// valores serão usados. Se uma propriedade AnterosAppBarTheme correspondente para nula,
  /// então o padrão especificado na documentação da propriedade será usado.
  ///
  /// Normalmente usado na propriedade [Scaffold.appBar].
  AnterosAppBar({
    Key? key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.shape,
    this.backgroundColor,
    this.brightness,
    this.iconTheme,
    this.actionsIconTheme,
    this.textTheme,
    this.primary = true,
    this.centerTitle,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.searchBar = false,
    this.searchHintText = 'Search...',
    this.searchHintStyle = const TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
    this.searchTextStyle = const TextStyle(
      color: Colors.white,
    ),
    this.searchBarColorTheme = Colors.white,
    this.searchController,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
  })  : assert(elevation == null || elevation >= 0.0),
        preferredSize = Size.fromHeight(
          kToolbarHeight + (bottom?.preferredSize.height ?? 0),
        ),
        super(key: key);

  /// Um ​​widget a ser exibido antes do [título].
  final Widget? leading;

  /// Controla se devemos tentar implicar o widget principal se for nulo.
  ///
  /// Se true e [lead] for null, automaticamente tenta deduzir qual o valor principal
  /// widget deve ser. Se false e [leading] for nulo, o espaço inicial será dado a [title].
  /// Se o widget principal não for nulo, este parâmetro não terá efeito.
  final bool automaticallyImplyLeading;

  /// O widget principal exibido na barra de aplicativos.
  ///
  /// Normalmente um widget [Texto] contendo uma descrição do conteúdo atual
  /// do aplicativo.
  final Widget? title;

  /// Widgets a serem exibidos após o widget [title].
  ///
  /// Normalmente esses widgets são [IconButton]s que representam operações comuns.
  /// Para operações menos comuns, considere usar um [PopupMenuButton] como o
  /// última ação.
  final List<Widget>? actions;

  /// Este widget é empilhado atrás da barra de ferramentas e da barra de guias. É altura vai
  /// ser igual à altura geral da barra de aplicativos.
  ///
  /// Um ​​espaço flexível não é realmente flexível, a menos que o contêiner do [AnterosAppBar]
  /// altera o tamanho do [AnterosAppBar]. Um SliverGFAppBar em um [CustomScrollView]
  /// altera a altura do [AnterosAppBar] quando rolado.
  ///
  /// Normalmente um [FlexibleSpaceBar]. Consulte [FlexibleSpaceBar] para obter detalhes.
  final Widget? flexibleSpace;

  /// Este widget aparece na parte inferior da barra de aplicativos.
  ///
  /// Normalmente um [TabBar]. Apenas widgets que implementam [PreferredSizeWidget] podem
  /// ser usado na parte inferior de uma barra de aplicativos.
  ///
  /// Veja também:
  ///
  /// * [PreferredSize], que pode ser usado para dar a um widget arbitrário um tamanho preferido.
  final PreferredSizeWidget? bottom;

  /// A coordenada z na qual colocar esta barra de aplicativos em relação ao seu pai.
  ///
  /// Isso controla o tamanho da sombra abaixo da barra de aplicativos.
  ///
  /// O valor não é negativo.
  ///
  /// Se esta propriedade for nula, então [ThemeData.appBarTheme.elevation] será usado,
  /// se também for nulo, o valor padrão é 4, a elevação apropriada
  /// para barras de aplicativos.
  final double? elevation;

  /// A forma do material bem como sua sombra.
  ///
  /// Uma sombra só é exibida se a [elevação] for maior que
  /// zero.
  final ShapeBorder? shape;

  /// A cor a ser usada para o material da barra de aplicativos. Normalmente, isso deve ser definido
  /// junto com [brightness], [iconTheme], [textTheme].
  ///
  /// Se esta propriedade for nula, então [ThemeData.appBarTheme.color] será usado,
  /// se também for nulo, então [ThemeData.primaryColor] será usado.
  final Color? backgroundColor;

  /// O brilho do material da barra de aplicativos. Normalmente, isso é definido junto
  /// com [backgroundColor], [iconTheme], [textTheme].
  ///
  /// Se esta propriedade for nula, então [ThemeData.appBarTheme.brightness] será usado,
  /// se também for nulo, então o appBarTheme pode ser usado para configurar o
  /// aparência de AppBars. A aparência de Keyboards for TextFields agora usa
  /// ThemeData.brightness do tema geral e também pode ser personalizado com
  /// TextField.keyboardAppearance. O brilho de qualquer cor pode ser encontrado com
  /// ThemeData.estimateBrightnessForColor.
  final Brightness? brightness;

  /// A cor, a opacidade e o tamanho a serem usados ​​para os ícones da barra de aplicativos. Normalmente isso
  /// é definido junto com [backgroundColor], [brightness], [textTheme].
  ///
  /// Se esta propriedade for nula, então [ThemeData.appBarTheme.iconTheme] será usado,
  /// se também for nulo, então [ThemeData.primaryIconTheme] será usado.
  final IconThemeData? iconTheme;

  /// A cor, opacidade e tamanho a serem usados ​​para os ícones que aparecem no aplicativo
  /// bar's [ações]. Isso só deve ser usado quando as [ações] devem ser
  /// tema diferente do ícone que aparece na barra de aplicativos [lead]
  /// ferramenta.
  ///
  /// Se esta propriedade for nula, então [ThemeData.appBarTheme.actionsIconTheme] será
  /// usado, se também for nulo, então retorna para [iconTheme].
  final IconThemeData? actionsIconTheme;

  /// Os estilos tipográficos a serem usados ​​para texto na barra de aplicativos. Normalmente isso é
  /// definido junto com [brightness] [backgroundColor], [iconTheme].
  ///
  /// Se esta propriedade for nula, então [ThemeData.appBarTheme.textTheme] será usado,
  /// se também for nulo, então [ThemeData.primaryTextTheme] será usado.
  final TextTheme? textTheme;

  /// Se esta barra de aplicativos está sendo exibida na parte superior da tela.
  ///
  /// Se true, os elementos da barra de ferramentas da barra de aplicativos e o widget [bottom] serão
  /// preenchido no topo pela altura da barra de status do sistema. O layout
  /// do [flexibleSpace] não é afetado pela propriedade [primary].
  final bool primary;

  /// Se o título deve ser centralizado.
  ///
  /// Padrão para ser adaptado para a [TargetPlatform] atual.
  final bool? centerTitle;

  /// O espaçamento em torno do conteúdo [title] no eixo horizontal. Este espaçamento é
  /// aplicado mesmo se não houver conteúdo [principal] ou [ações]. Se você quiser
  /// [title] para ocupar todo o espaço disponível, defina este valor para 0.0.
  ///
  /// O padrão é [NavigationToolbar.kMiddleSpacing].
  final double titleSpacing;

  /// Quão opaca é a parte da barra de ferramentas da barra de aplicativos.
  ///
  /// Um ​​valor de 1,0 é totalmente opaco e um valor de 0,0 é totalmente transparente.
  ///
  /// Normalmente, esse valor não é alterado de seu valor padrão (1.0). Isso é
  /// usado por SliverGFAppBar para animar a opacidade da barra de ferramentas quando o aplicativo
  /// barra é rolada.
  final double toolbarOpacity;

  /// Quão opaca é a parte inferior da barra de aplicativos.
  ///
  /// Um ​​valor de 1,0 é totalmente opaco e um valor de 0,0 é totalmente transparente.
  ///
  /// Normalmente, esse valor não é alterado de seu valor padrão (1.0). Isso é
  /// usado por SliverGFAppBar para animar a opacidade da barra de ferramentas quando o aplicativo
  /// barra é rolada.
  final double bottomOpacity;

  /// Um ​​tamanho cuja altura é a soma de [kToolbarHeight] e do widget [bottom]
  /// altura preferida.
  ///
  /// [Scaffold] usa esse tamanho para definir a altura da barra de aplicativos.
  @override
  final Size preferredSize;

  /// Se true, exibe a barra de pesquisa no espaço do título
  final bool searchBar;

  /// Leva texto para exibir o texto da dica da barra de pesquisa
  final String searchHintText;

  /// Estiliza o [searchHintText]
  final TextStyle searchHintStyle;

  /// Estiliza o texto de pesquisa
  final TextStyle searchTextStyle;

  /// Define a cor dos ícones da barra de pesquisa
  final Color searchBarColorTheme;

  /// {@macro flutter.widgets.editableText.onChanged}
  ///
  /// Veja também:
  ///
  /// * inputFormatters, que são chamados antes de [onChanged]
  /// executa e pode validar e alterar ("formatar") o valor de entrada.
  /// * onEditingComplete, [onSubmitted], [onSelectionChanged]:
  /// que são notificações de alteração de entrada mais especializadas.
  final ValueChanged<String>? onChanged;

  /// {@macro flutter.widgets.editableText.onSubmitted}
  ///
  /// Veja também:
  ///
  /// * [EditableText.onSubmitted] para um exemplo de como lidar com a mudança para
  /// o campo próximo/anterior ao usar [TextInputAction.next] e
  /// [TextInputAction.previous] para [textInputAction].
  final ValueChanged<String>? onSubmitted;

  /// Controla o texto que está sendo editado.
  ///
  /// Se null, este widget criará seu próprio [TextEditingController].
  final TextEditingController? searchController;

  /// {@template flutter.material.textfield.onTap}
  /// Chamado para cada toque distinto, exceto para cada segundo toque de um toque duplo.
  ///
  /// O campo de texto cria um [GestureDetector] para lidar com eventos de entrada como tap,
  /// para acionar solicitações de foco, mover o cursor, ajustar a seleção, etc.
  /// Manipulando alguns desses eventos envolvendo o campo de texto com um concorrente
  /// GestureDetector é problemático.
  ///
  /// Para manipular toques incondicionalmente, sem interferir no campo de texto
  /// detector de gestos interno, forneça este retorno de chamada.
  ///
  /// Se o campo de texto for criado com false habilitado, os toques não serão
  /// reconhecido.
  ///
  /// Para ser notificado quando o campo de texto ganha ou perde o foco, forneça um
  /// focusNode e adicione um ouvinte a isso.
  ///
  /// Para ouvir eventos de ponteiro arbitrários sem competir com o
  /// detector de gestos interno do campo de texto, use um [Listener].
  /// {@endtemplate}
  final GestureTapCallback? onTap;

  bool _getEffectiveCenterTitle(ThemeData theme) {
    if (centerTitle != null) {
      return centerTitle!;
    }
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return false;
      case TargetPlatform.iOS:
        return actions == null || actions!.length < 2;
      default:
        return false;
    }
  }

  @override
  _AnterosAppBarState createState() => _AnterosAppBarState();
}

class _AnterosAppBarState extends State<AnterosAppBar> {
  static const double _defaultElevation = 4;
  Widget? searchBar;
  bool showSearchBar = false;
  final TextEditingController _searchController = TextEditingController();

  void _handleDrawerButton() {
    Scaffold.of(context).openDrawer();
  }

  void _handleDrawerButtonEnd() {
    Scaffold.of(context).openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    assert(!widget.primary || debugCheckHasMediaQuery(context));
    assert(debugCheckHasMaterialLocalizations(context));
    final ThemeData theme = Theme.of(context);
    final AppBarTheme appBarTheme = AppBarTheme.of(context);
    final ScaffoldState scaffold = Scaffold.of(context);
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool hasDrawer = scaffold.hasDrawer;
    final bool hasEndDrawer = scaffold.hasEndDrawer;
    final bool canPop = parentRoute?.canPop ?? false;
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    IconThemeData overallIconTheme =
        widget.iconTheme ?? appBarTheme.iconTheme ?? theme.primaryIconTheme;
    IconThemeData actionsIconTheme = widget.actionsIconTheme ??
        appBarTheme.actionsIconTheme ??
        overallIconTheme;
    TextStyle? centerStyle = widget.textTheme?.headline5 ??
        appBarTheme.titleTextStyle ??
        theme.primaryTextTheme.headline5;
    TextStyle? sideStyle = widget.textTheme?.bodyText1 ??
        appBarTheme.toolbarTextStyle ??
        theme.primaryTextTheme.bodyText1;

    if (widget.toolbarOpacity != 1.0) {
      final double opacity = const Interval(
        0.25,
        1,
        curve: Curves.fastOutSlowIn,
      ).transform(widget.toolbarOpacity);
      if (centerStyle?.color != null) {
        centerStyle = centerStyle!.copyWith(
          color: centerStyle.color!.withOpacity(opacity),
        );
      }
      if (sideStyle?.color != null) {
        sideStyle = sideStyle!.copyWith(
          color: sideStyle.color!.withOpacity(opacity),
        );
      }
      overallIconTheme = overallIconTheme.copyWith(
        opacity: opacity * (overallIconTheme.opacity ?? 1.0),
      );
      actionsIconTheme = actionsIconTheme.copyWith(
        opacity: opacity * (actionsIconTheme.opacity ?? 1.0),
      );
    }

    Widget? leading = widget.leading;
    if (leading == null && widget.automaticallyImplyLeading) {
      if (hasDrawer) {
        leading = IconButton(
          icon: const Icon(Icons.menu),
          onPressed: _handleDrawerButton,
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      } else {
        if (canPop) {
          leading = useCloseButton ? const CloseButton() : const BackButton();
        }
      }
    }
    if (leading != null) {
      leading = ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: _kLeadingWidth),
        child: leading,
      );
    }

    Widget? title = widget.title;
    if (title != null && centerStyle != null) {
      bool? namesRoute;
      switch (theme.platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          namesRoute = true;
          break;
        case TargetPlatform.iOS:
          break;
        default:
          break;
      }
      title = DefaultTextStyle(
        style: centerStyle,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
        child: Semantics(
          namesRoute: namesRoute,
          child: AnterosAppBarTitleBar(child: title),
          header: true,
        ),
      );
    }

    Widget? actions;
    if (widget.actions != null && widget.actions!.isNotEmpty) {
      actions = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widget.actions!,
      );
    } else if (hasEndDrawer) {
      actions = IconButton(
        icon: const Icon(Icons.menu),
        onPressed: _handleDrawerButtonEnd,
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    }

    // Permitir que as ações das ações tenham seu próprio tema, se necessário.
    if (actions != null) {
      actions = IconTheme.merge(
        data: actionsIconTheme,
        child: actions,
      );
    }

    if (showSearchBar) {
      searchBar = TextField(
        cursorColor: widget.searchBarColorTheme,
        style: widget.searchTextStyle,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: widget.searchBarColorTheme,
            size: 18,
          ),
          suffixIcon: AnterosIconButton(
            icon: Icon(
              Icons.close,
              color: widget.searchBarColorTheme,
              size: 20,
            ),
            type: AnterosButtonType.transparent,
            onPressed: () {
              widget.onSubmitted?.call('');
              final controller = widget.searchController ?? _searchController;
              setState(() {
                showSearchBar = !showSearchBar;
                controller.text = '';
              });
            },
          ),
          hintText: widget.searchHintText,
          hintStyle: widget.searchHintStyle,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: widget.searchBarColorTheme,
            ),
          ),
        ),
        onTap: widget.onTap,
        onChanged: widget.onChanged,
        controller: widget.searchController ?? _searchController,
        onSubmitted: widget.onSubmitted,
      );
    }

    if (!showSearchBar) {
      searchBar = ListTile(
        contentPadding: EdgeInsets.zero,
        title: title,
        trailing: AnterosIconButton(
          icon: Icon(
            Icons.search,
            color: widget.searchBarColorTheme,
            size: 20,
          ),
          type: AnterosButtonType.transparent,
          onPressed: () {
            setState(() {
              showSearchBar = true;
            });
          },
        ),
      );
    }

    final Widget toolbar = NavigationToolbar(
      leading: leading,
      middle: widget.searchBar ? searchBar : title,
      trailing: actions,
      centerMiddle: widget._getEffectiveCenterTitle(theme),
      middleSpacing: widget.titleSpacing,
    );

    // Se a barra de ferramentas estiver alocada com menos de kToolbarHeight, faça-a
    // parece rolar para cima dentro de seu contêiner reduzido.
    Widget appBar = ClipRect(
      child: CustomSingleChildLayout(
        delegate: const _ToolbarContainerLayout(),
        child: IconTheme.merge(
          data: overallIconTheme,
          child: DefaultTextStyle(
            style: sideStyle ?? const TextStyle(),
            child: toolbar,
          ),
        ),
      ),
    );
    if (widget.bottom != null) {
      appBar = Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: kToolbarHeight),
              child: appBar,
            ),
          ),
          Opacity(
            opacity: const Interval(
              0.25,
              1,
              curve: Curves.fastOutSlowIn,
            ).transform(widget.bottomOpacity),
            child: widget.bottom,
          ),
        ],
      );
    }

    // O preenchimento se aplica à barra de ferramentas e tabBar, não ao espaço flexível.
    if (widget.primary) {
      appBar = SafeArea(
        top: true,
        child: appBar,
      );
    }

    appBar = Align(
      alignment: Alignment.topCenter,
      child: appBar,
    );

    if (widget.flexibleSpace != null) {
      appBar = Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          widget.flexibleSpace!,
          appBar,
        ],
      );
    }

    final Brightness brightness = widget.brightness ?? theme.brightness;
    final SystemUiOverlayStyle overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return Semantics(
      container: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: Material(
          color: widget.backgroundColor ??
              appBarTheme.backgroundColor ??
              theme.primaryColor,
          elevation:
              widget.elevation ?? appBarTheme.elevation ?? _defaultElevation,
          shape: widget.shape,
          child: Semantics(
            explicitChildNodes: true,
            child: appBar,
          ),
        ),
      ),
    );
  }
}

const double _kLeadingWidth = kToolbarHeight;

class _ToolbarContainerLayout extends SingleChildLayoutDelegate {
  const _ToolbarContainerLayout();

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) =>
      constraints.tighten(
        height: kToolbarHeight,
      );

  @override
  Size getSize(BoxConstraints constraints) => Size(
        constraints.maxWidth,
        kToolbarHeight,
      );

  @override
  Offset getPositionForChild(Size size, Size childSize) =>
      Offset(0, size.height - childSize.height);

  @override
  bool shouldRelayout(_ToolbarContainerLayout oldDelegate) => false;
}

// Layout do título do AnterosAppBar com altura irrestrita, verticalmente
// centraliza-o dentro de seu pai (NavigationToolbar) e permite que o
// pai para restringir a altura real do título.
class AnterosAppBarTitleBar extends SingleChildRenderObjectWidget {
  const AnterosAppBarTitleBar({Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  RenderGFAppBarTitleBar createRenderObject(BuildContext context) =>
      RenderGFAppBarTitleBar(
        textDirection: Directionality.of(context),
      );

  @override
  void updateRenderObject(
      BuildContext context, RenderGFAppBarTitleBar renderObject) {
    renderObject.textDirection = Directionality.of(context);
  }
}

class RenderGFAppBarTitleBar extends RenderAligningShiftedBox {
  RenderGFAppBarTitleBar({
    RenderBox? child,
    TextDirection? textDirection,
  }) : super(
          child: child,
          alignment: Alignment.center,
          textDirection: textDirection,
        );

  @override
  void performLayout() {
    final BoxConstraints innerConstraints =
        constraints.copyWith(maxHeight: double.infinity);
    child?.layout(
      innerConstraints,
      parentUsesSize: true,
    );
    if (child != null) {
      size = constraints.constrain(child!.size);
    }
    alignChild();
  }
}
