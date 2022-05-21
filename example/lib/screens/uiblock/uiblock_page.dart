import 'dart:async';

import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

class UIBlockPage extends StatefulWidget {
  UIBlockPage({Key? key}) : super(key: key);

  @override
  _UIBlockPageState createState() => _UIBlockPageState();
}

class _UIBlockPageState extends State<UIBlockPage> {
  // could be anything other than string,
  // depends on your BackdropModalRoute<T> return type
  String backdropResult = '';
  GlobalKey _scaffoldGlobalKey = GlobalKey();

  // ValueListenable<int> _listenable = ValueListenable();
  ValueNotifier<int> _counter = ValueNotifier<int>(0);

  bool showLoader = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldGlobalKey,
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
            'UIBlock',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton(
                child: Text('Load Async'),
                onPressed: () {
                  setState(() {
                    showLoader = !showLoader;
                  });
                },
              ),
              Container(
                height: 100,
                child: AnterosUIBlock(
                  loadingStateFromFuture: () async {
                    if (showLoader) {
                      // return null, to show loader
                      return null;
                    }
                    // hides loader on hasData or HasError
                    return Future.value(Random().nextInt(200));
                  },
                  barrierColor: Colors.blueGrey,
                  barrierOpacity: 0.2,
                  loadingTextWidget: Text('Loading data...'),
                  hideBuilderOnNullData: true,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return Center(
                      child: Text('Async Data ${snapshot.data}'),
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    // default
                    _buildDefault(context),

                    SizedBox(height: 24),

                    // default dissmissible
                    _buildDefaultDissmissible(context),

                    SizedBox(height: 24),

                    // default with text
                    _buildDefaultWithText(context),

                    SizedBox(height: 24),

                    // custom using childBUilder
                    _buildCustomWithChildBuilder(context),

                    SizedBox(height: 24),

                    // default dissmissible with data
                    _buildDefaultDissmissibleWithData(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDefault(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text(
          "Default UIBlock (Dissmiss Disabled)",
          textAlign: TextAlign.center,
        ),
        onPressed: () async {
          AnterosUIBlock.block(_scaffoldGlobalKey.currentContext!);

          await Future.delayed(Duration(seconds: 3), () => '1');

          AnterosUIBlock.unblock(_scaffoldGlobalKey.currentContext!);
        },
      ),
    );
  }

  Widget _buildDefaultDissmissible(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text(
          "Default UIBlock (Dissmiss Enabled)",
          textAlign: TextAlign.center,
        ),
        onPressed: () async {
          AnterosUIBlock.block(
            _scaffoldGlobalKey.currentContext!,
            canDissmissOnBack: true,
            loadingTextWidget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Press back to dissmiss',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDefaultWithText(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text(
          "Default UIBlock With Text (Dissmiss Disabled)",
          textAlign: TextAlign.center,
        ),
        onPressed: () async {
          AnterosUIBlock.block(
            _scaffoldGlobalKey.currentContext!,
            loadingTextWidget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Cannot pop this loader, will dismiss in 3 seconds',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );

          Future.delayed(
            Duration(seconds: 3),
            () => AnterosUIBlock.unblock(_scaffoldGlobalKey.currentContext!),
          );
        },
      ),
    );
  }

  Widget _buildCustomWithChildBuilder(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text(
          "Custom UIBlock With Child Builder & State",
          textAlign: TextAlign.center,
        ),
        onPressed: () async {
          AnterosUIBlock.block(
            _scaffoldGlobalKey.currentContext!,
            backgroundColor: Colors.green.withOpacity(0.5),
            imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            childBuilder: (BuildContext context) {
              _counter.value = 0;

              // increment counter
              Timer.periodic(Duration(seconds: 1), (timer) async {
                _counter.value++;

                if (_counter.value == 3) {
                  timer.cancel();
                  AnterosUIBlock.unblock(context);

                  await Future.delayed(
                      Duration(seconds: 2), () => _counter.value = 0);
                }
              });

              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      AnterosUIBlockDefaultLoader(),
                      ValueListenableBuilder<int>(
                        valueListenable: _counter,
                        builder: (context, value, child) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              'Custom loader using "ChildBuilder".\n\n Closing in $value',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildDefaultDissmissibleWithData(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text(
          "Default UIBlock (Dissmiss Enabled) With Data",
          textAlign: TextAlign.center,
        ),
        onPressed: () async {
          var result = await AnterosUIBlock.blockWithData(
            _scaffoldGlobalKey.currentContext!,
            loadingTextWidget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  AnterosUIBlock.unblockWithData(context, "hello world");
                },
                child: Text(
                  'Press here to dissmiss with data. Back for null',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );

          print(result);
        },
      ),
    );
  }
}
