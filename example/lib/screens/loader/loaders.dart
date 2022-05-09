import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';

class Loaders extends StatefulWidget {
  @override
  _LoadersState createState() => _LoadersState();
}

class _LoadersState extends State<Loaders> {
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
            'Loaders',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: AnterosTypography(
                text: 'Basic Loader',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            AnterosCard(
                content: Column(
              children: <Widget>[
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    AnterosLoader(),
                    AnterosLoader(
                      androidLoaderColor:
                          AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                    AnterosLoader(
                      androidLoaderColor:
                          AlwaysStoppedAnimation<Color>(Colors.amber),
                    ),
                    AnterosLoader(
                      androidLoaderColor:
                          AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    AnterosLoader(
                      loaderstrokeWidth: 2,
                      size: AnterosSize.SMALL,
                    ),
                    AnterosLoader(
                      androidLoaderColor:
                          AlwaysStoppedAnimation<Color>(Colors.red),
                      loaderstrokeWidth: 2,
                      size: AnterosSize.MEDIUM,
                    ),
                    AnterosLoader(
                      androidLoaderColor:
                          AlwaysStoppedAnimation<Color>(Colors.amber),
                      loaderstrokeWidth: 2,
                      size: AnterosSize.LARGE,
                    ),
                    AnterosLoader(
                      androidLoaderColor:
                          AlwaysStoppedAnimation<Color>(Colors.green),
                      loaderstrokeWidth: 2,
                      size: 60,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            )),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: AnterosTypography(
                text: 'IOS Loader',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            AnterosCard(
                content: Column(
              children: <Widget>[
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    AnterosLoader(
                      type: AnterosLoaderType.ios,
                      size: AnterosSize.SMALL,
                    ),
                    AnterosLoader(
                      type: AnterosLoaderType.ios,
                    ),
                    AnterosLoader(
                      type: AnterosLoaderType.ios,
                      size: AnterosSize.LARGE,
                    ),
                    AnterosLoader(
                      type: AnterosLoaderType.ios,
                      size: 60,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            )),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: AnterosTypography(
                text: 'Circular Loader',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            AnterosCard(
                content: Column(
              children: <Widget>[
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    AnterosLoader(
                      type: AnterosLoaderType.circle,
                      size: AnterosSize.SMALL,
                    ),
                    AnterosLoader(
                      type: AnterosLoaderType.circle,
                      size: AnterosSize.MEDIUM,
                    ),
                    AnterosLoader(
                      type: AnterosLoaderType.circle,
                      size: AnterosSize.LARGE,
                    ),
                    AnterosLoader(
                      type: AnterosLoaderType.circle,
                      size: 60,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            )),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: AnterosTypography(
                text: 'Square Loader',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            AnterosCard(
                content: Column(
              children: <Widget>[
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    AnterosLoader(
                      type: AnterosLoaderType.square,
                      size: AnterosSize.SMALL,
                    ),
                    AnterosLoader(
                      type: AnterosLoaderType.square,
                      size: AnterosSize.MEDIUM,
                    ),
                    AnterosLoader(
                      type: AnterosLoaderType.square,
                      size: AnterosSize.LARGE,
                    ),
                    AnterosLoader(
                      type: AnterosLoaderType.square,
                      size: 60,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            )),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: AnterosTypography(
                text: 'Custom Loader',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            AnterosCard(
              content: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      AnterosLoader(
                        type: AnterosLoaderType.custom,
                        child: Image(
                          image: AssetImage('lib/assets/gif/loader.gif'),
                          width: 150,
                        ),
                      ),
                      AnterosLoader(
                        type: AnterosLoaderType.custom,
                        size: AnterosSize.SMALL,
                        child: Image(
                          image: AssetImage('lib/assets/gif/loader1.gif'),
                          width: 150,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      AnterosLoader(
                        type: AnterosLoaderType.custom,
                        loaderIconOne: Text('Please'),
                        loaderIconTwo: Text('Wait'),
                        loaderIconThree: Text('a moment'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
