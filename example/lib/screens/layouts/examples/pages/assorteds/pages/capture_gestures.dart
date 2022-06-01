import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaptureGesturesPage extends StatelessWidget {
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
            'CaptureGestures Example',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            const AnterosBox(height: 30),
            _greenArea(),
            const AnterosBox(height: 30),
            _yellowArea(),
            const AnterosBox(height: 2000),
            //
          ],
        ),
      );

  Material _greenArea() {
    return Material(
      color: Colors.green[200],
      child: InkWell(
        highlightColor: Colors.green,
        splashColor: Colors.green,
        onTap: () {
          print('Green area tapped.');
        },
        child: AnterosCaptureGestures.only(
          child: Padding(
            padding: const AnterosPad(vertical: 30, horizontal: 50),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Button'),
                ),
                const AnterosBox(height: 20),
                Text('CaptureGestures.only()\n\n'
                    'This green area can be used to scroll.\n'
                    'The Button (child) feels taps.\n'
                    'The green area (parent) feels taps.'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Material _yellowArea() {
    return Material(
      color: Colors.yellow,
      child: InkWell(
        highlightColor: Colors.yellow[800],
        splashColor: Colors.yellow[800],
        onTap: () {
          print('Yellow area tapped.');
        },
        child: AnterosCaptureGestures.scroll(
          child: Padding(
            padding: const AnterosPad(vertical: 30, horizontal: 50),
            child: Column(
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Button'),
                  ),
                ),
                const AnterosBox(height: 20),
                Text('CaptureGestures.scroll()\n\n'
                    'This yellow area CANNOT be used to scroll.\n'
                    'The Button (child) feels taps.\n'
                    'The yellow area (parent) feels taps.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
