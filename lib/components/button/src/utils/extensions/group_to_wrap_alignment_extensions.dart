import 'package:anterosflutter/components/button/src/utils/models/models.dart';
import 'package:flutter/material.dart';

/// Make [WrapAlignment] from [AnterosMainGroupAlignment]
extension GroupToMainWrap on AnterosMainGroupAlignment {
  WrapAlignment toWrap() {
    switch (this) {
      case AnterosMainGroupAlignment.center:
        return WrapAlignment.center;
      case AnterosMainGroupAlignment.end:
        return WrapAlignment.end;
      case AnterosMainGroupAlignment.start:
        return WrapAlignment.start;
      case AnterosMainGroupAlignment.spaceAround:
        return WrapAlignment.spaceAround;
      case AnterosMainGroupAlignment.spaceBetween:
        return WrapAlignment.spaceBetween;
      case AnterosMainGroupAlignment.spaceEvenly:
        return WrapAlignment.spaceEvenly;
    }
  }
}

/// Make [WrapCrossAlignment] from [AnterosCrossGroupAlignment]
extension GroupToCrossWrap on AnterosCrossGroupAlignment {
  WrapCrossAlignment toWrap() {
    switch (this) {
      case AnterosCrossGroupAlignment.center:
        return WrapCrossAlignment.center;
      case AnterosCrossGroupAlignment.end:
        return WrapCrossAlignment.end;
      case AnterosCrossGroupAlignment.start:
        return WrapCrossAlignment.start;
    }
  }
}

/// Make [WrapAlignment] from [GroupRunAlignment]
extension GroupToRunWrap on AnterosGroupRunAlignment {
  WrapAlignment toWrap() {
    switch (this) {
      case AnterosGroupRunAlignment.center:
        return WrapAlignment.center;
      case AnterosGroupRunAlignment.end:
        return WrapAlignment.end;
      case AnterosGroupRunAlignment.start:
        return WrapAlignment.start;
      case AnterosGroupRunAlignment.spaceAround:
        return WrapAlignment.spaceAround;
      case AnterosGroupRunAlignment.spaceBetween:
        return WrapAlignment.spaceBetween;
      case AnterosGroupRunAlignment.spaceEvenly:
        return WrapAlignment.spaceEvenly;
    }
  }
}
