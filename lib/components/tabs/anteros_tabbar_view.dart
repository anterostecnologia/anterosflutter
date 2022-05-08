import 'dart:async';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

/// Uma visualização de página que exibe o widget que corresponde à guia atualmente selecionada.
/// este widget é normalmente usado em conjunto com um [AnterosTabBar] ou [AnterosSegmentTabs].
class AnterosTabBarView extends StatefulWidget {
  /// cria uma visualização de página com uma criança por guia.
  /// O comprimento do [children] deve ser o mesmo que o [controller]'s comprimento.
  const AnterosTabBarView({
    Key? key,
    required this.children,
    required this.controller,
    this.physics,
    this.height,
    this.dragStartBehavior = DragStartBehavior.start,
    this.tabScrollDuration,
  }) : super(key: key);

  /// O estado de seleção e animação deste widget.
  final TabController? controller;

  /// Um widget por guia.
  /// seu comprimento deve corresponder ao comprimento do [AnterosTabBar.tabs]
  /// Lista, bem como o [controller]'s [TabController.length].
  final List<Widget> children;

  /// Como a visualização da página deve responder à entrada do usuário.
  /// por exemplo, determina como a visualização da página continua a animar após o
  /// O usuário para de arrastar a visualização da página.
  /// A física é modificada para encaixar nos limites da página usando
  /// [PageScrollPhysics] antes de ser usado.
  /// Padrões para convenções de plataforma correspondentes.
  final ScrollPhysics? physics;

  /// {@macro flutter.widgets.scrollable.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  /// [AnterosTabBarView] A altura pode ser consertada usando [double]
  final double? height;

  final Duration? tabScrollDuration;

  @override
  _AnterosTabBarViewState createState() => _AnterosTabBarViewState();
}

class _AnterosTabBarViewState extends State<AnterosTabBarView> {
  TabController? _controller;
  late PageController _pageController;
  late List<Widget> _children;
  late List<Widget> _childrenWithKey;
  int? _currentIndex;
  int _warpUnderwayCount = 0;

  // Se o TabBarview for reconstruído com um novo controlador de guia, o chamador deve
  // descarte o antigo.Nesse caso, a animação do antigo controlador será
  // nulo e não deve ser acessado.
  bool get _controllerIsValid => _controller?.animation != null;

  void _updateTabController() {
    final TabController? newController =
        widget.controller ?? DefaultTabController.of(context);
    assert(() {
      if (newController == null) {
        throw FlutterError('Sem TabController para ${widget.runtimeType}.\n'
            'Ao criar um ${widget.runtimeType}, você deve fornecer uma declaração explícita '
            'TabController usando o "controller" propriedade, ou você deve garantir que haja '
            'é um DefaultTabController acima de ${widget.runtimeType}.\n'
            'Nesse caso, não havia um controlador explícito nem um controlador padrão.');
      }
      return true;
    }());

    if (newController == _controller) {
      return;
    }

    if (_controllerIsValid) {
      _controller!.animation!.removeListener(_handleTabControllerAnimationTick);
    }
    _controller = newController;
    if (_controller != null) {
      _controller!.animation!.addListener(_handleTabControllerAnimationTick);
    }
  }

  @override
  void initState() {
    super.initState();
    _updateChildren();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateTabController();
    _currentIndex = _controller?.index;
    _pageController = PageController(initialPage: _currentIndex ?? 0);
  }

