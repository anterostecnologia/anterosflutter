import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anterosflutter/anterosflutter.dart';

class BadgesPage extends StatefulWidget {
  @override
  _BadgesPageState createState() => _BadgesPageState();
}

class _BadgesPageState extends State<BadgesPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.back,
              color: AnterosColors.PRIMARY,
            ),
          ),
          backgroundColor: AnterosColors.DARK,
          title: const Text(
            'Badges',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 20),
              child: AnterosTypography(
                text: 'With Buttons',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: AnterosColors.PRIMARY,
              ),
            ),
            AnterosCard(
              content: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: AnterosButtonBadge(
                          icon: const AnterosBadge(
                            size: AnterosSize.MEDIUM,
                            text: '6',
                            shape: AnterosBadgeShape.pills,
                          ),
                          onPressed: () {},
                          text: 'Primary',
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButtonBadge(
                          icon: const AnterosBadge(
                            text: '6',
                            shape: AnterosBadgeShape.pills,
                          ),
                          onPressed: () {},
                          text: 'Second',
                          color: AnterosColors.SECONDARY,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: AnterosButtonBadge(
                          icon: const AnterosBadge(
                            text: '6',
                            shape: AnterosBadgeShape.pills,
                          ),
                          onPressed: () {},
                          text: 'Success',
                          color: AnterosColors.SUCCESS,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButtonBadge(
                          icon: const AnterosBadge(
                            text: '6',
                            shape: AnterosBadgeShape.pills,
                          ),
                          onPressed: () {},
                          text: 'Warning',
                          color: AnterosColors.WARNING,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: AnterosButtonBadge(
                          icon: const AnterosBadge(
                            text: '6',
                            shape: AnterosBadgeShape.pills,
                          ),
                          onPressed: () {},
                          text: 'Danger',
                          color: AnterosColors.DANGER,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButtonBadge(
                          icon: const AnterosBadge(
                            text: '6',
                            shape: AnterosBadgeShape.pills,
                          ),
                          onPressed: () {},
                          text: 'Info',
                          color: AnterosColors.INFO,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: AnterosButtonBadge(
                          position: AnterosPosition.start,
                          icon: const AnterosBadge(
                            text: '6',
                            shape: AnterosBadgeShape.pills,
                          ),
                          onPressed: () {},
                          text: 'Light',
                          color: AnterosColors.LIGHT,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButtonBadge(
                          position: AnterosPosition.start,
                          icon: const AnterosBadge(
                            text: '6',
                            shape: AnterosBadgeShape.pills,
                          ),
                          onPressed: () {},
                          text: 'Dark',
                          textStyle:
                              const TextStyle(color: AnterosColors.WHITE),
                          color: AnterosColors.DARK,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButtonBadge(
                          position: AnterosPosition.start,
                          icon: const AnterosBadge(
                            text: '6',
                            shape: AnterosBadgeShape.pills,
                          ),
                          onPressed: () {},
                          text: 'Link',
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
              padding: EdgeInsets.only(left: 15, top: 20),
              child: AnterosTypography(
                text: 'Icon with Badges',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: AnterosColors.PRIMARY,
              ),
            ),
            AnterosCard(
              content: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AnterosIconBadge(
                          child: AnterosIconButton(
                            type: AnterosButtonType.transparent,
                            onPressed: () {},
                            icon: const Icon(
                              IconData(
                                0xe917,
                                fontFamily: 'GFIconFonts',
                              ),
                              color: AnterosColors.PRIMARY,
                            ),
                          ),
                          counterChild: const AnterosBadge(
                            text: '1',
                            shape: AnterosBadgeShape.circle,
                          )),
                      AnterosIconBadge(
                        child: AnterosIconButton(
                          type: AnterosButtonType.transparent,
                          onPressed: () {},
                          icon: const Icon(
                            IconData(
                              0xe91a,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.SECONDARY,
                          ),
                        ),
                        counterChild: const AnterosBadge(
                          text: '2',
                          shape: AnterosBadgeShape.pills,
                        ),
                      ),
                      AnterosIconBadge(
                          child: AnterosIconButton(
                            type: AnterosButtonType.transparent,
                            onPressed: () {},
                            icon: const Icon(
                              IconData(
                                0xe91c,
                                fontFamily: 'GFIconFonts',
                              ),
                              color: AnterosColors.SUCCESS,
                            ),
                          ),
                          counterChild: const AnterosBadge(
                            text: '3',
                            shape: AnterosBadgeShape.square,
                          )),
                      AnterosIconBadge(
                          child: AnterosIconButton(
                            type: AnterosButtonType.transparent,
                            onPressed: () {},
                            icon: const Icon(
                              IconData(
                                0xe924,
                                fontFamily: 'GFIconFonts',
                              ),
                              color: AnterosColors.WARNING,
                            ),
                          ),
                          counterChild: const AnterosBadge(
                            text: '4',
                            shape: AnterosBadgeShape.standard,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AnterosIconBadge(
                        child: AnterosIconButton(
                          type: AnterosButtonType.outline,
                          onPressed: () {},
                          icon: const Icon(
                            IconData(
                              0xe908,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.DANGER,
                          ),
                        ),
                        counterChild: const AnterosBadge(
                          text: '11',
                          shape: AnterosBadgeShape.circle,
                        ),
                        position: AnterosBadgePosition.topEnd(top: 0, end: 3),
                      ),
                      AnterosIconBadge(
                        child: AnterosIconButton(
                          color: AnterosColors.LIGHT,
                          shape: AnterosIconButtonShape.circle,
                          onPressed: () {},
                          icon: const Icon(
                            IconData(
                              0xe911,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.INFO,
                          ),
                        ),
                        counterChild: const AnterosBadge(
                          text: '12',
                          shape: AnterosBadgeShape.circle,
                        ),
                        position:
                            AnterosBadgePosition.bottomEnd(bottom: 0, end: 3),
                      ),
                      AnterosIconBadge(
                        child: AnterosIconButton(
                          color: AnterosColors.SUCCESS,
                          onPressed: () {},
                          icon: const Icon(
                            IconData(
                              0xe912,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.LIGHT,
                          ),
                        ),
                        counterChild: const AnterosBadge(
                          text: '13',
                          shape: AnterosBadgeShape.circle,
                        ),
                        position:
                            AnterosBadgePosition.topStart(top: 0, start: 3),
                      ),
                      AnterosIconBadge(
                        child: AnterosIconButton(
                          color: AnterosColors.FOCUS,
                          shape: AnterosIconButtonShape.square,
                          onPressed: () {},
                          icon: const Icon(
                            IconData(
                              0xe909,
                              fontFamily: 'GFIconFonts',
                            ),
                            color: AnterosColors.LIGHT,
                          ),
                        ),
                        counterChild: const AnterosBadge(
                          text: '14',
                          shape: AnterosBadgeShape.circle,
                        ),
                        position: AnterosBadgePosition.bottomStart(
                            bottom: 0, start: 3),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
