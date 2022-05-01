import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../anteros_responsive_builder.dart';

/// retorna o [DeviceScreenType] que o aplicativo está em execução atualmente
DeviceScreenType getDeviceType(
  Size size, [
  AnterosScreenBreakpoints? breakpoint,
]) {
  double deviceWidth = size.shortestSide;

  if (kIsWeb) {
    deviceWidth = size.width;
  }

  // Substitui os padrões pelas definições definidas pelo usuário
  if (breakpoint != null) {
    if (deviceWidth > breakpoint.desktop) {
      return DeviceScreenType.desktop;
    }

    if (deviceWidth > breakpoint.tablet) {
      return DeviceScreenType.tablet;
    }

    if (deviceWidth < breakpoint.watch) {
      return DeviceScreenType.watch;
    }
  } else {
    // Se nenhuma definição definida pelo usuário for passada, use os padrões
    if (deviceWidth >=
        AnterosResponsiveSizingConfig.instance.breakpoints.desktop) {
      return DeviceScreenType.desktop;
    }

    if (deviceWidth >=
        AnterosResponsiveSizingConfig.instance.breakpoints.tablet) {
      return DeviceScreenType.tablet;
    }

    if (deviceWidth <
        AnterosResponsiveSizingConfig.instance.breakpoints.watch) {
      return DeviceScreenType.watch;
    }
  }

  return DeviceScreenType.mobile;
}

/// Retorna o [RefindedSize] Para cada dispositivo em que o aplicativo está em execução atualmente
RefinedSize getRefinedSize(
  Size size, {
  AnterosRefinedBreakpoints? refinedBreakpoint,
  bool isWebOrDesktop = kIsWeb,
}) {
  DeviceScreenType deviceScreenType = getDeviceType(size);
  double deviceWidth = size.shortestSide;

  if (isWebOrDesktop) {
    deviceWidth = size.width;
  }

  // Substitui os padrões pelas definições definidas pelo usuário
  if (refinedBreakpoint != null) {
    if (deviceScreenType == DeviceScreenType.desktop) {
      if (deviceWidth > refinedBreakpoint.desktopExtraLarge) {
        return RefinedSize.extraLarge;
      }

      if (deviceWidth > refinedBreakpoint.desktopLarge) {
        return RefinedSize.large;
      }

      if (deviceWidth > refinedBreakpoint.desktopNormal) {
        return RefinedSize.normal;
      }
    }

    if (deviceScreenType == DeviceScreenType.tablet) {
      if (deviceWidth > refinedBreakpoint.tabletExtraLarge) {
        return RefinedSize.extraLarge;
      }

      if (deviceWidth > refinedBreakpoint.tabletLarge) {
        return RefinedSize.large;
      }

      if (deviceWidth > refinedBreakpoint.tabletNormal) {
        return RefinedSize.normal;
      }
    }

    if (deviceScreenType == DeviceScreenType.mobile) {
      if (deviceWidth > refinedBreakpoint.mobileExtraLarge) {
        return RefinedSize.extraLarge;
      }

      if (deviceWidth > refinedBreakpoint.mobileLarge) {
        return RefinedSize.large;
      }

      if (deviceWidth > refinedBreakpoint.mobileNormal) {
        return RefinedSize.normal;
      }
    }

    if (deviceScreenType == DeviceScreenType.watch) {
      return RefinedSize.normal;
    }
  } else {
    // Se nenhuma definição definida pelo usuário for passada, use os padrões

    // Área de Trabalho
    if (deviceScreenType == DeviceScreenType.desktop) {
      if (deviceWidth >=
          AnterosResponsiveSizingConfig
              .instance.refinedBreakpoints.desktopExtraLarge) {
        return RefinedSize.extraLarge;
      }

      if (deviceWidth >=
          AnterosResponsiveSizingConfig
              .instance.refinedBreakpoints.desktopLarge) {
        return RefinedSize.large;
      }

      if (deviceWidth >=
          AnterosResponsiveSizingConfig
              .instance.refinedBreakpoints.desktopNormal) {
        return RefinedSize.normal;
      }
    }

    // Tábua
    if (deviceScreenType == DeviceScreenType.tablet) {
      if (deviceWidth >=
          AnterosResponsiveSizingConfig
              .instance.refinedBreakpoints.tabletExtraLarge) {
        return RefinedSize.extraLarge;
      }

      if (deviceWidth >=
          AnterosResponsiveSizingConfig
              .instance.refinedBreakpoints.tabletLarge) {
        return RefinedSize.large;
      }

      if (deviceWidth >=
          AnterosResponsiveSizingConfig
              .instance.refinedBreakpoints.tabletNormal) {
        return RefinedSize.normal;
      }
    }

    // Móvel
    if (deviceScreenType == DeviceScreenType.mobile) {
      if (deviceWidth >=
          AnterosResponsiveSizingConfig
              .instance.refinedBreakpoints.mobileExtraLarge) {
        return RefinedSize.extraLarge;
      }

      if (deviceWidth >=
          AnterosResponsiveSizingConfig
              .instance.refinedBreakpoints.mobileLarge) {
        return RefinedSize.large;
      }

      if (deviceWidth >=
          AnterosResponsiveSizingConfig
              .instance.refinedBreakpoints.mobileNormal) {
        return RefinedSize.normal;
      }
    }
  }

  return RefinedSize.small;
}

