import 'package:flutter/material.dart';

/// Os possíveis alinhamentos de um [AnterosDrawer].
enum AnterosDrawerAlignment {
  /// Indica que o [AnterosDrawer] está no lado inicial do [Scaffold].
  ///
  /// Isso corresponde ao lado esquerdo quando a direção do texto é da esquerda para a direita
  /// e o lado direito quando a direção do texto é da direita para a esquerda.
  start,

  /// Indica que o [AnterosDrawer] está no lado final do [Scaffold].
  ///
  /// Isso corresponde ao lado direito quando a direção do texto é da esquerda para a direita
  /// e o lado esquerdo quando a direção do texto é da direita para a esquerda.
  end,
}

// Móvel:
// Largura = Largura da tela - 56 dp
// Largura máxima: 320dp
// A largura máxima se aplica somente ao usar um navegador esquerdo. Ao usar uma navegação direita,
// o painel pode cobrir toda a largura da tela.

// Desktop/tablet:
// A largura máxima para um navegador esquerdo é 400dp.
// A navegação direita pode variar dependendo do conteúdo.

const double _kWidth = 304;
// const double _kEdgeDragWidth = 20.0;
// const double _kMinFlingVelocity = 365.0;
// const Duration _kBaseSettleDuration = Duration(milissegundos: 246);

/// Um ​​painel de design de material que desliza horizontalmente da borda de um
/// [Scaffold] para mostrar links de navegação em um aplicativo.
///
/// AnterosDrawers são normalmente usados ​​com a propriedade [Scaffold.drawer]. O filho de
/// a gaveta geralmente é uma [ListView] cujo primeiro filho é um AnterosDrawerHeader
/// que exibe informações de status sobre o usuário atual. O restante
/// os filhos da gaveta geralmente são construídos com [ListTile]s, geralmente concluindo
/// com um [AboutListTile].
///
/// O [AppBar] exibe automaticamente um [IconButton] apropriado para mostrar o
/// [AnterosDrawer] quando um [AnterosDrawer] está disponível no [Scaffold]. O [Andaime]
/// manipula automaticamente o gesto de deslizar na borda para mostrar a gaveta.
///
/// Este exemplo mostra como criar um [Scaffold] que contém um [AppBar] e
/// a [AnterosDrawer]. Um usuário toca no ícone "menu" no [AppBar] para abrir o
/// [AnterosDrawer]. O [AnterosDrawer] exibe quatro itens: Um cabeçalho e três itens de menu.
/// O [AnterosDrawer] exibe os quatro itens usando um [ListView], que permite a
/// usuário para rolar pelos itens, se necessário.
///
class AnterosDrawer extends StatelessWidget {
  /// Cria uma gaveta de design de material.
  /// Normalmente usado na propriedade [Scaffold.drawer].
  /// A [elevation] deve ser não negativa.
  const AnterosDrawer({
    Key? key,
    this.elevation = 16.0,
    this.child,
    this.semanticLabel,
    this.backgroundImage,
    this.colorFilter,
    this.gradient,
    this.color,
  })  : assert(elevation >= 0.0),
        super(key: key);

  /// A coordenada z na qual colocar esta gaveta em relação ao seu pai.
  ///
  /// Isso controla o tamanho da sombra abaixo da gaveta.
  ///
  /// O padrão é 16, a elevação apropriada para gavetas. O valor é
  /// sempre não negativo.
  final double elevation;

  /// O widget abaixo deste widget na árvore.
  ///
  /// Normalmente um [SliverList].
  ///
  /// {@macro flutter.widgets.child}
  final Widget? child;

  /// O rótulo semântico do diálogo usado pelos frameworks de acessibilidade para
  /// anuncia transições de tela quando a gaveta é aberta e fechada.
  ///
  /// Se este rótulo não for fornecido, o padrão será
  /// [MaterialLocalizations.drawerLabel].
  ///
  /// Veja também:
  ///
  /// * SemanticsConfiguration.namesRoute, para uma descrição de como isso
  /// valor é usado.
  final String? semanticLabel;

  /// A imagem de fundo pode ser adicionada ao [AnterosDrawer].
  final ImageProvider? backgroundImage;

  /// Uma camada composta que aplica um filtro de cor a seus filhos.
  final ColorFilter? colorFilter;

  /// Gradient pode ser usado para transformar shaders de gradiente sem
  /// aplicando a mesma transformação em toda a tela.
  final Gradient? gradient;

  /// Define a cor de fundo da gaveta
  final Color? color;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    String? label = semanticLabel;
    switch (Theme.of(context).platform) {
      case TargetPlatform.iOS:
        label = semanticLabel;
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        label = semanticLabel ?? MaterialLocalizations.of(context).drawerLabel;
        break;
      default:
        break;
    }
    return Semantics(
      scopesRoute: true,
      namesRoute: true,
      explicitChildNodes: true,
      label: label,
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(width: _kWidth),
        child: Material(
          elevation: elevation,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              gradient: gradient,
              image: backgroundImage != null
                  ? DecorationImage(
                      image: backgroundImage!,
                      fit: BoxFit.cover,
                      colorFilter: colorFilter,
                    )
                  : null,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
