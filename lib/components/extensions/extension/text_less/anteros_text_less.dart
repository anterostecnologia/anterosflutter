library textless;

import 'dart:ui';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';

class AnterosThemedText extends StatelessWidget {
  const AnterosThemedText({
    Key? key,
    required this.data,
    this.style,
    this.extra,
  }) : super(key: key);

  final String data;
  final TextStyle Function(TextTheme)? style;
  final Map<String, dynamic>? extra;

  @override
  Widget build(BuildContext context) {
    return Text(data,
        style: style!(Theme.of(context).textTheme),
        overflow: extra?["overflow"],
        maxLines: extra?["maxLine"],
        softWrap: extra?["softWrap"],
        textAlign: extra?["textAlign"],
        textScaleFactor: extra?["textScaleFactor"]);
  }

  AnterosThemedText textless<T>(T v) =>
      (v is Map) ? styled(extra: v) : styled(style: v as TextStyle);

  AnterosThemedText styled({TextStyle? style, Map? extra}) => AnterosThemedText(
        data: data,
        style: (tt) => this.style!(tt).merge(style),
        extra: {...?this.extra, ...?extra},
      );

  AnterosThemedText get lineThrough =>
      textless(TextStyle(decoration: TextDecoration.lineThrough));

  AnterosThemedText get underline =>
      textless(TextStyle(decoration: TextDecoration.underline));
  AnterosThemedText get overline =>
      textless(TextStyle(decoration: TextDecoration.overline));

  AnterosThemedText color(Color v) => textless(TextStyle(color: v));
  AnterosThemedText backgroundColor(Color v) =>
      textless(TextStyle(backgroundColor: v));
  AnterosThemedText size(double v) => textless(TextStyle(fontSize: v));
  AnterosThemedText height(double v) => textless(TextStyle(height: v));

  AnterosThemedText get italic =>
      textless(TextStyle(fontStyle: FontStyle.italic));
  AnterosThemedText get thin =>
      textless(TextStyle(fontWeight: FontWeight.w100));
  AnterosThemedText get extraLight =>
      textless(TextStyle(fontWeight: FontWeight.w200));
  AnterosThemedText get light =>
      textless(TextStyle(fontWeight: FontWeight.w300));
  AnterosThemedText get regular =>
      textless(TextStyle(fontWeight: FontWeight.normal));
  AnterosThemedText get medium =>
      textless(TextStyle(fontWeight: FontWeight.w500));
  AnterosThemedText get semiBold =>
      textless(TextStyle(fontWeight: FontWeight.w600));
  AnterosThemedText get bold =>
      textless(TextStyle(fontWeight: FontWeight.w700));
  AnterosThemedText get extraBold =>
      textless(TextStyle(fontWeight: FontWeight.w800));
  AnterosThemedText get black =>
      textless(TextStyle(fontWeight: FontWeight.w900));

  AnterosThemedText get solidLine =>
      textless(TextStyle(decorationStyle: TextDecorationStyle.solid));
  AnterosThemedText get dottedLine =>
      textless(TextStyle(decorationStyle: TextDecorationStyle.dotted));
  AnterosThemedText get doubledLine =>
      textless(TextStyle(decorationStyle: TextDecorationStyle.double));
  AnterosThemedText get wavyLine =>
      textless(TextStyle(decorationStyle: TextDecorationStyle.wavy));
  AnterosThemedText get dashedLine =>
      textless(TextStyle(decorationStyle: TextDecorationStyle.dashed));

  AnterosThemedText lineColor(Color v) =>
      textless(TextStyle(decorationColor: v));
  AnterosThemedText lineThickness(double v) =>
      textless(TextStyle(decorationThickness: v));

  AnterosThemedText get alphabeticBaseline =>
      textless(TextStyle(textBaseline: TextBaseline.alphabetic));
  AnterosThemedText get ideographicBaseline =>
      textless(TextStyle(textBaseline: TextBaseline.ideographic));

  AnterosThemedText fontFamily(String v) => textless(TextStyle(fontFamily: v));
  AnterosThemedText letterSpacing(double v) =>
      textless(TextStyle(letterSpacing: v));
  AnterosThemedText wordSpacing(double v) =>
      textless(TextStyle(wordSpacing: v));
  AnterosThemedText locale(Locale v) => textless(TextStyle(locale: v));
  AnterosThemedText foreground(Paint v) => textless(TextStyle(foreground: v));
  AnterosThemedText shadows(List<Shadow> v) => textless(TextStyle(shadows: v));
  AnterosThemedText fontFeatures(List<FontFeature> v) =>
      textless(TextStyle(fontFeatures: v));

