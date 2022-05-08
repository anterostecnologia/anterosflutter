import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class IconButtons extends StatefulWidget {
  @override
  _IconButtonsState createState() => _IconButtonsState();
}

class _IconButtonsState extends State<IconButtons> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: AnterosColors.DARK,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.back,
              color: AnterosColors.PRIMARY,
            ),
          ),
          title: const Text(
            'Icon Buttons',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: AnterosTypography(
                text: 'Solid Icons',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: AnterosColors.PRIMARY,
              ),
            ),
            AnterosCard(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Primary'),
                          icon: const Icon(
                            IconData(
                              0xe917,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Secondary'),
                          icon: const Icon(
                            IconData(
                              0xe91a,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.SECONDARY,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Success'),
                          icon: const Icon(
                            IconData(
                              0xe91c,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.SUCCESS,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Warning'),
                          icon: const Icon(
                            IconData(
                              0xe924,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.WARNING,
                        ),
                      ),
                      // const SizedBox(
                      //   width: 6,
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Danger'),
                          icon: const Icon(
                            IconData(
                              0xe908,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.DANGER,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Info'),
                          icon: const Icon(
                            IconData(
                              0xe911,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.INFO,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Light'),
                          icon: const Icon(
                            IconData(
                              0xe912,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          type: AnterosButtonType.solid,
                          color: AnterosColors.LIGHT,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text(
                            'Dark',
                            style: TextStyle(color: AnterosColors.WHITE),
                          ),
                          icon: const Icon(
                            IconData(
                              0xe909,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.DARK,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Link'),
                          icon: const Icon(
                            IconData(
                              0xe913,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.TRANSPARENT,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 10),
              child: AnterosTypography(
                text: 'Outline Icons',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: AnterosColors.PRIMARY,
              ),
            ),
            AnterosCard(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          type: AnterosButtonType.outline,
                          child: const Text('Primary'),
                          icon: const Icon(
                            IconData(
                              0xe917,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Secondary'),
                          icon: const Icon(
                            IconData(
                              0xe91a,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          color: AnterosColors.SECONDARY,
                          type: AnterosButtonType.outline,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Success'),
                          icon: const Icon(
                            IconData(
                              0xe91c,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          color: AnterosColors.SUCCESS,
                          type: AnterosButtonType.outline,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Warning'),
                          icon: const Icon(
                            IconData(
                              0xe924,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          color: AnterosColors.WARNING,
                          type: AnterosButtonType.outline,
                        ),
                      ),
                      // const SizedBox(
                      //   width: 6,
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Danger'),
                          icon: const Icon(
                            IconData(
                              0xe908,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          color: AnterosColors.DANGER,
                          type: AnterosButtonType.outline,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Info'),
                          icon: const Icon(
                            IconData(
                              0xe911,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          color: AnterosColors.INFO,
                          type: AnterosButtonType.outline,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Light'),
                          icon: const Icon(
                            IconData(
                              0xe912,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          type: AnterosButtonType.outline,
                          color: AnterosColors.LIGHT,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Dark'),
                          icon: const Icon(
                            IconData(
                              0xe909,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          color: AnterosColors.DARK,
                          type: AnterosButtonType.outline,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Link'),
                          icon: const Icon(
                            IconData(
                              0xe913,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          color: AnterosColors.TRANSPARENT,
                          type: AnterosButtonType.outline,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 10),
              child: AnterosTypography(
                text: 'Outline 2x Icons',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: AnterosColors.PRIMARY,
              ),
            ),
            AnterosCard(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          type: AnterosButtonType.outline2x,
                          child: const Text('Primary'),
                          icon: const Icon(
                            IconData(
                              0xe917,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Secondary'),
                          icon: const Icon(
                            IconData(
                              0xe91a,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          color: AnterosColors.SECONDARY,
                          type: AnterosButtonType.outline2x,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Success'),
                          icon: const Icon(
                            IconData(
                              0xe91c,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          color: AnterosColors.SUCCESS,
                          type: AnterosButtonType.outline2x,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Warning'),
                          icon: const Icon(
                            IconData(
                              0xe924,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          color: AnterosColors.WARNING,
                          type: AnterosButtonType.outline2x,
                        ),
                      ),
                      // const SizedBox(
                      //   width: 6,
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Danger'),
                          icon: const Icon(
                            IconData(
                              0xe908,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          color: AnterosColors.DANGER,
                          type: AnterosButtonType.outline2x,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Info'),
                          icon: const Icon(
                            IconData(
                              0xe911,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          color: AnterosColors.INFO,
                          type: AnterosButtonType.outline2x,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Light'),
                          icon: const Icon(
                            IconData(
                              0xe912,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          type: AnterosButtonType.outline2x,
                          color: AnterosColors.LIGHT,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Dark'),
                          icon: const Icon(
                            IconData(
                              0xe909,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          color: AnterosColors.DARK,
                          type: AnterosButtonType.outline2x,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Link'),
                          icon: const Icon(
                            IconData(
                              0xe913,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          color: AnterosColors.TRANSPARENT,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 10),
              child: AnterosTypography(
                text: 'Square Icons',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: AnterosColors.PRIMARY,
              ),
            ),
            AnterosCard(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          shape: AnterosButtonShape.square,
                          child: const Text('Primary'),
                          icon: const Icon(
                            IconData(
                              0xe917,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          shape: AnterosButtonShape.square,
                          child: const Text('Secondary'),
                          icon: const Icon(
                            IconData(
                              0xe91a,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.SECONDARY,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: AnterosButton(
                          shape: AnterosButtonShape.square,
                          onPressed: () {},
                          child: const Text('Success'),
                          icon: const Icon(
                            IconData(
                              0xe91c,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.SUCCESS,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          shape: AnterosButtonShape.square,
                          child: const Text('Warning'),
                          icon: const Icon(
                            IconData(
                              0xe924,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.WARNING,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          shape: AnterosButtonShape.square,
                          child: const Text('Danger'),
                          icon: const Icon(
                            IconData(
                              0xe908,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.DANGER,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          shape: AnterosButtonShape.square,
                          child: const Text('Info'),
                          icon: const Icon(
                            IconData(
                              0xe911,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.INFO,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          shape: AnterosButtonShape.square,
                          child: const Text('Light'),
                          icon: const Icon(
                            IconData(
                              0xe912,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          type: AnterosButtonType.solid,
                          color: AnterosColors.LIGHT,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          shape: AnterosButtonShape.square,
                          child: const Text(
                            'Dark',
                            style: TextStyle(color: AnterosColors.WHITE),
                          ),
                          icon: const Icon(
                            IconData(
                              0xe909,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.DARK,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          shape: AnterosButtonShape.square,
                          child: const Text('Link'),
                          icon: const Icon(
                            IconData(
                              0xe913,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.TRANSPARENT,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 10),
              child: AnterosTypography(
                text: 'Pills Icons',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: AnterosColors.PRIMARY,
              ),
            ),
            AnterosCard(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          shape: AnterosButtonShape.pills,
                          child: const Text('Primary'),
                          icon: const Icon(
                            IconData(
                              0xe917,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          shape: AnterosButtonShape.pills,
                          child: const Text('Secondary'),
                          icon: const Icon(
                            IconData(
                              0xe91a,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.SECONDARY,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: AnterosButton(
                          shape: AnterosButtonShape.pills,
                          onPressed: () {},
                          child: const Text('Success'),
                          icon: const Icon(
                            IconData(
                              0xe91c,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.SUCCESS,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          shape: AnterosButtonShape.pills,
                          child: const Text('Warning'),
                          icon: const Icon(
                            IconData(
                              0xe924,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.WARNING,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          shape: AnterosButtonShape.pills,
                          child: const Text('Danger'),
                          icon: const Icon(
                            IconData(
                              0xe908,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.DANGER,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          shape: AnterosButtonShape.pills,
                          child: const Text('Info'),
                          icon: const Icon(
                            IconData(
                              0xe911,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.INFO,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          shape: AnterosButtonShape.pills,
                          child: const Text('Light'),
                          icon: const Icon(
                            IconData(
                              0xe912,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          type: AnterosButtonType.solid,
                          color: AnterosColors.LIGHT,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          shape: AnterosButtonShape.pills,
                          child: const Text(
                            'Dark',
                            style: TextStyle(color: AnterosColors.WHITE),
                          ),
                          icon: const Icon(
                            IconData(
                              0xe909,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.DARK,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          shape: AnterosButtonShape.pills,
                          child: const Text('Link'),
                          icon: const Icon(
                            IconData(
                              0xe913,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.TRANSPARENT,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 10),
              child: AnterosTypography(
                text: 'Shadow Buttons',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: AnterosColors.PRIMARY,
              ),
            ),
            AnterosCard(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Primary'),
                          icon: const Icon(
                            IconData(
                              0xe917,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          buttonBoxShadow: true,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Secondary'),
                          icon: const Icon(
                            IconData(
                              0xe91a,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.SECONDARY,
                          buttonBoxShadow: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Success'),
                          icon: const Icon(
                            IconData(
                              0xe91c,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.SUCCESS,
                          buttonBoxShadow: true,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Warning'),
                          icon: const Icon(
                            IconData(
                              0xe924,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.WARNING,
                          buttonBoxShadow: true,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Danger'),
                          icon: const Icon(
                            IconData(
                              0xe908,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.DANGER,
                          buttonBoxShadow: true,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Info'),
                          icon: const Icon(
                            IconData(
                              0xe911,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.INFO,
                          buttonBoxShadow: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text(
                            'Light',
                          ),
                          icon: const Icon(
                            IconData(
                              0xe912,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          type: AnterosButtonType.solid,
                          color: AnterosColors.LIGHT,
                          buttonBoxShadow: true,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text(
                            'Dark',
                            style: TextStyle(color: AnterosColors.WHITE),
                          ),
                          icon: const Icon(
                            IconData(
                              0xe909,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.DARK,
                          buttonBoxShadow: true,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Link'),
                          icon: const Icon(
                            IconData(
                              0xe913,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: AnterosColors.WHITE,
                          ),
                          color: AnterosColors.TRANSPARENT,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 10),
              child: AnterosTypography(
                text: 'Button Sizes',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: AnterosColors.PRIMARY,
              ),
            ),
            AnterosCard(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AnterosButton(
                        onPressed: () {},
                        child: const Text('Large',
                            style: TextStyle(color: AnterosColors.WHITE)),
                        color: AnterosColors.PRIMARY,
                        size: AnterosSize.LARGE,
                        icon: const Icon(
                          IconData(
                            0xe91a,
                            fontFamily: 'GFIconFonts',
                          ),
                          color: AnterosColors.WHITE,
                        ),
                      ),
                      AnterosButton(
                        onPressed: () {},
                        child: const Text('Normal',
                            style: TextStyle(color: AnterosColors.WHITE)),
                        color: AnterosColors.PRIMARY,
                        size: AnterosSize.MEDIUM,
                        icon: const Icon(
                          IconData(
                            0xe91c,
                            fontFamily: 'GFIconFonts',
                          ),
                          color: AnterosColors.WHITE,
                        ),
                      ),
                      AnterosButton(
                        onPressed: () {},
                        child: const Text('Small',
                            style: TextStyle(color: AnterosColors.WHITE)),
                        color: AnterosColors.PRIMARY,
                        size: AnterosSize.SMALL,
                        icon: const Icon(
                          IconData(
                            0xe909,
                            fontFamily: 'GFIconFonts',
                          ),
                          color: AnterosColors.WHITE,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 10),
              child: AnterosTypography(
                text: 'Block Buttons',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: AnterosColors.PRIMARY,
              ),
            ),
            AnterosCard(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  AnterosButton(
                    onPressed: () {},
                    blockButton: true,
                    child: const Text('Large'),
                    size: AnterosSize.LARGE,
                    icon: const Icon(
                      IconData(
                        0xe91a,
                        fontFamily: 'GFIconFonts',
                      ),
                      color: AnterosColors.WHITE,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AnterosButton(
                    onPressed: () {},
                    blockButton: true,
                    child: const Text('Normal'),
                    size: AnterosSize.MEDIUM,
                    icon: const Icon(
                      IconData(
                        0xe91c,
                        fontFamily: 'GFIconFonts',
                      ),
                      color: AnterosColors.WHITE,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AnterosButton(
                    onPressed: () {},
                    blockButton: true,
                    child: const Text('Small'),
                    size: AnterosSize.SMALL,
                    icon: const Icon(
                      IconData(
                        0xe909,
                        fontFamily: 'GFIconFonts',
                      ),
                      color: AnterosColors.WHITE,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 20),
              child: AnterosTypography(
                text: 'Icons Only',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: AnterosColors.PRIMARY,
              ),
            ),
            AnterosCard(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AnterosIconButton(
                          icon: const Icon(
                            IconData(
                              0xe917,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          onPressed: () {}),
                      AnterosIconButton(
                          color: AnterosColors.SECONDARY,
                          icon: const Icon(
                            IconData(
                              0xe91a,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          onPressed: () {}),
                      AnterosIconButton(
                          color: AnterosColors.SUCCESS,
                          icon: const Icon(
                            IconData(
                              0xe91c,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          onPressed: () {}),
                      AnterosIconButton(
                          color: AnterosColors.WARNING,
                          icon: const Icon(
                            IconData(
                              0xe924,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          onPressed: () {}),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AnterosIconButton(
                          color: AnterosColors.DANGER,
                          icon: const Icon(
                            IconData(
                              0xe908,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          onPressed: () {}),
                      AnterosIconButton(
                          color: AnterosColors.INFO,
                          icon: const Icon(
                            IconData(
                              0xe911,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          onPressed: () {}),
                      AnterosIconButton(
                          color: AnterosColors.LIGHT,
                          icon: const Icon(
                            IconData(
                              0xe912,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          onPressed: () {}),
                      AnterosIconButton(
                          color: AnterosColors.DARK,
                          icon: const Icon(
                            IconData(
                              0xe909,
                              fontFamily: 'GFIconFonts',
                            ),
                            // color: getGFColor(GFColor.white),
                          ),
                          onPressed: () {}),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AnterosIconButton(
                          type: AnterosButtonType.outline,
                          icon: Icon(Icons.settings),
                          onPressed: () {}),
                      AnterosIconButton(
                          type: AnterosButtonType.outline,
                          color: AnterosColors.SECONDARY,
                          icon: Icon(Icons.send),
                          onPressed: () {}),
                      AnterosIconButton(
                          type: AnterosButtonType.outline,
                          color: AnterosColors.SUCCESS,
                          icon: Icon(Icons.file_download),
                          onPressed: () {}),
                      AnterosIconButton(
                          type: AnterosButtonType.outline,
                          color: AnterosColors.WARNING,
                          icon: Icon(Icons.warning),
                          onPressed: () {}),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AnterosIconButton(
                          type: AnterosButtonType.outline,
                          color: AnterosColors.DANGER,
                          icon: Icon(Icons.insert_drive_file),
                          onPressed: () {}),
                      AnterosIconButton(
                          type: AnterosButtonType.outline,
                          color: AnterosColors.INFO,
                          icon: Icon(Icons.delete),
                          onPressed: () {}),
                      AnterosIconButton(
                          type: AnterosButtonType.outline,
                          color: AnterosColors.LIGHT,
                          icon: Icon(Icons.info),
                          onPressed: () {}),
                      AnterosIconButton(
                          type: AnterosButtonType.outline,
                          color: AnterosColors.DARK,
                          icon: Icon(Icons.apps),
                          onPressed: () {}),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
