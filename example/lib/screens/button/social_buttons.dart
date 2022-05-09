import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anterosflutter/anterosflutter.dart';

class SocialButtons extends StatefulWidget {
  @override
  _SocialButtonsState createState() => _SocialButtonsState();
}

class _SocialButtonsState extends State<SocialButtons> {
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
              color: Theme.of(context).primaryColor,
            ),
          ),
          title: const Text(
            'Social Buttons',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15, top: 20),
              child: AnterosTypography(
                text: 'Social Buttons Full',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
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
                            buttonBoxShadow: true,
                            color: const Color(0xFF3B5998),
                            onPressed: () {},
                            child: const Text('Facebook'),
                            icon: const Icon(
                              IconData(0xe908, fontFamily: 'GFSocialFonts'),
                              color: Colors.white,
                              size: 15,
                            )),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Twitter'),
                          icon: const Icon(
                            IconData(0xe907, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                          ),
                          color: const Color(0xFF00ACEE),
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
                          child: const Text('Whatsap'),
                          icon: const Icon(
                            IconData(0xe906, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                            size: 20,
                          ),
                          color: const Color(0xFF25D366),
                          buttonBoxShadow: true,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Google +'),
                          icon: const Icon(
                            IconData(0xe905, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                            size: 20,
                          ),
                          color: const Color(0xFFDD4B39),
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
                          child: const Text('Dribble'),
                          icon: const Icon(
                            IconData(0xe904, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                          ),
                          color: const Color(0xFFEA4C89),
                          buttonBoxShadow: true,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('LinkedIn'),
                          icon: const Icon(
                            IconData(0xe903, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                          ),
                          color: const Color(0xFF0E76A8),
                          buttonBoxShadow: true,
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
                          child: const Text('Youtube'),
                          icon: const Icon(
                            IconData(0xe902, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                          ),
                          color: const Color(0xFFC4302B),
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
                            'Slack',
                            style: TextStyle(color: AnterosColors.WHITE),
                          ),
                          icon: const Icon(
                            IconData(0xe901, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                          ),
                          color: const Color(0XFF2EB67D),
                          buttonBoxShadow: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {},
                          child: const Text('Pinterest'),
                          icon: const Icon(
                            IconData(0xe900, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                            size: 20,
                          ),
                          color: const Color(0XFFC8232C),
                          buttonBoxShadow: true,
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
            Padding(
              padding: EdgeInsets.only(left: 15, top: 20),
              child: AnterosTypography(
                text: 'Social Buttons Icons',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
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
                          color: const Color(0xFF3B5998),
                          icon: const Icon(
                            IconData(0xe908, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {}),
                      AnterosIconButton(
                          color: const Color(0xFF00ACEE),
                          icon: const Icon(
                            IconData(0xe907, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {}),
                      AnterosIconButton(
                          color: const Color(0xFF25D366),
                          icon: const Icon(
                            IconData(0xe906, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {}),
                      AnterosIconButton(
                          color: const Color(0xFFDD4B39),
                          icon: const Icon(
                            IconData(0xe905, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {}),
                      AnterosIconButton(
                          color: const Color(0xFFEA4C89),
                          icon: const Icon(
                            IconData(0xe904, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                            size: 20,
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
                          color: const Color(0xFF0E76A8),
                          icon: const Icon(
                            IconData(0xe903, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {}),
                      AnterosIconButton(
                          color: const Color(0xFFC4302B),
                          icon: const Icon(
                            IconData(0xe902, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {}),
                      AnterosIconButton(
                          color: const Color(0XFF2EB67D),
                          icon: const Icon(
                            IconData(0xe901, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {}),
                      AnterosIconButton(
                          color: const Color(0XFFC8232C),
                          icon: const Icon(
                            IconData(0xe900, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {}),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 20),
              child: AnterosTypography(
                text: 'Floating Social Buttons',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
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
                          color: const Color(0xFF3B5998),
                          shape: AnterosIconButtonShape.circle,
                          icon: const Icon(
                            IconData(0xe908, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {}),
                      AnterosIconButton(
                          color: const Color(0xFF00ACEE),
                          shape: AnterosIconButtonShape.circle,
                          icon: const Icon(
                            IconData(0xe907, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {}),
                      AnterosIconButton(
                          color: const Color(0xFF25D366),
                          shape: AnterosIconButtonShape.circle,
                          icon: const Icon(
                            IconData(0xe906, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {}),
                      AnterosIconButton(
                          color: const Color(0xFFDD4B39),
                          shape: AnterosIconButtonShape.circle,
                          icon: const Icon(
                            IconData(0xe905, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {}),
                      AnterosIconButton(
                          color: const Color(0xFFEA4C89),
                          shape: AnterosIconButtonShape.circle,
                          icon: const Icon(
                            IconData(0xe904, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                            size: 20,
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
                          color: const Color(0xFF0E76A8),
                          shape: AnterosIconButtonShape.circle,
                          icon: const Icon(
                            IconData(0xe903, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {}),
                      AnterosIconButton(
                          color: const Color(0xFFC4302B),
                          shape: AnterosIconButtonShape.circle,
                          icon: const Icon(
                            IconData(0xe902, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {}),
                      AnterosIconButton(
                          color: const Color(0XFF2EB67D),
                          shape: AnterosIconButtonShape.circle,
                          icon: const Icon(
                            IconData(0xe901, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {}),
                      AnterosIconButton(
                          color: const Color(0XFFC8232C),
                          shape: AnterosIconButtonShape.circle,
                          icon: const Icon(
                            IconData(0xe900, fontFamily: 'GFSocialFonts'),
                            color: Colors.white,
                            size: 20,
                          ),
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
