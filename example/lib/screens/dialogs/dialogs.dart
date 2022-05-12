import 'package:anteros_flutter_app/screens/dialogs/dialog/alert_dialog.dart';
import 'package:anteros_flutter_app/screens/dialogs/dialog/bottom_sheet_dialog.dart';
import 'package:anteros_flutter_app/screens/dialogs/dialog/listview_dialog.dart';
import 'package:anteros_flutter_app/screens/dialogs/dialog/notice_dialog.dart';
import 'package:anteros_flutter_app/screens/dialogs/dialog/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';

class Dialogs extends StatefulWidget {
  @override
  _DialogsState createState() => _DialogsState();
}

class _DialogsState extends State<Dialogs> {
  @override
  Widget build(BuildContext context) => Scaffold(
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
            )),
        title: const Text(
          'Dialogs',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Text("1、Dialog"),
          Row(children: <Widget>[
            makeDialog(context, "Show dialog body", () {
              AlertDialogBody();
            }),
            makeDialog(context, "Show dialog head&body", () {
              AlertDialogHeadAndBody();
            }),
            makeDialog(context, "Show dialog divider", () {
              AlertDialogWithDivider();
            }),
            makeDialog(context, "Show dialog listTile", () {
              ListViewDialogListTile();
            }),
            makeDialog(context, "Show dialog listRadio", () {
              ListViewDialogListRadio();
            })
          ]),
          Row(children: <Widget>[
            makeDialog(context, "Show dialog bottom\nsheet", () {
              BottomSheetDialog();
            }),
            makeDialog(context, "Show dialog progress", () {
              ProgressDialogNoBody();
            }),
            makeDialog(context, "Show dialog progress\n&body", () {
              ProgressDialogBody();
            }),
            makeDialog(context, "Show dialog pop\nmenu", () {
              AlertDialogPopMenu();
            }),
            makeDialog(context, "Show dialog custom\nx&y", () {
              AlertDialogCustomXY();
            })
          ]),
          Row(children: <Widget>[
            makeDialog(context, "Show dialog notice", () {
              NoticeDialog();
            }),
            makeDialog(context, "Show dialog callback", () {
              NoticeDialogCallback();
            })
          ]),
          Text("2、Dialog property"),
          Row(children: <Widget>[
            makeDialog(context, "Show dialog duration", () {
              AlertDialogWithDuration();
            }),
            makeDialog(context, "Show dialog barrier\ncolor", () {
              AlertDialogWithBarrierColor(Colors.redAccent);
            }),
            makeDialog(context, "Show dialog transparent\ncolor", () {
              AlertDialogWithBarrierColor(Colors.transparent);
            }),
            makeDialog(context, "Show dialog background\ncolor", () {
              AlertDialogWithBackgroundColor();
            }),
            makeDialog(context, "Show dialog barrier\ndismiss", () {
              AlertDialogWithBarrierDismiss();
            })
          ]),
          Text("3、Dialog gravity"),
          Row(
            children: <Widget>[
              makeDialog(context, "bottom", () {
                AlertDialogWithGravity(
                  gravity: Gravity.bottom,
                );
              }),
              makeDialog(context, "top", () {
                AlertDialogWithGravity(
                  gravity: Gravity.top,
                );
              }),
              makeDialog(context, "left", () {
                AlertDialogWithGravity(
                  width: 250.0,
                  gravity: Gravity.left,
                );
              }),
              makeDialog(context, "right", () {
                AlertDialogWithGravity(
                  width: 250.0,
                  gravity: Gravity.right,
                );
              }),
              makeDialog(context, "center", () {
                AlertDialogWithGravity(
                  width: 250.0,
                  gravity: Gravity.center,
                );
              }),
            ],
          ),
          Row(
            children: <Widget>[
              makeDialog(context, "left\nbottom", () {
                AlertDialogWithGravity(
                  width: 250.0,
                  gravity: Gravity.leftBottom,
                );
              }),
              makeDialog(context, "left\ntop", () {
                AlertDialogWithGravity(
                  width: 250.0,
                  gravity: Gravity.leftTop,
                );
              }),
              makeDialog(context, "right\nbottom", () {
                AlertDialogWithGravity(
                  width: 250.0,
                  gravity: Gravity.rightBottom,
                );
              }),
              makeDialog(context, "right\ntop", () {
                AlertDialogWithGravity(
                  width: 250.0,
                  gravity: Gravity.rightTop,
                );
              }),
            ],
          ),
          Text("4. Dialog double button gravity"),
          Row(
            children: <Widget>[
              makeDialog(context, "left", () {
                AlertDialogWithGravity(
                  width: 250.0,
                  doubleButtonGravity: Gravity.left,
                );
              }),
              makeDialog(context, "right", () {
                AlertDialogWithGravity(
                  width: 250.0,
                  doubleButtonGravity: Gravity.right,
                );
              }),
              makeDialog(context, "center", () {
                AlertDialogWithGravity(
                  width: 250.0,
                  doubleButtonGravity: Gravity.center,
                );
              }),
              makeDialog(context, "space\nEvenly", () {
                AlertDialogWithGravity(
                  width: 250.0,
                  doubleButtonGravity: Gravity.spaceEvenly,
                );
              }),
            ],
          ),
          Text("5. Dialog animation"),
          Row(
            children: <Widget>[
              makeDialog(context, "scaleIn", () {
                AlertDialogWithScaleIn();
              }),
              makeDialog(context, "fadeIn", () {
                AlertDialogWithFadeIn();
              }),
              makeDialog(context, "rotateIn", () {
                AlertDialogWithRotateIn();
              }),
              makeDialog(context, "customIn", () {
                AlertDialogWithCustomIn();
              }),
            ],
          ),
        ],
      ));

  GestureDetector makeDialog(
      BuildContext context, String title, Function() function) {
    return GestureDetector(
        onTap: () => AlertDialogBody(),
        child: Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(7)),
              color: AnterosColors.DARK,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.40), blurRadius: 5)
              ]),
          child: AnterosListTile(
              color: AnterosColors.DARK,
              title: const Text(
                title,
                style: TextStyle(color: AnterosColors.WHITE),
              ),
              icon: Icon(
                CupertinoIcons.forward,
                color: Theme.of(context).primaryColor,
              )),
        ));
  }
}
