import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosDrawerHeaderPictures extends StatelessWidget {
  const AnterosDrawerHeaderPictures({
    Key? key,
    this.currentAccountPicture,
    this.otherAccountsPictures,
    this.closeButton,
    this.centerAlign = false,
  }) : super(key: key);

  /// Um ​​widget colocado no canto superior esquerdo que representa o atual
  /// conta do usuário. Normalmente um [CircleAvatar].
  final Widget? currentAccountPicture;

  /// Uma lista de widgets que representam as outras contas do usuário atual.
  /// Até três desses widgets serão organizados em uma linha no cabeçalho
  /// canto superior direito. Normalmente uma lista de widgets [CircleAvatar].
  final List<Widget>? otherAccountsPictures;

  /// a gaveta onTap do widget é fechada
  final Widget? closeButton;

  final bool centerAlign;

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          closeButton == null
              ? AnterosIconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  type: AnterosButtonType.transparent,
                )
              : closeButton!,
          PositionedDirectional(
            top: 0,
            end: 0,
            child: Row(
              children: (otherAccountsPictures ?? <Widget>[])
                  .take(3)
                  .map<Widget>(
                    (Widget picture) => Padding(
                      padding: const EdgeInsetsDirectional.only(start: 8),
                      child: Semantics(
                        container: true,
                        child: Container(
                          padding: const EdgeInsets.only(left: 8, bottom: 8),
                          width: 48,
                          height: 48,
                          child: picture,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Align(
            alignment:
                centerAlign ? Alignment.bottomCenter : Alignment.bottomLeft,
            child: Semantics(
              explicitChildNodes: true,
              child: SizedBox(
                width: 72,
                height: 72,
                child: currentAccountPicture,
              ),
            ),
          ),
        ],
      );
}

/// Um ​​cabeçalho de design de material [Drawer] que identifica o usuário do aplicativo.
/// Requer que um de seus ancestrais seja um widget [Material].
class AnterosDrawerHeader extends StatefulWidget {
  /// Cria um cabeçalho de gaveta de design de material.
  ///
  /// Requer que um de seus ancestrais seja um widget [Material].
  const AnterosDrawerHeader({
    Key? key,
    this.decoration,
    this.margin = const EdgeInsets.only(bottom: 8),
    this.currentAccountPicture,
    this.otherAccountsPictures,
    this.centerAlign = false,
    this.child,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.fastOutSlowIn,
    this.closeButton,
  }) : super(key: key);

  /// O plano de fundo do cabeçalho. Se a decoração for nula, então um [BoxDecoration]
  /// com sua cor de fundo definida para o primaryColor do tema atual é usado.
  final Decoration? decoration;

  /// A margem ao redor do cabeçalho da gaveta.
  final EdgeInsetsGeometry margin;

  /// Um ​​widget colocado no canto superior esquerdo que representa o atual
  /// conta do usuário. Normalmente um [CircleAvatar].
  final Widget? currentAccountPicture;

  /// Uma lista de widgets que representam as outras contas do usuário atual.
  /// Até três desses widgets serão organizados em uma linha no cabeçalho
  /// canto superior direito. Normalmente uma lista de widgets [CircleAvatar].
  final List<Widget>? otherAccountsPictures;

  // ignora: comment_references
  /// Se centerAlign estiver [habilitado] então currentAccountPicture em AnterosDrawerHeader
  /// ficará alinhado ao centro.
  ///
  /// Por padrão centerAlign é falso.
  final bool centerAlign;

  /// Um ​​widget a ser colocado dentro do cabeçalho da gaveta, inserido pelo preenchimento.
  ///
  /// Este widget será dimensionado para o tamanho do cabeçalho. Para posicionar a criança
  /// precisamente, considere usar um widget [Align] ou [Center].
  ///
  /// {@macro flutter.widgets.child}
  final Widget? child;

  /// A duração das animações da [decoração].
  final Duration duration;

  /// A curva para animações da [decoração].
  final Curve curve;

  /// a gaveta onTap do widget é fechada
  final Widget? closeButton;

  @override
  _AnterosDrawerHeaderState createState() => _AnterosDrawerHeaderState();
}

class _AnterosDrawerHeaderState extends State<AnterosDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    assert(debugCheckHasMaterialLocalizations(context));
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Semantics(
      container: true,
      label: MaterialLocalizations.of(context).signedInLabel,
      child: Container(
        height: statusBarHeight + 185.0,
        decoration: widget.decoration ??
            BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
        margin: widget.margin,
        padding: const EdgeInsetsDirectional.only(top: 16, start: 16),
        child: SafeArea(
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: AnterosDrawerHeaderPictures(
                    currentAccountPicture: widget.currentAccountPicture,
                    otherAccountsPictures: widget.otherAccountsPictures,
                    closeButton: widget.closeButton,
                    centerAlign: widget.centerAlign,
                  ),
                ),
              ),
              AnimatedContainer(
                padding: const EdgeInsets.only(bottom: 16),
                duration: widget.duration,
                curve: widget.curve,
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
