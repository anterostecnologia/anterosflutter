import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';

class GettingStartedExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnterosSnappingSheet(
        child: MyOwnPageContent(), // TODO: Add your content here
        grabbingHeight: 75,
        grabbing: MyOwnGrabbingWidget(), // TODO: Add your grabbing widget here,
        sheetAbove: AnterosSnappingSheetContent(
          draggable: true,
          child: MyOwnSheetContent(), // TODO: Add your sheet content here
        ),
      ),
    );
  }
}

class MyOwnPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

class MyOwnGrabbingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

class MyOwnSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
