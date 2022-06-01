import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
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
          'Box example',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              example1(),
              example2(),
              example3(),
              example4(),
              example5(),
              example6(),
              example7(),
              example8(),
              example9(),
              example10(),
              example11(),
              example12(),
              example13(),
              example14(),
              example15(),
              example16(),
              example17(),
              example18(),
            ],
          ),
        ),
      ),
    );
  }

  Widget example1() => const AnterosBox(
        color: Colors.purple,
        child: Text("Test 1"),
      );

  // ignore: deprecated_member_use
  Widget example2() => const AnterosBox.r(
        child: Text("Test 2"),
      );

  // This is hidden because of show: false.
  // ignore: deprecated_member_use
  Widget example3() => const AnterosBox.g(
        show: false,
        padding: AnterosPad(top: 20),
        child: Text("Test 3"),
      );

  // ignore: deprecated_member_use
  Widget example4() => const AnterosBox.b(
        padding: AnterosPad(top: 10, bottom: 10),
        child: Text("Test 4"),
      );

  // This is hidden because child is null. Padding is applied.
  // ignore: deprecated_member_use
  Widget example5() => const AnterosBox.y(
        color: Colors.purple,
        padding: AnterosPad(top: 20),
      );

  // This is the same as top:10, bottom:10.
  // ignore: deprecated_member_use
  Widget example6() => const AnterosBox.r(
        padding: AnterosPad(vertical: 10),
        child: Text("Test 6"),
      );

  // This is the same as right:10, left:10.
  // ignore: deprecated_member_use
  Widget example7() => const AnterosBox.g(
        padding: AnterosPad(horizontal: 10),
        child: Text("Test 7"),
      );

  // ignore: deprecated_member_use
  Widget example8() => const AnterosBox.b(
        width: 200,
        height: 100,
        child: Text("Test 8"),
      );

  // ignore: deprecated_member_use
  Widget example9() => const AnterosBox.y(
        padding: AnterosPad(vertical: 20, horizontal: 40),
        width: 200,
        height: 100,
        child: Text("Test 9"),
      );

  // This will change color in each rebuild.
  // ignore: deprecated_member_use
  Widget example10() => const AnterosBox.rand(
        padding: AnterosPad(vertical: 20, horizontal: 40),
        child: Text("Test 10"),
      );

  AnterosBox redBox(String text) => AnterosBox(
        color: Colors.red,
        padding: const AnterosPad(vertical: 5, horizontal: 5),
        width: 280,
        height: 35,
        child: Text(text),
      );

  Widget example11() => Padding(
        padding: const AnterosPad(all: 2.0),
        child: redBox('box'),
      );

  Widget example12() => Padding(
        padding: const AnterosPad(all: 2.0),
        child: redBox('box + Colors.blue') + Colors.blue,
      );

  Widget example13() => Padding(
        padding: const AnterosPad(all: 2.0),
        child: redBox('box + Pad(left: 10)') + const AnterosPad(left: 10),
      );

  Widget example14() => Padding(
        padding: const AnterosPad(all: 2.0),
        child: redBox('box + Alignment.bottomRight') + Alignment.bottomRight,
      );

  Widget example15() => Padding(
        padding: const AnterosPad(all: 2.0),
        child: const AnterosBox.b(padding: AnterosPad(all: 8.0)) +
            redBox('Box.b(padding: Pad(all: 8.0)) + box'),
      );

  // Must remove padding when has no child. But has child, so don't remove padding.
  Widget example16() => const AnterosBox(
        color: Colors.red,
        padding: AnterosPad(all: 20.0),
        removePaddingWhenNoChild: true,
        child: Text('Has padding'),
      );

  // Not visible:
  // Must remove padding when has no child. Has child, so removes padding.
  Widget example17() => const AnterosBox(
        color: Colors.green,
        padding: AnterosPad(all: 20.0),
        removePaddingWhenNoChild: true,
      );

  // Must NOT remove padding when has no child. Has no child, but don't remove padding.
  Widget example18() => const AnterosBox(
        color: Colors.green,
        padding: AnterosPad(all: 20.0),
        removePaddingWhenNoChild: false,
      );
}
