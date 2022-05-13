import 'package:anteros_flutter_app/assets/utils/dimensions.dart';
import 'package:anteros_flutter_app/screens/dialogs/dialog/alert_dialog.dart';
import 'package:anteros_flutter_app/screens/dialogs/dialog/bottom_sheet_dialog.dart';
import 'package:anteros_flutter_app/screens/dialogs/dialog/listview_dialog.dart';
import 'package:anteros_flutter_app/screens/dialogs/dialog/notice_dialog.dart';
import 'package:anteros_flutter_app/screens/dialogs/dialog/progress_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

var titleTextStyle = TextStyle(fontSize: 22, color: Colors.black);

class Dialogs extends StatelessWidget {
  Widget build(BuildContext context) {
    AnterosDialog.init(context);
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
            )),
        title: const Text(
          'Dialogs',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            showAlertDialog(context),
          ],
        ),
      ),
    );
  }
}

showAwesomeDialog(BuildContext context) {
  return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[Text("1、demo"), Row()]));
}

showAlertDialog(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text("Basic dialogs",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: Dimensions.fontSizeExtraLarge)),
        AnterosTypography(
          text: 'Types',
          type: AnterosTypographyType.typo5,
          dividerWidth: 25,
          dividerColor: Theme.of(context).primaryColor,
        ),
        Row(
          children: makeDialogTypesOne,
        ),
        Row(
          children: makeDialogTypesTwo,
        ),
        Row(
          children: makeDialogTypesThree,
        ),
        AnterosTypography(
          text: 'Dialog properties',
          type: AnterosTypographyType.typo5,
          dividerWidth: 25,
          dividerColor: Theme.of(context).primaryColor,
        ),
        Row(
          children: makeDialogPropertiesOne,
        ),
        Row(
          children: makeDialogPropertiesTwo,
        ),
        AnterosTypography(
          text: 'Dialog gravity',
          type: AnterosTypographyType.typo5,
          dividerWidth: 25,
          dividerColor: Theme.of(context).primaryColor,
        ),
        Row(
          children: makeDialogGravityOne,
        ),
        Row(
          children: makeDialogGravityTwo,
        ),
        Row(
          children: makeDialogGravityThree,
        ),
        AnterosTypography(
          text: 'Double button gravity',
          type: AnterosTypographyType.typo5,
          dividerWidth: 25,
          dividerColor: Theme.of(context).primaryColor,
        ),
        Row(
          children: makeDialogDoubleGravityOne,
        ),
        AnterosTypography(
          text: 'Dialog animation',
          type: AnterosTypographyType.typo5,
          dividerWidth: 25,
          dividerColor: Theme.of(context).primaryColor,
        ),
        Row(
          children: makeDialogAnimation,
        ),
      ],
    ),
  );
}

List<Widget> get makeDialogAnimation {
  return <Widget>[
    makeTextButton("scaleIn", AnterosColors.SECONDARY, () {
      AlertDialogWithScaleIn();
    }),
    Gap(4),
    makeTextButton("fadeIn", AnterosColors.SECONDARY, () {
      AlertDialogWithFadeIn();
    }),
    Gap(4),
    makeTextButton("rotateIn", AnterosColors.SECONDARY, () {
      AlertDialogWithRotateIn();
    }),
    Gap(4),
    makeTextButton("customIn", AnterosColors.SECONDARY, () {
      AlertDialogWithCustomIn();
    }),
  ];
}

List<Widget> get makeDialogDoubleGravityOne {
  return <Widget>[
    makeTextButton("left", AnterosColors.DANGER, () {
      AlertDialogWithGravity(
        width: 250.0,
        gravity: AnterosDialogGravity.center,
        doubleButtonGravity: AnterosDialogGravity.left,
      );
    }),
    Gap(4),
    makeTextButton("right", AnterosColors.DANGER, () {
      AlertDialogWithGravity(
        width: 250.0,
        gravity: AnterosDialogGravity.center,
        doubleButtonGravity: AnterosDialogGravity.right,
      );
    }),
    Gap(4),
    makeTextButton("center", AnterosColors.DANGER, () {
      AlertDialogWithGravity(
        width: 250.0,
        gravity: AnterosDialogGravity.bottom,
        doubleButtonGravity: AnterosDialogGravity.center,
      );
    }),
    Gap(4),
    makeTextButton("space\nEvenly", AnterosColors.DANGER, () {
      AlertDialogWithGravity(
        width: 250.0,
        gravity: AnterosDialogGravity.center,
        doubleButtonGravity: AnterosDialogGravity.spaceEvenly,
      );
    }),
  ];
}

List<Widget> get makeDialogGravityThree {
  return <Widget>[
    makeTextButton("right\ntop", AnterosColors.WARNING, () {
      AlertDialogWithGravity(
        width: 250.0,
        gravity: AnterosDialogGravity.rightTop,
      );
    }),
  ];
}

