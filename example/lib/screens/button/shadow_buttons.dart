import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anterosflutter/anterosflutter.dart';

class ShadowButtons extends StatefulWidget {
  @override
  _ShadowButtonsState createState() => _ShadowButtonsState();
}

class _ShadowButtonsState extends State<ShadowButtons> {
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
            'Shadow Buttons',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 30),
                child: AnterosTypography(
                  text: 'Default',
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
                          shape: AnterosButtonShape.standard,
                          buttonBoxShadow: true,
                          text: 'Primary',
                          color: AnterosColors.PRIMARY,
                        ),
                        AnterosButton(
                          onPressed: () {},
                          text: 'Secondary',
                          color: AnterosColors.SECONDARY,
                          buttonBoxShadow: true,
                        ),
                        AnterosButton(
                          onPressed: () {},
                          text: 'Success',
                          buttonBoxShadow: true,
                          color: AnterosColors.SUCCESS,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AnterosButton(
                          onPressed: () {},
                          text: 'Warning',
                          buttonBoxShadow: true,
                          color: AnterosColors.WARNING,
                        ),
                        AnterosButton(
                          onPressed: () {},
                          text: 'Danger',
                          buttonBoxShadow: true,
                          color: AnterosColors.DANGER,
                        ),
                        AnterosButton(
                          onPressed: () {},
                          text: 'Info',
                          buttonBoxShadow: true,
                          color: AnterosColors.INFO,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AnterosButton(
                          onPressed: () {},
                          text: 'Light',
                          buttonBoxShadow: true,
                          color: AnterosColors.LIGHT,
                        ),
                        AnterosButton(
                          onPressed: () {},
                          text: 'Dark',
                          buttonBoxShadow: true,
                          color: AnterosColors.DARK,
                        ),
                        AnterosButton(
                          onPressed: () {},
                          child: const Text(
                            'Link',
                          ),
                          buttonBoxShadow: false,
                          color: AnterosColors.TRANSPARENT,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    )
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
                          child: const Text(
                            'Large',
                          ),
                          color: AnterosColors.PRIMARY,
                          size: AnterosSize.LARGE,
                          buttonBoxShadow: true,
                        ),
                        AnterosButton(
                          onPressed: () {},
                          child: const Text(
                            'Normal',
                          ),
                          color: AnterosColors.PRIMARY,
                          size: AnterosSize.MEDIUM,
                          buttonBoxShadow: true,
                        ),
                        AnterosButton(
                          onPressed: () {},
                          child: const Text(
                            'Small',
                          ),
                          color: AnterosColors.PRIMARY,
                          size: AnterosSize.SMALL,
                          buttonBoxShadow: true,
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
                      child: const Text('Large',
                          style: TextStyle(color: AnterosColors.WHITE)),
                      color: AnterosColors.PRIMARY,
                      size: AnterosSize.LARGE,
                      buttonBoxShadow: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AnterosButton(
                      onPressed: () {},
                      blockButton: true,
                      child: const Text('Normal',
                          style: TextStyle(color: AnterosColors.WHITE)),
                      color: AnterosColors.PRIMARY,
                      size: AnterosSize.MEDIUM,
                      buttonBoxShadow: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AnterosButton(
                      onPressed: () {},
                      blockButton: true,
                      child: const Text('Small',
                          style: TextStyle(color: AnterosColors.WHITE)),
                      color: AnterosColors.PRIMARY,
                      size: AnterosSize.SMALL,
                      buttonBoxShadow: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
