import 'package:flutter/widgets.dart';

double _refWidth = 375;

double? _scalingFactor;
double? _width;

void initScaling(BuildContext context, {bool debug = false}) {
  var mq = MediaQuery.of(context);
  _width = mq.size.width < mq.size.height ? mq.size.width : mq.size.height;
  _scalingFactor = _width! / _refWidth;

  if (debug) {
    // ignore: avoid_print
    print("width => $_width");
  }
}

double scale(double dimension) {
  if (_width == null) {
    throw Exception(
        "Você deve chamar initScaling() antes de qualquer uso de scale()");
  }

  return dimension * _scalingFactor!;
}

//
// responsive grid layout
//

class AnterosGridBreakpoints {
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;

  AnterosGridBreakpoints({
    this.xs = 576,
    this.sm = 768,
    this.md = 992,
    this.lg = 1200,
    this.xl = double.infinity,
  });

  static AnterosGridBreakpoints value = AnterosGridBreakpoints();
}

enum _AnterosGridTier { xs, sm, md, lg, xl }

_AnterosGridTier _currentSize(BuildContext context) {
  final breakpoints = AnterosGridBreakpoints.value;
  final mediaQueryData = MediaQuery.of(context);
  final width = mediaQueryData.size.width;

//  print(
//      "INFO orientation: ${mediaQueryData.orientation} , width: ${mediaQueryData.size.width}, height: ${mediaQueryData.size.height}");

  if (width < breakpoints.xs) {
    return _AnterosGridTier.xs;
  } else if (width < breakpoints.sm) {
    return _AnterosGridTier.sm;
  } else if (width < breakpoints.md) {
    return _AnterosGridTier.md;
  } else if (width < breakpoints.lg) {
    return _AnterosGridTier.lg;
  } else {
    // width >= 1200
    return _AnterosGridTier.xl;
  }
}

class AnterosGridRow extends StatelessWidget {
  final List<AnterosGridCol> children;
  final CrossAxisAlignment crossAxisAlignment;
  final int rowSegments;

  const AnterosGridRow({
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.rowSegments = 12,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];

    int accumulatedWidth = 0;
    var cols = <Widget>[];

    for (var col in children) {
      var colWidth = col.currentConfig(context) ?? 1;
      //
      if (accumulatedWidth + colWidth > rowSegments) {
        if (accumulatedWidth < rowSegments) {
          cols.add(Spacer(
            flex: rowSegments - accumulatedWidth,
          ));
        }
        rows.add(Row(
          crossAxisAlignment: this.crossAxisAlignment,
          children: cols,
        ));
        // clear
        cols = <Widget>[];
        accumulatedWidth = 0;
      }
      //
      cols.add(col);
      accumulatedWidth += colWidth;
    }

    if (accumulatedWidth >= 0) {
      if (accumulatedWidth < rowSegments) {
        cols.add(Spacer(
          flex: rowSegments - accumulatedWidth,
        ));
      }
      rows.add(Row(
        crossAxisAlignment: crossAxisAlignment,
        children: cols,
      ));
    }

    return Column(
      children: rows,
    );
  }
}

class AnterosGridCol extends StatelessWidget {
  final _config = <int?>[]..length = 5;
  final Widget child;

  AnterosGridCol({
    int xs = 12,
    int? sm,
    int? md,
    int? lg,
    int? xl,
    required this.child,
    Key? key,
  }) : super(key: key) {
    _config[_AnterosGridTier.xs.index] = xs;
    _config[_AnterosGridTier.sm.index] =
        sm ?? _config[_AnterosGridTier.xs.index];
    _config[_AnterosGridTier.md.index] =
        md ?? _config[_AnterosGridTier.sm.index];
    _config[_AnterosGridTier.lg.index] =
        lg ?? _config[_AnterosGridTier.md.index];
    _config[_AnterosGridTier.xl.index] =
        xl ?? _config[_AnterosGridTier.lg.index];
  }

  int? currentConfig(BuildContext context) {
    return _config[_currentSize(context).index];
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: currentConfig(context) ?? 1,
      child: child,
    );
  }
}

//
// responsive grid list
//

class AnterosGridList extends StatelessWidget {
  final double desiredItemWidth, minSpacing;
  final List<Widget> children;
  final bool squareCells, scroll;
  final MainAxisAlignment rowMainAxisAlignment;
  final bool shrinkWrap;

  const AnterosGridList({
    required this.desiredItemWidth,
    this.minSpacing = 1,
    this.squareCells = false,
    this.scroll = true,
    required this.children,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
    this.shrinkWrap = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (children.isEmpty) return Container();

        double width = constraints.maxWidth;

        double N = (width - minSpacing) / (desiredItemWidth + minSpacing);

        int n;
        double spacing, itemWidth;

        if (N % 1 == 0) {
          n = N.floor();
          spacing = minSpacing;
          itemWidth = desiredItemWidth;
        } else {
          n = N.floor();

          double dw =
              width - (n * (desiredItemWidth + minSpacing) + minSpacing);

          itemWidth = desiredItemWidth +
              (dw / n) * (desiredItemWidth / (desiredItemWidth + minSpacing));

          spacing = (width - itemWidth * n) / (n + 1);
        }

        if (scroll) {
          return ListView.builder(
              shrinkWrap: shrinkWrap,
              itemCount: (children.length / n).ceil() * 2 - 1,
              itemBuilder: (context, index) {
                //if (index * n >= children.length) return null;
                //separator
                if (index % 2 == 1) {
                  return SizedBox(
                    height: minSpacing,
                  );
                }
                //item
                final rowChildren = <Widget>[];
                index = index ~/ 2;
                for (int i = index * n; i < (index + 1) * n; i++) {
                  if (i >= children.length) break;
                  rowChildren.add(children[i]);
                }
                return _AnterosGridListItem(
                  mainAxisAlignment: rowMainAxisAlignment,
                  itemWidth: itemWidth,
                  spacing: spacing,
                  squareCells: squareCells,
                  children: rowChildren,
                );
              });
        } else {
          final rows = <Widget>[];
          rows.add(SizedBox(
            height: minSpacing,
          ));
          //
          for (int j = 0; j < (children.length / n).ceil(); j++) {
            final rowChildren = <Widget>[];
            //
            for (int i = j * n; i < (j + 1) * n; i++) {
              if (i >= children.length) break;
              rowChildren.add(children[i]);
            }
            //
            rows.add(_AnterosGridListItem(
              mainAxisAlignment: rowMainAxisAlignment,
              itemWidth: itemWidth,
              spacing: spacing,
              squareCells: squareCells,
              children: rowChildren,
            ));

            rows.add(SizedBox(
              height: minSpacing,
            ));
          }

          return Column(
            children: rows,
          );
        }
      },
    );
  }
}

class _AnterosGridListItem extends StatelessWidget {
  final double spacing, itemWidth;
  final List<Widget> children;
  final bool squareCells;
  final MainAxisAlignment mainAxisAlignment;

  const _AnterosGridListItem({
    required this.itemWidth,
    required this.spacing,
    required this.squareCells,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: mainAxisAlignment,
      children: _buildChildren(),
    );
  }

  List<Widget> _buildChildren() {
    final list = <Widget>[];

    list.add(SizedBox(
      width: spacing,
    ));

    for (var child in children) {
      list.add(SizedBox(
        width: itemWidth,
        height: squareCells ? itemWidth : null,
        child: child,
      ));
      list.add(SizedBox(
        width: spacing,
      ));
    }

    return list;
  }
}