  @override
  void didUpdateWidget(AnterosTabBarView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _updateTabController();
    }
    if (widget.children != oldWidget.children && _warpUnderwayCount == 0) {
      _updateChildren();
    }
  }

  @override
  void dispose() {
    if (_controllerIsValid) {
      _controller!.animation!.removeListener(_handleTabControllerAnimationTick);
    }
    _controller = null;
    // Não possuímos a animação _Controller, então ela não está descartada aqui.
    super.dispose();
  }

  void _updateChildren() {
    _children = widget.children;
    _childrenWithKey = KeyedSubtree.ensureUniqueKeysForList(widget.children);
  }

  void _handleTabControllerAnimationTick() {
    if (_warpUnderwayCount > 0 || !_controller!.indexIsChanging) {
      return;
    }// Este widget está impulsionando a animação do controlador.

    if (_controller!.index != _currentIndex) {
      _currentIndex = _controller!.index;
      _warpToCurrentIndex();
    }
  }

  Future<void> _warpToCurrentIndex() async {
    if (!mounted) {
      return Future<void>.value();
    }

    if (_pageController.page == _currentIndex!.toDouble()) {
      return Future<void>.value();
    }

    final int previousIndex = _controller!.previousIndex;
    if ((_currentIndex! - previousIndex).abs() == 1) {
      _warpUnderwayCount += 1;
      await _pageController.animateToPage(_currentIndex!,
          duration: widget.tabScrollDuration ?? kTabScrollDuration,
          curve: Curves.ease);
      _warpUnderwayCount -= 1;
      return Future<void>.value();
    }

    assert((_currentIndex! - previousIndex).abs() > 1);
    final int initialPage = _currentIndex! > previousIndex
        ? _currentIndex! - 1
        : _currentIndex! + 1;
    final List<Widget> originalChildren = _childrenWithKey;
    setState(() {
      _warpUnderwayCount += 1;

      _childrenWithKey = List<Widget>.from(_childrenWithKey, growable: false);
      final Widget temp = _childrenWithKey[initialPage];
      _childrenWithKey[initialPage] = _childrenWithKey[previousIndex];
      _childrenWithKey[previousIndex] = temp;
    });
    _pageController.jumpToPage(initialPage);

    await _pageController.animateToPage(_currentIndex!,
        duration: widget.tabScrollDuration ?? kTabScrollDuration,
        curve: Curves.ease);
    if (!mounted) {
      return Future<void>.value();
    }
    setState(() {
      _warpUnderwayCount -= 1;
      if (widget.children != _children) {
        _updateChildren();
      } else {
        _childrenWithKey = originalChildren;
      }
    });
  }

  // chamado quando a PageView Scrolls
  bool _handleScrollNotification(ScrollNotification notification) {
    if (_warpUnderwayCount > 0) {
      return false;
    }

    if (notification.depth != 0) {
      return false;
    }

    _warpUnderwayCount += 1;
    if (notification is ScrollUpdateNotification &&
        !_controller!.indexIsChanging) {
      if ((_pageController.page! - _controller!.index).abs() > 1.0) {
        _controller!.index = _pageController.page!.floor();
        _currentIndex = _controller!.index;
      }
      _controller!.offset =
          (_pageController.page! - _controller!.index).clamp(-1.0, 1.0);
    } else if (notification is ScrollEndNotification) {
      _controller!.index = _pageController.page!.round();
      _currentIndex = _controller!.index;
      if (!_controller!.indexIsChanging) {
        _controller!.offset =
            (_pageController.page! - _controller!.index).clamp(-1.0, 1.0);
      }
    }
    _warpUnderwayCount -= 1;

    return false;
  }

  @override
  Widget build(BuildContext context) {
    assert(() {
      if (_controller?.length != widget.children.length) {
        throw FlutterError(
            'Controller\'s propriedade de comprimento (${_controller?.length}) não corresponde ao \n'
            'número de abas (${widget.children.length}) presente em TabBar\'s propriedade tabs.');
      }
      return true;
    }());
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: Container(
        height: widget.height ?? MediaQuery.of(context).size.height,
        child: PageView(
          dragStartBehavior: widget.dragStartBehavior,
          controller: _pageController,
          // physics: widget.physics == null
          //     ? _kGFTabBarViewPhysics
          //     : _kGFTabBarViewPhysics.applyTo(widget.physics),
          physics: widget.physics == null
              ? const PageScrollPhysics().applyTo(const ClampingScrollPhysics())
              : const PageScrollPhysics().applyTo(widget.physics),
          children: _childrenWithKey,
        ),
      ),
    );
  }
}