  AnterosThemedText softWrap(bool v) => textless({"softWrap": v});

  AnterosThemedText get overflowVisible =>
      textless({"overflow": TextOverflow.visible});
  AnterosThemedText get overflowClip =>
      textless({"overflow": TextOverflow.clip});
  AnterosThemedText get overflowEllipsis =>
      textless({"overflow": TextOverflow.ellipsis});
  AnterosThemedText get overflowFade =>
      textless({"overflow": TextOverflow.fade});

  AnterosThemedText maxLine(int v) => textless({"maxLine": v});
  AnterosThemedText scaleFactor(double v) => textless({"textScaleFactor": v});
  AnterosThemedText get alignLeft => textless({"textAlign": TextAlign.left});
  AnterosThemedText get alignRight => textless({"textAlign": TextAlign.right});
  AnterosThemedText get alignCenter =>
      textless({"textAlign": TextAlign.center});
  AnterosThemedText get alignJustify =>
      textless({"textAlign": TextAlign.justify});
  AnterosThemedText get alignStart => textless({"textAlign": TextAlign.start});
  AnterosThemedText get alignEnd => textless({"textAlign": TextAlign.end});
}

extension ThemedTextStyle on AnterosThemedText {}

extension AnterosTextLess on String {
  AnterosThemedText style(TextStyle style) =>
      AnterosThemedText(data: this, style: (t) => style);
  AnterosThemedText get text =>
      AnterosThemedText(data: this, style: (t) => TextStyle());
  AnterosThemedText get h1 =>
      AnterosThemedText(data: this, style: (t) => t.headline1!);
  AnterosThemedText get h2 =>
      AnterosThemedText(data: this, style: (t) => t.headline2!);
  AnterosThemedText get h3 =>
      AnterosThemedText(data: this, style: (t) => t.headline3!);
  AnterosThemedText get h4 =>
      AnterosThemedText(data: this, style: (t) => t.headline4!);
  AnterosThemedText get h5 =>
      AnterosThemedText(data: this, style: (t) => t.headline5!);
  AnterosThemedText get h6 =>
      AnterosThemedText(data: this, style: (t) => t.headline6!);
  AnterosThemedText get s1 =>
      AnterosThemedText(data: this, style: (t) => t.subtitle1!);
  AnterosThemedText get s2 =>
      AnterosThemedText(data: this, style: (t) => t.subtitle2!);
  AnterosThemedText get b1 =>
      AnterosThemedText(data: this, style: (t) => t.bodyText1!);
  AnterosThemedText get b2 =>
      AnterosThemedText(data: this, style: (t) => t.bodyText2!);
  AnterosThemedText get btn =>
      AnterosThemedText(data: this, style: (t) => t.button!);
  AnterosThemedText get cap =>
      AnterosThemedText(data: this, style: (t) => t.caption!);
  AnterosThemedText get ol =>
      AnterosThemedText(data: this, style: (t) => t.overline!);
  AnterosThemedText get t1 => AnterosThemedText(
      data: this,
      style: (t) =>
          TextStyle(fontSize: AnterosTypographyType.typo1.getValue()));
  AnterosThemedText get t2 => AnterosThemedText(
      data: this,
      style: (t) =>
          TextStyle(fontSize: AnterosTypographyType.typo2.getValue()));
  AnterosThemedText get t3 => AnterosThemedText(
      data: this,
      style: (t) =>
          TextStyle(fontSize: AnterosTypographyType.typo3.getValue()));
  AnterosThemedText get t4 => AnterosThemedText(
      data: this,
      style: (t) =>
          TextStyle(fontSize: AnterosTypographyType.typo4.getValue()));
  AnterosThemedText get t5 => AnterosThemedText(
      data: this,
      style: (t) =>
          TextStyle(fontSize: AnterosTypographyType.typo5.getValue()));
  AnterosThemedText get t6 => AnterosThemedText(
      data: this,
      style: (t) =>
          TextStyle(fontSize: AnterosTypographyType.typo6.getValue()));
}
