import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anterosflutter/anterosflutter.dart';

class Avatar extends StatefulWidget {
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  bool showToast = false;
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
            'Avatar',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: AnterosTypography(
                text: 'Basic Avatar',
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      AnterosAvatar(
                        backgroundImage:
                            AssetImage('lib/assets/images/avatar5.png'),
                      ),
                      AnterosAvatar(
                        backgroundImage:
                            AssetImage('lib/assets/images/img.png'),
                      ),
                      AnterosAvatar(
                        backgroundImage:
                            AssetImage('lib/assets/images/img1.png'),
                      ),
                      AnterosAvatar(
                        backgroundImage:
                            AssetImage('lib/assets/images/img2.png'),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      AnterosAvatar(
                        backgroundImage:
                            AssetImage('lib/assets/images/avatar6.png'),
                        shape: AnterosAvatarShape.standard,
                      ),
                      AnterosAvatar(
                        backgroundImage:
                            AssetImage('lib/assets/images/avatar11.png'),
                        shape: AnterosAvatarShape.standard,
                      ),
                      AnterosAvatar(
                        backgroundImage:
                            AssetImage('lib/assets/images/avatar9.png'),
                        shape: AnterosAvatarShape.standard,
                      ),
                      AnterosAvatar(
                        backgroundImage:
                            AssetImage('lib/assets/images/avatar12.png'),
                        shape: AnterosAvatarShape.standard,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      AnterosAvatar(
                        backgroundImage: AssetImage(
                          'lib/assets/images/avatar10.png',
                        ),
                        shape: AnterosAvatarShape.square,
                      ),
                      AnterosAvatar(
                        backgroundImage:
                            AssetImage('lib/assets/images/avatar12.png'),
                        shape: AnterosAvatarShape.square,
                      ),
                      AnterosAvatar(
                        backgroundImage:
                            AssetImage('lib/assets/images/avatar11.png'),
                        shape: AnterosAvatarShape.square,
                      ),
                      AnterosAvatar(
                        backgroundImage:
                            AssetImage('lib/assets/images/avatar6.png'),
                        shape: AnterosAvatarShape.square,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
