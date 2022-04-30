import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';

class Images extends StatefulWidget {
  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
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
              color: AnterosColors.SUCCESS,
            ),
          ),
          title: const Text(
            'Images',
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
                length: 3,
                tabs: const <Widget>[
                  Text('Basic'),
                  Tab(
                    child: Text('Circular'),
                  ),
                  Tab(
                    child: Text('Overlays'),
                  ),
                ],
                tabBarColor: AnterosColors.LIGHT,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: AnterosColors.WHITE,
                unselectedLabelColor: AnterosColors.DARK,
                indicator: const BoxDecoration(
                  color: Colors.black,
                  border: Border(
                    bottom: BorderSide(
                      color: AnterosColors.SUCCESS,
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
                        AnterosCard(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              AnterosImageOverlay(
                                height: 200,
                                width: 280,
                                image:
                                    AssetImage('lib/assets/images/image2.png'),
                              )
                            ],
                          ),
                        ),
                        AnterosCard(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              AnterosImageOverlay(
                                height: 200,
                                width: 280,
                                image:
                                    AssetImage('lib/assets/images/image.png'),
                              )
                            ],
                          ),
                        ),
                        AnterosCard(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              AnterosImageOverlay(
                                height: 200,
                                width: 280,
                                image:
                                    AssetImage('lib/assets/images/image1.png'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        AnterosCard(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              AnterosImageOverlay(
                                height: 140,
                                width: 140,
                                shape: BoxShape.circle,
                                image: AssetImage('lib/assets/images/img.png'),
                              ),
                              AnterosImageOverlay(
                                height: 140,
                                width: 140,
                                shape: BoxShape.circle,
                                image: AssetImage(
                                  'lib/assets/images/img1.png',
                                ),
                              )
                            ],
                          ),
                        ),
                        AnterosCard(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              AnterosImageOverlay(
                                height: 200,
                                width: 200,
                                shape: BoxShape.circle,
                                image: AssetImage('lib/assets/images/img2.png'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: ListView(
                      children: <Widget>[
                        AnterosCard(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              AnterosImageOverlay(
                                height: 200,
                                width: 280,
                                child: const Center(
                                  child: Text(
                                    'Light Overlay',
                                    style:
                                        TextStyle(color: AnterosColors.WHITE),
                                  ),
                                ),
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.20),
                                    BlendMode.darken),
                                image: const AssetImage(
                                    'lib/assets/images/image1.png'),
                              ),
                            ],
                          ),
                        ),
                        AnterosCard(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              AnterosImageOverlay(
                                height: 200,
                                width: 280,
                                child: const Center(
                                    child: Text(
                                  'Medium Overlay',
                                  style: TextStyle(color: AnterosColors.WHITE),
                                )),
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.40),
                                    BlendMode.darken),
                                image: const AssetImage(
                                    'lib/assets/images/image1.png'),
                              ),
                            ],
                          ),
                        ),
                        AnterosCard(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              AnterosImageOverlay(
                                height: 200,
                                width: 280,
                                child: const Center(
                                    child: Text(
                                  'Strong Overlay',
                                  style: TextStyle(color: AnterosColors.WHITE),
                                )),
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.60),
                                    BlendMode.darken),
                                image: const AssetImage(
                                    'lib/assets/images/image1.png'),
                              ),
                            ],
                          ),
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
