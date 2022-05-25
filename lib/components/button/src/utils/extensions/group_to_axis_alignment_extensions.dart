import 'package:anterosflutter/components/button/src/utils/models/models.dart';
import 'package:flutter/material.dart';

/// Make [MainAxisAlignment] from [MainGroupAlignment]
extension GroupToMainAxis on AnterosMainGroupAlignment {
  MainAxisAlignment toAxis() {
    switch (this) {
      case AnterosMainGroupAlignment.center:
        return MainAxisAlignment.center;
      case AnterosMainGroupAlignment.end:
        return MainAxisAlignment.end;
      case AnterosMainGroupAlignment.start:
        return MainAxisAlignment.start;
      case AnterosMainGroupAlignment.spaceAround:
        return MainAxisAlignment.spaceAround;
      case AnterosMainGroupAlignment.spaceBetween:
        return MainAxisAlignment.spaceBetween;
      case AnterosMainGroupAlignment.spaceEvenly:
        return MainAxisAlignment.spaceEvenly;
    }
  }
}

/// Make [CrossAxisAlignment] from [CrossGroupAlignment]
extension GroupToRunAxis on AnterosCrossGroupAlignment {
  CrossAxisAlignment toAxis() {
    switch (this) {
      case AnterosCrossGroupAlignment.center:
        return CrossAxisAlignment.center;
      case AnterosCrossGroupAlignment.end:
        return CrossAxisAlignment.end;
      case AnterosCrossGroupAlignment.start:
        return CrossAxisAlignment.start;
    }
  }
}
