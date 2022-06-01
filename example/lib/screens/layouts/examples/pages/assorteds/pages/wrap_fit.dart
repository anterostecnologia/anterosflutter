import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrapFitPage extends StatelessWidget {
  //
  static const divider =
      AnterosBox(color: Colors.black, width: double.infinity, height: 2.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AnterosColors.DARK,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.back,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: const Text(
          'Wrap WrapFit Example',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFEEEEEE),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: AnterosColumn(
            innerDistance: 25.0,
            children: [
              //
              divider,
              //
              _title('A bar of 400 pixels.'),
              _wrap(AnterosWrapFit.min, [box(400, 300)]),
              _wrap(AnterosWrapFit.divided, [box(400, 300)]),
              _wrap(AnterosWrapFit.proportional, [box(400, 300)]),
              _wrap(AnterosWrapFit.larger, [box(400, 300)]),
              //
              divider,
              //
              _title('A bar of 230 pixels.'),
              _wrap(AnterosWrapFit.min, [box(230, 230)]),
              _wrap(AnterosWrapFit.divided, [box(230, 300)]),
              _wrap(AnterosWrapFit.proportional, [box(230, 300)]),
              _wrap(AnterosWrapFit.larger, [box(230, 300)]),
              //
              divider,
              //
              _title('A bar of 140 pixels and another of 220.'),
              _wrap(AnterosWrapFit.min, [box(140, 140), box(220, 220)]),
              _wrap(AnterosWrapFit.divided, [box(140, 300), box(220, 300)]),
              _wrap(
                  AnterosWrapFit.proportional, [box(140, 300), box(220, 300)]),
              _wrap(AnterosWrapFit.larger, [box(140, 300), box(220, 300)]),
              //
              divider,
              //
              _title('Four bars: 200, 120, 60 and 80 pixels.'),
              _wrap(AnterosWrapFit.min,
                  [box(200, 200), box(120, 120), box(60, 60), box(80, 80)]),
              _wrap(AnterosWrapFit.divided,
                  [box(200, 300), box(120, 100), box(60, 100), box(80, 100)]),
              _wrap(AnterosWrapFit.proportional, [
                box(200, 300),
                box(120, (120 / (120 + 60 + 80) * 300).toInt()),
                box(60, (60 / (120 + 60 + 80) * 300).toInt()),
                box(80, (80 / (120 + 60 + 80) * 300).toInt())
              ]),
              _wrap(
                AnterosWrapFit.larger,
                [box(200, 300), box(120, 120), box(60, 90), box(80, 90)],
              ),
              //
              divider,
              //
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(String text) => Text(
        '$text\nAvailable width is 300:',
        textAlign: TextAlign.center,
      );

  Widget _wrap(AnterosWrapFit wrapFit, List<Widget> children) {
    return Column(
      children: [
        Text(wrapFit.toString()),
        const AnterosBox(height: 8.0),
        AnterosBox(
          color: Colors.purple,
          padding: const AnterosPad(all: 3.0),
          child: AnterosBox(
            width: 300,
            color: Colors.purple,
            child: AnterosWrap(
              wrapFit: wrapFit,
              spacing: 3.0,
              lineSpacing: 9.0,
              children: children,
            ),
          ),
        ),
      ],
    );
  }

  Widget box(double width, int newWidth) => AnterosBox(
        color: Colors.lightGreen,
        width: width,
        height: 30,
        child: Center(child: Text("${width.toInt()} ➜ $newWidth")),
      );
}
