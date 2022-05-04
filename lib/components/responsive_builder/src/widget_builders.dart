import 'package:anterosflutter/components/responsive_builder/src/helpers.dart';
import 'package:anterosflutter/components/responsive_builder/src/sizing_information.dart';
import 'package:flutter/material.dart';

import 'device_screen_type.dart';

typedef WidgetBuilder = Widget Function(BuildContext);

/// um widget com um construtor que fornece a informação de dimensionamento
///
/// Este widget é usado pelo ScreEntyPelayout para fornecer diferentes widgets Builders
class AnterosResponsiveBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    AnterosSizingInformation sizingInformation,
  ) builder;

  final AnterosScreenBreakpoints? breakpoints;
  final AnterosRefinedBreakpoints? refinedBreakpoints;

  const AnterosResponsiveBuilder({
    Key? key,
    required this.builder,
    this.breakpoints,
    this.refinedBreakpoints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      var mediaQuery = MediaQuery.of(context);
      var sizingInformation = AnterosSizingInformation(
        deviceScreenType: getDeviceType(mediaQuery.size, breakpoints),
        refinedSize: getRefinedSize(
          mediaQuery.size,
          refinedBreakpoint: refinedBreakpoints,
        ),
        screenSize: mediaQuery.size,
        localWidgetSize:
            Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
      );
      return builder(context, sizingInformation);
    });
  }
}

enum OrientationLayoutBuilderMode {
  auto,
  landscape,
  portrait,
}

/// Fornece uma função construtora para um widget de paisagem e retrato
class AnterosOrientationLayoutBuilder extends StatelessWidget {
  final WidgetBuilder? landscape;
  final WidgetBuilder portrait;
  final OrientationLayoutBuilderMode mode;

  const AnterosOrientationLayoutBuilder({
    Key? key,
    this.landscape,
    required this.portrait,
    this.mode = OrientationLayoutBuilderMode.auto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        var orientation = MediaQuery.of(context).orientation;
        if (mode != OrientationLayoutBuilderMode.portrait &&
            (orientation == Orientation.landscape ||
                mode == OrientationLayoutBuilderMode.landscape)) {
          if (landscape != null) {
            return landscape!(context);
          }
        }

        return portrait(context);
      },
    );
  }
}

/// fornece uma função do construtor para diferentes tipos de tela
///
/// Cada construtor será construído com base na largura do dispositivo atual.
/// [breakpoints] Defina suas próprias resoluções de dispositivo personalizado
/// [watch] será construído e mostrado quando a largura for menor que 300
/// [mobile] será construído quando largura maior que 300
/// [tablet] será construído quando a largura for maior que 600
/// [desktop] será construído se a largura for maior que 950
class AnterosScreenTypeLayout extends StatelessWidget {
  final AnterosScreenBreakpoints? breakpoints;

  final WidgetBuilder? watch;
  final WidgetBuilder mobile;
  final WidgetBuilder? tablet;
  final WidgetBuilder? desktop;

  AnterosScreenTypeLayout({
    Key? key,
    this.breakpoints,
    Widget? watch,
    required Widget mobile,
    Widget? tablet,
    Widget? desktop,
  })  : this.watch = _builderOrNull(watch),
        this.mobile = _builderOrNull(mobile)!,
        this.tablet = _builderOrNull(tablet),
        this.desktop = _builderOrNull(desktop),
        super(key: key);

  const AnterosScreenTypeLayout.builder({
    Key? key,
    this.breakpoints,
    this.watch,
    required this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  static WidgetBuilder? _builderOrNull(Widget? widget) {
    return widget == null ? null : ((_) => widget);
  }

  @override
  Widget build(BuildContext context) {
    return AnterosResponsiveBuilder(
      breakpoints: breakpoints,
      builder: (context, sizingInformation) {
        // Se estamos no tamanho da área de trabalho
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          // Se fornecemos o layout da área de trabalho, exiba isso
          if (desktop != null) return desktop!(context);
          // Se nenhum layout de desktop for fornecido, queremos verificar se tivermos o tamanho abaixo e exibirá que
          if (tablet != null) return tablet!(context);
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          if (tablet != null) return tablet!(context);
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.watch &&
            watch != null) {
          return watch!(context);
        }

        // Se nenhum dos layouts acima for fornecido ou estamos no layout móvel, mostramos o layout móvel
        return mobile(context);
      },
    );
  }
}

/// Fornece uma função construtora para tamanhos de tela refinados para serem usados com [AnterosScreenTypeLayout]
///
/// Cada construtor será construído com base na largura do dispositivo atual.
/// [breakpoints] Defina suas próprias resoluções de dispositivo personalizado
/// [extraLarge] será construído se a largura for maior que 2160 em desktops, 1280 em comprimidos e 600 em celulares
/// [large] será construído quando a largura for maior que 1440 em desktops, 1024 em comprimidos e 414 em celulares
/// [normal] será construído quando a largura for maior que 1080 em desktops, 768 em tablets e 375 em celulares
/// [small] será construído se a largura for menor que 720 em desktops, 600 em comprimidos e 320 em celulares
class AnterosRefinedLayoutBuilder extends StatelessWidget {
  final AnterosRefinedBreakpoints? refinedBreakpoints;

  final WidgetBuilder? extraLarge;
  final WidgetBuilder? large;
  final WidgetBuilder normal;
  final WidgetBuilder? small;

  const AnterosRefinedLayoutBuilder({
    Key? key,
    this.refinedBreakpoints,
    this.extraLarge,
    this.large,
    required this.normal,
    this.small,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnterosResponsiveBuilder(
      refinedBreakpoints: refinedBreakpoints,
      builder: (context, sizingInformation) {
        // Se estamos em tamanho extra grande
        if (sizingInformation.refinedSize == RefinedSize.extraLarge) {
          // Se fornecemos o layout extra grande, exiba isso
          if (extraLarge != null) return extraLarge!(context);
          // Se nenhum layout extra grande for fornecido, queremos verificar se tivermos o tamanho abaixo e exibirá que
          if (large != null) return large!(context);
        }

        if (sizingInformation.refinedSize == RefinedSize.large) {
          // Se fornecemos o grande layout, exiba isso
          if (large != null) return large!(context);
          // Se nenhum layout grande for fornecido, queremos verificar se tivermos o tamanho abaixo e exibirá que
          return normal(context);
        }

        if (sizingInformation.refinedSize == RefinedSize.small) {
          // Se fornecemos o pequeno layout, exiba isso
          if (small != null) return small!(context);
        }

        // Se nenhum dos layouts acima for fornecido ou estamos no layout de tamanho pequeno, mostramos o pequeno layout
        return normal(context);
      },
    );
  }
}
