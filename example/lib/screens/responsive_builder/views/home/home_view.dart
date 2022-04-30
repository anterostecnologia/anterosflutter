import 'package:flutter/material.dart';
import 'package:gf_app/screens/responsive_builder/views/home/home_view_mobile.dart';
import 'package:gf_app/screens/responsive_builder/views/home/home_view_tablet.dart';
import 'package:anterosflutter/anterosflutter.dart';

class ResponsiveHomeView extends StatelessWidget {
  const ResponsiveHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnterosScreenTypeLayout(
      breakpoints:
          AnterosScreenBreakpoints(desktop: 900, tablet: 650, watch: 250),
      mobile: AnterosOrientationLayoutBuilder(
        portrait: (context) => HomeMobilePortrait(),
        landscape: (context) => HomeMobileLandscape(),
      ),
      tablet: HomeViewTablet(),
    );
  }
}
