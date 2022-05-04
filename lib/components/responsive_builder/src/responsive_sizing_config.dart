import 'package:anterosflutter/components/responsive_builder/src/sizing_information.dart';

/// Mantém a configuração que determinará os pontos de interrupção para diferentes tamanhos de dispositivo
class AnterosResponsiveSizingConfig {
  static AnterosResponsiveSizingConfig? _instance;
  static AnterosResponsiveSizingConfig get instance {
    if (_instance == null) {
      _instance = AnterosResponsiveSizingConfig();
    }

    return _instance!;
  }

  static const AnterosScreenBreakpoints _defaultBreakPoints =
      const AnterosScreenBreakpoints(
    desktop: 950,
    tablet: 600,
    watch: 300,
  );

  AnterosScreenBreakpoints? _customBreakPoints;

  static const AnterosRefinedBreakpoints _defaultRefinedBreakPoints =
      const AnterosRefinedBreakpoints(
    // Desktop
    desktopExtraLarge: 4096,
    desktopLarge: 3840,
    desktopNormal: 1920,
    desktopSmall: 950,
    // Tablet
    tabletExtraLarge: 900,
    tabletLarge: 850,
    tabletNormal: 768,
    tabletSmall: 600,
    // Mobile
    mobileExtraLarge: 480,
    mobileLarge: 414,
    mobileNormal: 375,
    mobileSmall: 320,
  );

  AnterosRefinedBreakpoints? _customRefinedBreakPoints;

  /// Defina os pontos de interrupção que serão devolvidos através do [breakpoints]
  void setCustomBreakpoints(
    AnterosScreenBreakpoints? customBreakpoints, {
    AnterosRefinedBreakpoints? customRefinedBreakpoints,
  }) {
    _customBreakPoints = customBreakpoints;
    if (customRefinedBreakpoints != null) {
      _customRefinedBreakPoints = customRefinedBreakpoints;
    }
  }

  AnterosScreenBreakpoints get breakpoints =>
      _customBreakPoints ?? _defaultBreakPoints;

  AnterosRefinedBreakpoints get refinedBreakpoints =>
      _customRefinedBreakPoints ?? _defaultRefinedBreakPoints;
}
