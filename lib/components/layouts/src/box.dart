import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AnterosBox extends StatelessWidget {
  /// AnterosBox is something between a Container and a SizedBox.
  /// Unlike a Container it can be made `const`, so it's good for creating colored boxes,
  /// with or without padding:
  ///
  /// ```
  /// const AnterosBox(color: Colors.red, width: 50, height:30, child: myChild);
  /// ```
  ///
  /// The `padding` is only applied if the child is NOT NULL. If the `child` is `null`
  /// and `width` and `height` are also `null`, this means the box will occupy no space
  /// (will be hidden). **Note:** This will be extended in the future, so that it ignores
  /// horizontal padding when the child has zero width, and ignores vertical padding when
  /// the child has zero height.
  ///
  /// You can also hide the box by making the `show` parameter equal to `false`.
  ///
  /// Note: You can use the [Pad] class (provided in the assorted_layout_widgets
  /// package) for the `padding`, instead of [EdgeInsets].
  ///
  /// # Debugging:
  /// * If need to quickly and temporarily add a color to your box so that you can see it,
  /// you can use the constructors `AnterosBox.r` for red, `AnterosBox.g` for green, and `BAnterosBoxox.b` for blue.
  /// * If you want to see rebuilds, you can use the `Box.rand` constructor.
  /// It will then change its color to a random one, whenever its build method is called.
  ///
  const AnterosBox({
    Key? key,
    this.show = true,
    this.color,
    this.padding,
    this.width,
    this.height,
    this.alignment,
    this.child,
    this.removePaddingWhenNoChild = false,
  })  : _random = false,
        super(key: key);

  const AnterosBox._({
    Key? key,
    this.show = true,
    this.color,
    this.padding,
    this.width,
    this.height,
    this.alignment,
    this.child,
    this.removePaddingWhenNoChild = false,
    bool? random,
  })  : _random = random ?? false,
        super(key: key);

  /// Adding `.r` to the box will make it red.
  /// Use this for debugging purposes only.
  /// This constructor is marked as deprecated so that you don't forget to remove it.
  @Deprecated("Use this for debugging purposes only.")
  const AnterosBox.r({
    Key? key,
    bool show = true,
    // ignore: avoid_unused_constructor_parameters
    Color? color,
    EdgeInsetsGeometry? padding,
    double? width,
    double? height,
    Alignment? alignment,
    Widget? child,
    bool removePaddingWhenNoChild = false,
  }) : this(
          key: key,
          show: show,
          color: Colors.red,
          padding: padding,
          width: width,
          height: height,
          alignment: alignment,
          child: child,
          removePaddingWhenNoChild: removePaddingWhenNoChild,
        );

  /// Adding `.g` to the box will make it green.
  /// Use this for debugging purposes only.
  /// This constructor is marked as deprecated so that you don't forget to remove it.
  @Deprecated("Use this for debugging purposes only.")
  const AnterosBox.g({
    Key? key,
    bool show = true,
    // ignore: avoid_unused_constructor_parameters
    Color? color,
    EdgeInsetsGeometry? padding,
    double? width,
    double? height,
    Alignment? alignment,
    Widget? child,
    bool removePaddingWhenNoChild = false,
  }) : this(
          key: key,
          show: show,
          color: Colors.green,
          padding: padding,
          width: width,
          height: height,
          alignment: alignment,
          child: child,
          removePaddingWhenNoChild: removePaddingWhenNoChild,
        );

  /// Adding `.b` to the box will make it blue.
  /// Use this for debugging purposes only.
  /// This constructor is marked as deprecated so that you don't forget to remove it.
  @Deprecated("Use this for debugging purposes only.")
  const AnterosBox.b({
    Key? key,
    bool show = true,
    // ignore: avoid_unused_constructor_parameters
    Color? color,
    EdgeInsetsGeometry? padding,
    double? width,
    double? height,
    Alignment? alignment,
    Widget? child,
    bool removePaddingWhenNoChild = false,
  }) : this(
          key: key,
          show: show,
          color: Colors.blue,
          padding: padding,
          width: width,
          height: height,
          alignment: alignment,
          child: child,
          removePaddingWhenNoChild: removePaddingWhenNoChild,
        );

  /// Adding `.y` to the box will make it yellow.
  /// Use this for debugging purposes only.
  /// This constructor is marked as deprecated so that you don't forget to remove it.
  @Deprecated("Use this for debugging purposes only.")
  const AnterosBox.y({
    Key? key,
    bool show = true,
    // ignore: avoid_unused_constructor_parameters
    Color? color,
    EdgeInsetsGeometry? padding,
    double? width,
    double? height,
    Alignment? alignment,
    Widget? child,
    bool removePaddingWhenNoChild = false,
  }) : this(
          key: key,
          show: show,
          color: Colors.yellow,
          padding: padding,
          width: width,
          height: height,
          alignment: alignment,
          child: child,
          removePaddingWhenNoChild: removePaddingWhenNoChild,
        );

  /// Use the `Box.rand` constructor to see when the widget rebuilds.
  /// It will change its color to a random one, whenever its build method is called.
  /// This constructor is marked as deprecated so that you don't forget to remove it.
  @Deprecated("Use this for debugging purposes only.")
  const AnterosBox.rand({
    Key? key,
    this.show = true,
    this.color,
    this.padding,
    this.width,
    this.height,
    this.alignment,
    this.child,
    this.removePaddingWhenNoChild = false,
  })  : _random = true,
        super(key: key);

  final Color? color;
  final bool show;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final Widget? child;
  final bool _random;
  final bool removePaddingWhenNoChild;

  @override
  Widget build(BuildContext context) {
    if (!show) return const SizedBox();
    Widget? current = child;

    if (alignment != null)
      current = Align(alignment: alignment!, child: current);

    if (padding != null && (child != null || !removePaddingWhenNoChild))
      current = Padding(padding: padding!, child: current);

    if (_random) {
      var rand = Random();
      int r = (color == null)
          ? (30 + rand.nextInt(196))
          : (color!.red + rand.nextInt(256)) ~/ 2;
      int g = (color == null)
          ? (30 + rand.nextInt(196))
          : (color!.green + rand.nextInt(256)) ~/ 2;
      int b = (color == null)
          ? (30 + rand.nextInt(196))
          : (color!.blue + rand.nextInt(256)) ~/ 2;
      current = DecoratedBox(
          decoration: BoxDecoration(color: Color.fromARGB(255, r, g, b)),
          child: current);
    } else if (color != null)
      current =
          DecoratedBox(decoration: BoxDecoration(color: color), child: current);

    if (width != null || height != null)
      current = ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: width, height: height),
        child: current,
      );

    return current ?? Container();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<Color>('color', color, defaultValue: null));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('padding', padding));
    properties.add(DoubleProperty('width', width, defaultValue: null));
    properties.add(DoubleProperty('height', height, defaultValue: null));
    properties.add(DiagnosticsProperty<AlignmentGeometry>(
        'alignment', alignment,
        showName: false, defaultValue: null));
  }

  /// Creates a copy of this Box but with the given fields replaced
  /// with the new values.
  AnterosBox copyWith({
    Key? key,
    bool? show,
    Color? color,
    EdgeInsetsGeometry? padding,
    double? width,
    double? height,
    AlignmentGeometry? alignment,
    bool? random,
    Widget? child,
  }) {
    return AnterosBox._(
      key: key ?? this.key,
      show: show ?? this.show,
      color: color ?? this.color,
      padding: padding ?? this.padding,
      width: width ?? this.width,
      height: height ?? this.height,
      alignment: alignment ?? this.alignment,
      random: random ?? _random,
      child: child ?? this.child,
    );
  }

  /// You can create boxes by adding a [AnterosBox] to one these types:
  /// [bool], [Color], [EdgeInsetsGeometry], [AlignmentGeometry], or [Widget].
  ///
  /// Examples:
  ///
  /// ```
  /// // To hide the box:
  /// AnterosBox(...) + false;
  ///
  /// // To show the box:
  /// AnterosBox(...) + true;
  ///
  /// // To change the box color:
  /// AnterosBox(...) + Colors.green;
  ///
  /// // To change the box padding:
  /// AnterosBox(...) + Pad(all: 10);
  ///
  /// // To substitute the box child:
  /// AnterosBox(...) + Text('abc');
  ///
  /// // To put a box inside of another:
  /// AnterosBox(...) + AnterosBox(...);
  /// ```
  ///
  /// Note: If you add null, that's not an error. It will simply return the same Box.
  /// However, if you add an invalid type it will throw an error in RUNTIME.
  ///
  AnterosBox operator +(Object? obj) {
    if (obj == null) return this;

    bool isBool = obj is bool;
    bool isColor = obj is Color;
    bool isEdgeInsetsGeometry = obj is EdgeInsetsGeometry;
    bool isAlignmentGeometry = obj is AlignmentGeometry;
    bool isWidget = obj is Widget;

    if (!isBool &&
        !isColor &&
        !isEdgeInsetsGeometry &&
        !isAlignmentGeometry &&
        !isWidget)
      throw ArgumentError("Can't add Box to ${obj.runtimeType}.");
    else
      return copyWith(
        show: isBool ? obj : null,
        color: isColor ? obj : null,
        padding: isEdgeInsetsGeometry ? obj : null,
        alignment: isAlignmentGeometry ? obj : null,
        child: isWidget ? obj : null,
      );
  }

  /// Return the width/height of the box, if set.
  /// Note this is not the real size of the box, since it ignores the child and the layout.
  Size get size => Size(width ?? 0.0, height ?? 0.0);

  /// Returns a box with its width or height increased by [width] or [height]
  /// (or decreased if the given [width] or [height] are negative, clamped to zero).
  AnterosBox add({
    double? width,
    double? height,
  }) =>
      copyWith(
        width:
            width == null ? this.width : max(0, ((this.height ?? 0.0) + width)),
        height: height == null
            ? this.height
            : max(0, ((this.height ?? 0.0) + height)),
      );

  /// Returns a box with its width or height decreased by [width] or [height]
  /// (clamped to zero).
  AnterosBox subtract({
    double? width,
    double? height,
  }) =>
      copyWith(
        width:
            width == null ? this.width : max(0, ((this.width ?? 0.0) - width)),
        height: height == null
            ? this.height
            : max(0, ((this.height ?? 0.0) - height)),
      );
}
