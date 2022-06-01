import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DelayedPage extends StatelessWidget {
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
          'Delayed Example',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      key: UniqueKey(), // Forces restart on hot reload.
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i <= 100; i++)
              _delayed(i == 0 ? null : Duration(milliseconds: i * 500)),
          ],
        ),
      ),
    );
  }

  Widget _delayed(Duration? delay) {
    return AnterosDelayed(
      delay: delay,
      builder: (_, bool initialized) => AnimatedOpacity(
        opacity: initialized ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: _myWidget(delay?.inMilliseconds),
      ),
    );
  }

  Widget _myWidget(int? delay) {
    // ignore: deprecated_member_use
    return AnterosBox.rand(
      height: 50.0,
      child: Center(child: Text(delay.toString())),
    );
  }
}
