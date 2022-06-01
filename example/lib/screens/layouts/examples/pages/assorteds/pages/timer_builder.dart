import 'dart:math';

import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerBuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          'TimeBuilder Example',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: AnterosColumn(
          separator: const Divider(thickness: 2.0),
          innerDistance: 40.0,
          outerDistance: 20.0,
          children: [
            //
            Center(
              child: AnterosColumn(
                innerDistance: 15.0,
                children: [
                  const Text("Countdown of 15 seconds, until 0:"),
                  widget1(),
                ],
              ),
            ),
            // //
            Center(
              child: AnterosColumn(
                innerDistance: 15.0,
                children: [
                  const Text(
                      "Runs once per second, for 15 seconds then stops:"),
                  widget2(),
                ],
              ),
            ),
            //
            Center(
              child: AnterosColumn(
                innerDistance: 15.0,
                children: [
                  const Text("Runs once per second:"),
                  widget3(),
                ],
              ),
            ),
            //
            Center(
              child: AnterosColumn(
                innerDistance: 15.0,
                children: [
                  const Text("Runs once per minute:"),
                  widget4(),
                ],
              ),
            ),
            //
          ],
        ),
      ),
    );
  }

  /// Given a reference dateTime, will do a countdown from [seconds] to zero.
  AnterosTimeBuilder widget1() {
    return AnterosTimeBuilder.countdown(
      //
      start: DateTime.now(),
      //
      seconds: 15,
      //
      builder: (BuildContext context, DateTime now, int ticks, bool isFinished,
          {required int countdown}) {
        print('1) countdown = $countdown, finished = $isFinished');

        return Column(
          children: [
            const AnterosBox(height: 10),
            Text(
              isFinished ? "FINISH" : countdown.toString(),
              style: const TextStyle(fontSize: 25),
            ),
            TickerRendered(ticks),
          ],
        );
      },
    );
  }

  AnterosTimeBuilder widget2() {
    return AnterosTimeBuilder.eachSecond(
      seconds: 15,
      builder:
          (BuildContext context, DateTime now, int ticks, bool isFinished) {
        print('2) now = $now, ticks = $ticks, finished = $isFinished');
        return AnterosColumn(
          innerDistance: 10.0,
          children: [
            ClockRenderer(dateTime: now),
            TickerRendered(ticks),
            Text(now.toString()),
          ],
        );
      },
    );
  }

  AnterosTimeBuilder widget3() {
    return AnterosTimeBuilder.eachSecond(
      builder:
          (BuildContext context, DateTime now, int ticks, bool isFinished) {
        print('3) now = $now, ticks = $ticks');
        return AnterosColumn(
          innerDistance: 10.0,
          children: [
            ClockRenderer(dateTime: now),
            TickerRendered(ticks),
            Text(now.toString()),
          ],
        );
      },
    );
  }

  AnterosTimeBuilder widget4() {
    return AnterosTimeBuilder.eachMinute(
      builder:
          (BuildContext context, DateTime now, int ticks, bool isFinished) {
        print('4) now = $now, ticks = $ticks');
        return AnterosColumn(
          innerDistance: 10.0,
          children: [
            ClockRenderer(dateTime: now),
            TickerRendered(ticks),
            Text(now.toString()),
          ],
        );
      },
    );
  }
}

class TickerRendered extends StatelessWidget {
  final int ticker;

  const TickerRendered(this.ticker);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const AnterosPad(vertical: 10),
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnterosBox(
              width: 30,
              height: 15,
              color: ticker % 2 == 0 ? Colors.grey[300] : Colors.black),
          AnterosBox(
              width: 30,
              height: 15,
              color: ticker % 2 == 1 ? Colors.grey[300] : Colors.black),
        ],
      ),
    );
  }
}

class ClockRenderer extends StatelessWidget {
  const ClockRenderer({
    Key? key,
    required this.dateTime,
  }) : super(key: key);

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: FittedBox(
        child: Container(
          width: 210,
          height: 210,
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.black),
            borderRadius: BorderRadius.circular(210),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 105,
                left: 100,
                child: Transform(
                  alignment: Alignment.topCenter,
                  transform:
                      Matrix4.rotationZ(pi + pi / 24 * 2 * dateTime.hour),
                  child: Container(height: 90, width: 5, color: Colors.black),
                ),
              ),
              Positioned(
                top: 105,
                left: 100,
                child: Transform(
                  alignment: Alignment.topCenter,
                  transform:
                      Matrix4.rotationZ(pi + pi / 60 * 2 * dateTime.minute),
                  child: Container(height: 50, width: 5, color: Colors.grey),
                ),
              ),
              Positioned(
                top: 105,
                left: 101.5,
                child: Transform(
                  alignment: Alignment.topCenter,
                  transform:
                      Matrix4.rotationZ(pi + pi / 60 * 2 * dateTime.second),
                  child: Container(height: 90, width: 2, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
