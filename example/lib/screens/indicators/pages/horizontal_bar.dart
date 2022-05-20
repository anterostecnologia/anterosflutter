import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Examples of step_progress_indicators, direction [Axis.horizontal]
class HorizontalBar extends StatelessWidget {
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
          'Horizontal',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 24.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AnterosStepProgressIndicator(
                      totalSteps: 10,
                    ),
                    AnterosStepProgressIndicator(
                      totalSteps: 10,
                      currentStep: 6,
                      selectedColor: Colors.red,
                      unselectedColor: Colors.yellow,
                    ),
                    AnterosStepProgressIndicator(
                      totalSteps: 20,
                      currentStep: 6,
                      size: 10,
                      selectedColor: Colors.purple,
                      unselectedColor: Colors.transparent,
                    ),
                    AnterosStepProgressIndicator(
                      totalSteps: 15,
                      currentStep: 12,
                      size: 20,
                      selectedColor: Colors.amber,
                      unselectedColor: Colors.black,
                      roundedEdges: Radius.circular(10),
                      gradientColor: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.orange, Colors.white],
                      ),
                    ),
                    AnterosStepProgressIndicator(
                      totalSteps: 100,
                      currentStep: 32,
                      size: 8,
                      padding: 0,
                      selectedColor: Colors.yellow,
                      unselectedColor: Colors.cyan,
                      roundedEdges: Radius.circular(10),
                      selectedGradientColor: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.yellowAccent, Colors.deepOrange],
                      ),
                      unselectedGradientColor: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.black, Colors.blue],
                      ),
                    ),
                    AnterosStepProgressIndicator(
                      totalSteps: 12,
                      currentStep: 4,
                      padding: 6.0,
                      size: 12,
                      progressDirection: TextDirection.rtl,
                      selectedColor: Colors.green,
                      unselectedColor: Colors.black12,
                      selectedGradientColor: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.yellowAccent, Colors.deepOrange],
                      ),
                      unselectedGradientColor: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.black, Colors.blue],
                      ),
                    ),
                    AnterosStepProgressIndicator(
                      totalSteps: 5,
                      padding: 20.0,
                      size: 20,
                      customColor: (index) => index == 0
                          ? Colors.redAccent
                          : index == 4
                              ? Colors.blueAccent
                              : Colors.deepOrange,
                    ),
                    AnterosStepProgressIndicator(
                      totalSteps: 6,
                      currentStep: 4,
                      size: 36,
                      selectedColor: Colors.black,
                      unselectedColor: Colors.lightBlue,
                      customStep: (index, color, _) => color == Colors.black
                          ? Container(
                              color: color,
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            )
                          : Container(
                              color: color,
                              child: Icon(
                                Icons.remove,
                              ),
                            ),
                    ),
                    AnterosStepProgressIndicator(
                      totalSteps: 10,
                      currentStep: 7,
                      selectedColor: Colors.pink,
                      unselectedColor: Colors.amber,
                      customSize: (index, _) => (index + 1) * 10.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