/// Retornará um dos valores passados para o dispositivo em que está em execução
T getValueForScreenType<T>({
  required BuildContext context,
  required T mobile,
  T? tablet,
  T? desktop,
  T? watch,
}) {
  var deviceScreenType = getDeviceType(MediaQuery.of(context).size);
  // Se estamos no tamanho da área de trabalho
  if (deviceScreenType == DeviceScreenType.desktop) {
    // Se fornecemos o layout da área de trabalho, exiba isso
    if (desktop != null) return desktop;
    // Se nenhum layout de desktop for fornecido, queremos verificar se tivermos o tamanho abaixo e exibirá que
    if (tablet != null) return tablet;
  }

  if (deviceScreenType == DeviceScreenType.tablet) {
    if (tablet != null) return tablet;
  }

  if (deviceScreenType == DeviceScreenType.watch && watch != null) {
    return watch;
  }

  // Se nenhum dos layouts acima for fornecido ou estamos no layout móvel, mostramos o layout móvel
  return mobile;
}

/// Retornará um dos valores passados para o tamanho refinado
T getValueForRefinedSize<T>({
  required BuildContext context,
  required T normal,
  T? large,
  T? extraLarge,
}) {
  var refinedSize = getRefinedSize(MediaQuery.of(context).size);
  // Se estamos em tamanho extra grande
  if (refinedSize == RefinedSize.extraLarge) {
    // Se fornecemos o layout extra grande, exiba isso
    if (extraLarge != null) return extraLarge;
    // Se nenhum layout extra grande for fornecido, queremos verificar se tivermos o tamanho abaixo e exibirá que
    if (large != null) return large;
  }

  if (refinedSize == RefinedSize.large) {
    // Se fornecemos o grande layout, exiba isso
    if (large != null) return large;
    // Se nenhum layout grande for fornecido, queremos verificar se tivermos o tamanho abaixo e exibirá que
    if (normal != null) return normal;
  }

  if (refinedSize == RefinedSize.normal) {
    // Se fornecemos o layout normal, exiba isso
    if (normal != null) return normal;
  }

  // Se nenhum dos layouts acima for fornecido ou estamos no layout de tamanho normal, mostramos o layout normal
  return normal;
}

class ScreenTypeValueBuilder<T> {
  @Deprecated('Use better named global function getValueForScreenType')
  T getValueForType({
    required BuildContext context,
    required T mobile,
    T? tablet,
    T? desktop,
    T? watch,
  }) {
    return getValueForScreenType(
      context: context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      watch: watch,
    );
  }
}