List<Widget> get makeDialogGravityTwo {
  return <Widget>[
    makeTextButton("center", AnterosColors.WARNING, () {
      AlertDialogWithGravity(
        width: 250.0,
        gravity: AnterosDialogGravity.center,
      );
    }),
    Gap(4),
    makeTextButton("left\nbottom", AnterosColors.WARNING, () {
      AlertDialogWithGravity(
        width: 250.0,
        gravity: AnterosDialogGravity.leftBottom,
      );
    }),
    Gap(4),
    makeTextButton("left\ntop", AnterosColors.WARNING, () {
      AlertDialogWithGravity(
        width: 250.0,
        gravity: AnterosDialogGravity.leftTop,
      );
    }),
    Gap(4),
    makeTextButton("right\nbottom", AnterosColors.WARNING, () {
      AlertDialogWithGravity(
        width: 250.0,
        gravity: AnterosDialogGravity.rightBottom,
      );
    }),
  ];
}

List<Widget> get makeDialogGravityOne {
  return <Widget>[
    makeTextButton("bottom", AnterosColors.WARNING, () {
      AlertDialogWithGravity(
        gravity: AnterosDialogGravity.bottom,
      );
    }),
    Gap(4),
    makeTextButton("top", AnterosColors.WARNING, () {
      AlertDialogWithGravity(
        gravity: AnterosDialogGravity.top,
      );
    }),
    Gap(4),
    makeTextButton("left", AnterosColors.WARNING, () {
      AlertDialogWithGravity(
        width: 250.0,
        gravity: AnterosDialogGravity.left,
      );
    }),
    Gap(4),
    makeTextButton("right", AnterosColors.WARNING, () {
      AlertDialogWithGravity(
        width: 250.0,
        gravity: AnterosDialogGravity.right,
      );
    }),
  ];
}

List<Widget> get makeDialogPropertiesTwo {
  return <Widget>[
    makeTextButton("barrier\ndismiss", AnterosColors.SUCCESS, () {
      AlertDialogWithBarrierDismiss();
    }),
  ];
}

List<Widget> get makeDialogPropertiesOne {
  return <Widget>[
    makeTextButton("duration", AnterosColors.SUCCESS, () {
      AlertDialogWithDuration();
    }),
    Gap(4),
    makeTextButton("barrier\ncolor", AnterosColors.SUCCESS, () {
      AlertDialogWithBarrierColor(Colors.redAccent);
    }),
    Gap(4),
    makeTextButton("transparent\ncolor", AnterosColors.SUCCESS, () {
      AlertDialogWithBarrierColor(Colors.transparent);
    }),
    Gap(4),
    makeTextButton("background\ncolor", AnterosColors.SUCCESS, () {
      AlertDialogWithBackgroundColor();
    }),
  ];
}

List<Widget> get makeDialogTypesThree {
  return <Widget>[
    makeTextButton("pop\nmenu", AnterosColors.PRIMARY, () {
      AlertDialogPopMenu();
    }),
    Gap(4),
    makeTextButton("custom\nx&y", AnterosColors.PRIMARY, () {
      AlertDialogCustomXY();
    }),
    Gap(4),
    makeTextButton("notice", AnterosColors.PRIMARY, () {
      NoticeDialog();
    }),
    Gap(4),
    makeTextButton("callback", AnterosColors.PRIMARY, () {
      NoticeDialogCallback();
    }),
  ];
}

List<Widget> get makeDialogTypesTwo {
  return <Widget>[
    makeTextButton("listRadio", AnterosColors.PRIMARY, () {
      ListViewDialogListRadio();
    }),
    Gap(4),
    makeTextButton("bottom\nsheet", AnterosColors.PRIMARY, () {
      BottomSheetDialog();
    }),
    Gap(4),
    makeTextButton("progress", AnterosColors.PRIMARY, () {
      ProgressDialogNoBody();
    }),
    Gap(4),
    makeTextButton("progress\n&body", AnterosColors.PRIMARY, () {
      ProgressDialogBody();
    }),
  ];
}

List<Widget> get makeDialogTypesOne {
  return <Widget>[
    makeTextButton("body", AnterosColors.PRIMARY, () {
      AlertDialogBody();
    }),
    Gap(4),
    makeTextButton("head&body", AnterosColors.PRIMARY, () {
      AlertDialogHeadAndBody();
    }),
    Gap(4),
    makeTextButton("divider", AnterosColors.PRIMARY, () {
      AlertDialogWithDivider();
    }),
    Gap(4),
    makeTextButton("listTile", AnterosColors.PRIMARY, () {
      ListViewDialogListTile();
    }),
  ];
}

SizedBox Gap(double _width) {
  return SizedBox(
    width: _width,
  );
}

Widget makeTextButton(title, color, Function() function) {
  return AnterosButton(
    size: AnterosSize.LARGE,
    color: color,
    onPressed: () {
      function();
    },
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 13.0),
    ),
  );
}
