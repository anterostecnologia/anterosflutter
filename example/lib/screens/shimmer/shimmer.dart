import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anterosflutter/anterosflutter.dart';

class ShimmerPage extends StatefulWidget {
  @override
  _ShimmerPageState createState() => _ShimmerPageState();
}

class _ShimmerPageState extends State<ShimmerPage> {
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
            color: AnterosColors.SUCCESS,
          ),
        ),
        title: const Text(
          'Shimmer',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(left: 15, top: 30, bottom: 20),
          child: AnterosTypography(
            text: 'Basic Shimmer Effect',
            type: AnterosTypographyType.typo5,
            dividerWidth: 25,
            dividerColor: Theme.of(context).primaryColor,
          ),
        ),
        AnterosShimmer(
          mainColor: AnterosColors.DARK.withOpacity(0.22),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 12,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 12,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: 12,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, top: 30, bottom: 20),
          child: AnterosTypography(
            text: 'Shimmer Effect on Text',
            type: AnterosTypographyType.typo5,
            dividerWidth: 25,
            dividerColor: Theme.of(context).primaryColor,
          ),
        ),
        AnterosShimmer(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'Hurray!! Order Placed',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            const SizedBox(width: 5),
            Icon(Icons.sentiment_very_satisfied),
          ]),
          direction: AnterosShimmerDirection.rightToLeft,
          showGradient: true,
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.centerLeft,
            stops: const <double>[0, 0.3, 0.6, 0.9, 1],
            colors: [
              AnterosColors.DANGER,
              Theme.of(context).primaryColor,
              AnterosColors.WARNING,
              AnterosColors.SECONDARY,
              Colors.red,
            ],
          ),
        ),
      ]));
}
