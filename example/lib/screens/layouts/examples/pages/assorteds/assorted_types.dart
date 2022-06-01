import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/box_page.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/capture_gestures.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/column.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/column_playground.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/column_removing_zero_height.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/delayed.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/fit_horizontally.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/fit_horizontally_baseline.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/global_keys.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/non_uniform_outline_input_border.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/non_uniform_rounded_rectangle_border.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/normalized_overflow_box.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/row.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/row_alignment.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/row_fill.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/row_playground.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/row_spacer.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/row_with_anteros_row_comparison.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/row_with_fit_horizontally.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/side_by_side.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/text_one_line.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/timer_builder.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/wrap.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/assorteds/pages/wrap_fit.dart';
import 'package:anteros_flutter_app/screens/layouts/examples/pages/grid/pages/semantic_ordering.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AssortyedLayoutsTypes extends StatefulWidget {
  @override
  _AssortyedLayoutsTypesState createState() => _AssortyedLayoutsTypesState();
}

class _AssortyedLayoutsTypesState extends State<AssortyedLayoutsTypes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AnterosColors.DARK,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            child: Icon(
              CupertinoIcons.back,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        title: const Text(
          'Assorted Layouts',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          makeButtons(context, 'Box layout', BoxPage()),
          makeButtons(context, 'Catpure Gestures', CaptureGesturesPage()),
          makeButtons(
              context, 'Column Playground layout', ColumnPlaygroundPage()),
          makeButtons(context, 'Column Remove Children', ColumnRemovingPage()),
          makeButtons(context, 'Column layout', ColumnPage()),
          makeButtons(context, 'Delayed', DelayedPage()),
          makeButtons(
              context, 'FitHorizontally Baseline', FitHorizontallyBasePage()),
          makeButtons(context, 'FitHorizontally', FitHorizontallyPage()),
          makeButtons(context, 'Global Keys', GlobalKeysPage()),
          makeButtons(context, 'NonUniformOutlineBorder',
              NonUniformOutlineBorderPage()),
          makeButtons(context, 'NonUniformRoundedRectangleBorder',
              NonUniformRoundedRectangleBorderPage()),
          makeButtons(
              context, 'NormalizedOverflowBox', NormalizedOverflowBoxPage()),
          makeButtons(context, 'Row Alignment', RowAlignmentPage()),
          makeButtons(context, 'Row Fill', RowFillPage()),
          makeButtons(context, 'Row Playground', RowPlaygroundPage()),
          makeButtons(context, 'Row Spacer', RowSpacerPage()),
          makeButtons(context, 'Row x Anteros Row', RowVsAnterosRowPage()),
          makeButtons(context, 'Row with FitHorizontally',
              RowWithFitHorizontallyPage()),
          makeButtons(context, 'Row', AnterosRowPage()),
          makeButtons(context, 'SideBySide', SideBySidePage()),
          makeButtons(context, 'Text one line ', TextOneLinePage()),
          makeButtons(context, 'Timer builder', TimerBuilderPage()),
          makeButtons(context, 'Wrap WrapFit', WrapFitPage()),
          makeButtons(context, 'Wrap WrapFit', WrapFitPage()),
          makeButtons(context, 'Wrap', WrapPage()),
        ],
      ),
    );
  }

  GestureDetector makeButtons(
      BuildContext context, String title, Widget pageButton) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => pageButton),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            color: AnterosColors.DARK,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.40), blurRadius: 5)
            ]),
        child: AnterosListTile(
          color: AnterosColors.DARK,
          title: Text(
            title,
            style: TextStyle(color: AnterosColors.WHITE),
          ),
          icon: Icon(
            CupertinoIcons.forward,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
