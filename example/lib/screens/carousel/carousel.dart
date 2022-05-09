import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';

final List<String> imageList = [
  'lib/assets/images/card5.png',
  'lib/assets/images/image.png',
  'lib/assets/images/image1.png',
  'lib/assets/images/image2.png',
  'lib/assets/images/card4.png',
];

final List<String> assetImg = [
  'lib/assets/images/red.png',
  'lib/assets/images/purple.png',
  'lib/assets/images/orange.png',
  'lib/assets/images/red.png',
];

final List<Color> gradientColor = [
  const Color(0xffF0417C),
  const Color(0xFFFF3636),
];

final List<Color> gradientColors = [
  const Color(0xffFFD633),
  const Color(0xFFFF8F33),
];

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
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
            child: Icon(
              CupertinoIcons.back,
              color: Theme.of(context).primaryColor,
            ),
          ),
          title: const Text(
            'Carousel',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 40,
              margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
              child: AnterosSegmentTabs(
                tabController: tabController,
                width: 280,
                length: 2,
                tabs: const <Widget>[
                  Text('Gradient'),
                  Tab(
                    child: Text('Image'),
                  ),
                ],
                tabBarColor: AnterosColors.LIGHT,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: AnterosColors.WHITE,
                unselectedLabelColor: AnterosColors.DARK,
                indicator: BoxDecoration(
                  color: Colors.black,
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 3,
                    ),
                  ),
                ),
                // indicatorPadding: const EdgeInsets.all(8),
                // indicatorWeight: 2,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 140,
              child: AnterosTabBarView(
                controller: tabController,
                height: 400,
                children: <Widget>[
                  Container(
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.only(left: 15, top: 30, bottom: 10),
                          child: AnterosTypography(
                            text: 'Full Width',
                            type: AnterosTypographyType.typo5,
                            dividerWidth: 25,
                            dividerColor: Theme.of(context).primaryColor,
                          ),
                        ),
                        AnterosCarousel(
                          autoPlay: true,
                          viewportFraction: 1.0,
                          activeIndicator: AnterosColors.SUCCESS,
                          passiveIndicator: AnterosColors.DARK,
                          aspectRatio: 2,
                          items: gradientColor
                              .map(
                                (url) => AnterosCard(
                                  gradient: LinearGradient(
                                    begin: FractionalOffset.topLeft,
                                    end: FractionalOffset.bottomRight,
                                    colors: gradientColor,
                                  ),
                                  margin: const EdgeInsets.only(
                                    left: 15,
                                    right: 15,
                                    bottom: 24,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4)),
                                  content: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 30, left: 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const <Widget>[
                                        Text(
                                          'Title',
                                          style: TextStyle(
                                            color: AnterosColors.WHITE,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 30, right: 30, top: 30),
                                          child: Text(
                                            'GetWidget is an open source library that comes with pre-build 1000+ UI components. ',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: AnterosColors.LIGHT,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 15, top: 30, bottom: 10),
                          child: AnterosTypography(
                            text: 'Multiple Items',
                            type: AnterosTypographyType.typo5,
                            dividerWidth: 25,
                            dividerColor: Theme.of(context).primaryColor,
                          ),
                        ),
                        AnterosItemsCarousel(
                          rowCount: 3,
                          children: assetImg
                              .map(
                                (url) => AnterosCard(
                                  gradient: LinearGradient(
                                    begin: FractionalOffset.topCenter,
                                    end: FractionalOffset.bottomCenter,
                                    colors: gradientColors,
                                  ),
                                  margin:
                                      const EdgeInsets.only(left: 15, right: 5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4)),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const <Widget>[
                                      Text(
                                        'Title',
                                        style: TextStyle(
                                          color: AnterosColors.WHITE,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(right: 5, top: 10),
                                        child: Text(
                                          'GetWidget is an open source library that comes with pre-build 1000+ UI components ',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: AnterosColors.LIGHT,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 15, top: 30, bottom: 10),
                          child: AnterosTypography(
                            text: 'Full Size',
                            type: AnterosTypographyType.typo5,
                            dividerWidth: 25,
                            dividerColor: Theme.of(context).primaryColor,
                          ),
                        ),
                        AnterosCarousel(
                          autoPlay: true,
                          viewportFraction: 1.0,
                          activeIndicator: AnterosColors.SUCCESS,
                          passiveIndicator: AnterosColors.WHITE,
                          aspectRatio: 2,
                          items: assetImg
                              .map(
                                (url) => AnterosCard(
                                  gradient: LinearGradient(
                                    begin: FractionalOffset.bottomLeft,
                                    end: FractionalOffset.topRight,
                                    colors: const [
                                      Color(0xff33B5E5),
                                      Color(0xFF39FFF8),
                                    ],
                                  ),
                                  height: 200,
                                  margin: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4)),
                                  content: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 30, left: 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const <Widget>[
                                        Text(
                                          'Title',
                                          style: TextStyle(
                                              color: AnterosColors.WHITE),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 30, right: 30, top: 30),
                                          child: Text(
                                            'GetWidget is an open source library that comes with pre-build 1000+ UI components. ',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: AnterosColors.LIGHT),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.only(left: 15, top: 30, bottom: 10),
                          child: AnterosTypography(
                            text: 'Full Width',
                            type: AnterosTypographyType.typo5,
                            dividerWidth: 25,
                            dividerColor: Theme.of(context).primaryColor,
                          ),
                        ),
                        AnterosCarousel(
                          autoPlay: true,
                          viewportFraction: 1.0,
                          activeIndicator: AnterosColors.SUCCESS,
                          passiveIndicator: AnterosColors.DARK,
                          aspectRatio: 2,
                          items: imageList
                              .map(
                                (url) => AnterosImageOverlay(
                                  height: 200,
                                  margin: const EdgeInsets.only(
                                    left: 15,
                                    right: 15,
                                    bottom: 30,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4)),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 30, left: 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const <Widget>[
                                        Text(
                                          'Title',
                                          style: TextStyle(
                                              color: AnterosColors.WHITE),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 30, right: 30, top: 30),
                                          child: Text(
                                            'GetWidget is an open source library that comes with pre-build 1000+ UI components. ',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: AnterosColors.LIGHT),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  image: AssetImage(url),
                                ),
                              )
                              .toList(),
                          onPageChanged: (index) {
                            setState(() {});
                          },
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 15, top: 30, bottom: 10),
                          child: AnterosTypography(
                            text: 'Multiple Items',
                            type: AnterosTypographyType.typo5,
                            dividerWidth: 25,
                            dividerColor: Theme.of(context).primaryColor,
                          ),
                        ),
                        AnterosItemsCarousel(
                          rowCount: 3,
                          children: imageList
                              .map(
                                (url) => AnterosImageOverlay(
                                  height: 400,
                                  width: 300,
                                  margin:
                                      const EdgeInsets.only(left: 15, right: 5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4)),
                                  child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: const <Widget>[
                                          Text(
                                            'Title',
                                            style: TextStyle(
                                                color: AnterosColors.WHITE),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                right: 5,
                                              ),
                                              child: Text(
                                                'Open source UI library ',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: AnterosColors.LIGHT),
                                              ))
                                        ],
                                      )),
                                  image: AssetImage(url),
                                ),
                              )
                              .toList(),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 15, top: 30, bottom: 10),
                          child: AnterosTypography(
                            text: 'Full Size',
                            type: AnterosTypographyType.typo5,
                            dividerWidth: 25,
                            dividerColor: Theme.of(context).primaryColor,
                          ),
                        ),
                        AnterosCarousel(
                          autoPlay: true,
                          viewportFraction: 1.0,
                          activeIndicator: AnterosColors.SUCCESS,
                          passiveIndicator: AnterosColors.WHITE,
                          aspectRatio: 2,
                          items: imageList
                              .map(
                                (url) => AnterosImageOverlay(
                                  height: 200,
                                  margin: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4)),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 30, left: 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const <Widget>[
                                        Text(
                                          'Title',
                                          style: TextStyle(
                                              color: AnterosColors.WHITE),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 30,
                                            right: 30,
                                            top: 30,
                                          ),
                                          child: Text(
                                            'GetWidget is an open source library that comes with pre-build 1000+ UI components. ',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: AnterosColors.LIGHT),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  image: AssetImage(url),
                                ),
                              )
                              .toList(),
                          onPageChanged: (index) {
                            setState(() {});
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
}
