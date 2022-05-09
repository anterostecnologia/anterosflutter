import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  bool selected = false;
  AnimationController? controller;
  Animation<double>? animation;
  bool _first = true;
  double _fontSize = 30;
  Color _color = AnterosColors.SUCCESS;
  Animation<Offset>? offsetAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation =
        new CurvedAnimation(parent: controller!, curve: Curves.bounceInOut);
    controller!.repeat();

    offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.5, 0),
    ).animate(CurvedAnimation(
      parent: controller!,
      curve: Curves.linear,
    ));
  }

  @override
  void dispose() {
    if (controller != null) controller!.dispose();
    super.dispose();
  }

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
          'Animation',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30, bottom: 20),
              child: AnterosTypography(
                text: 'Rotation',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                controller!.repeat();
              },
              child: AnterosAnimation(
                turnsAnimation: animation,
                controller: controller,
                type: AnterosAnimationType.rotateTransition,
                alignment: Alignment.center,
                child: Image.asset(
                  'lib/assets/icons/Rotation.png',
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            SizedBox(height: 5),
            Center(child: Text('Tap Me')),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30, bottom: 20),
              child: AnterosTypography(
                text: 'Scaling',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                controller!.repeat();
              },
              child: AnterosAnimation(
                scaleAnimation: animation,
                controller: controller,
                type: AnterosAnimationType.scaleTransition,
                child: Image.asset(
                  'lib/assets/icons/scaling.png',
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            SizedBox(height: 5),
            Center(child: Text('Tap Me')),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30, bottom: 20),
              child: AnterosTypography(
                text: 'Allignment',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            AnterosAnimation(
              duration: Duration(seconds: 2),
              alignment: Alignment.centerLeft,
              type: AnterosAnimationType.align,
              child: Image.asset(
                'lib/assets/icons/allign.png',
                width: 80,
                height: 80,
              ),
            ),
            SizedBox(height: 5),
            Center(child: Text('Tap Me')),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30, bottom: 20),
              child: AnterosTypography(
                text: 'Slide Transition',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: AnterosAnimation(
                controller: controller,
                slidePosition: offsetAnimation,
                type: AnterosAnimationType.slideTransition,
                child: Image.asset(
                  'lib/assets/icons/slide.png',
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            SizedBox(height: 5),
            // Center(child: Text('Tap Me')),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30, bottom: 20),
              child: AnterosTypography(
                text: 'Size',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            AnterosAnimation(
              onTap: () {
                if (mounted) {
                  setState(() {
                    selected = !selected;
                  });
                }
              },
              width: selected ? 100 : 50,
              height: selected ? 100 : 50,
              type: AnterosAnimationType.size,
              controller: controller,
              child: Image.asset(
                'lib/assets/icons/size.png',
              ),
            ),
            SizedBox(height: 5),
            Center(child: Text('Tap Me')),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30, bottom: 20),
              child: AnterosTypography(
                text: 'TextStyle',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            AnterosAnimation(
              onTap: () {
                setState(() {
                  _fontSize = _first ? 60 : 30;
                  _color = _first ? Colors.blue : Colors.red;
                  _first = !_first;
                });
              },
              color: _color,
              fontSize: _fontSize,
              type: AnterosAnimationType.textStyle,
              child: Center(child: Text('Get Widget')),
            ),
            SizedBox(height: 5),
            Center(child: Text('Tap Me')),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30, bottom: 20),
              child: AnterosTypography(
                text: 'Container',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            AnterosAnimation(
              width: 50,
              changedWidth: 100,
              height: 50,
              changedHeight: 100,
              activeColor: Colors.transparent,
              color: Colors.transparent,
              fontSize: _fontSize,
              type: AnterosAnimationType.container,
              child: Image.asset(
                'lib/assets/icons/slide.png',
                width: 80,
                height: 80,
              ),
            ),
            SizedBox(height: 5),
            Center(child: Text('Tap Me')),
            SizedBox(height: 20),
          ],
        ),
      ));
}
