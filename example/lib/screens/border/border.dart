import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';

class BorderPage extends StatefulWidget {
  @override
  _BorderPageState createState() => _BorderPageState();
}

class _BorderPageState extends State<BorderPage>
    with SingleTickerProviderStateMixin {
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

  bool fav = false;
  bool fav1 = false;
  bool fav2 = false;
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
            'Borders',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
                child: AnterosSegmentTabs(
                  tabController: tabController,
                  width: 280,
                  length: 3,
                  tabs: const <Widget>[
                    Text('Solid'),
                    Tab(
                      child: Text('Dashed'),
                    ),
                    Tab(
                      child: Text('Dotted'),
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
                    SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 30),
                            child: AnterosTypography(
                              text: 'Solid Border',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: AnterosBorder(
                              color: Color(0xFF19CA4B),
                              dashedLine: [2, 0],
                              type: AnterosBorderType.rect,
                              child: Container(
                                height: 100,
                                color: Color(0xFFE9FFEF),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: AnterosBorder(
                              color: Color(0xFF19CA4B),
                              dashedLine: [2, 0],
                              type: AnterosBorderType.rect,
                              child: Image.asset(
                                'lib/assets/images/card.png',
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 20),
                            child: AnterosTypography(
                              text: 'Solid Border with radius',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: AnterosBorder(
                              radius: Radius.circular(20),
                              color: Color(0xFF19CA4B),
                              dashedLine: [2, 0],
                              type: AnterosBorderType.rRect,
                              child: Container(
                                height: 100,
                                color: Color(0xFFE9FFEF),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: AnterosBorder(
                              radius: Radius.circular(20),
                              color: Color(0xFF19CA4B),
                              dashedLine: [2, 0],
                              type: AnterosBorderType.rRect,
                              child: AnterosCard(
                                boxFit: BoxFit.cover,
                                image: Image.asset(
                                  'lib/assets/images/card.png',
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.fitWidth,
                                ),
                                titlePosition: AnterosPosition.end,
                                title: AnterosListTile(
                                  titleText: 'Card Title',
                                  icon: AnterosIconButton(
                                    onPressed: null,
                                    icon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          fav = !fav;
                                        });
                                      },
                                      child: fav
                                          ? Icon(
                                              Icons.favorite,
                                              color: AnterosColors.DANGER,
                                            )
                                          : Icon(Icons.favorite_border),
                                    ),
                                    type: AnterosButtonType.transparent,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 30),
                            child: AnterosTypography(
                              text: 'Rounded Corners',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                // width: 50,
                                height: 60,
                                child: AnterosBorder(
                                  type: AnterosBorderType.oval,
                                  dashedLine: [6, 0],
                                  color: Color(0xFF19CA4B),
                                  strokeWidth: 2,
                                  child: Center(child: Text('Oval Border')),
                                ),
                              ),
                              Container(
                                width: 130,
                                height: 90,
                                child: AnterosBorder(
                                  type: AnterosBorderType.oval,
                                  dashedLine: [6, 0],
                                  color: Color(0xFF19CA4B),
                                  strokeWidth: 2,
                                  child: Center(
                                      child: Image.asset(
                                    'lib/assets/images/img.png',
                                    fit: BoxFit.fitWidth,
                                  )),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                child: AnterosBorder(
                                  type: AnterosBorderType.circle,
                                  dashedLine: [2, 0],
                                  color: Color(0xFF19CA4B),
                                  strokeWidth: 2,
                                  child: Center(
                                      child: Text(
                                    'Circular Border',
                                    textAlign: TextAlign.center,
                                  )),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                child: AnterosBorder(
                                  type: AnterosBorderType.circle,
                                  dashedLine: [2, 0],
                                  color: Color(0xFF19CA4B),
                                  strokeWidth: 2,
                                  child: Container(
                                    child: Image.asset(
                                      'lib/assets/images/img1.png',
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40)
                        ],
                      ),
                    ),
                    Container(
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 20),
                            child: AnterosTypography(
                              text: 'Dashed Borders',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: AnterosBorder(
                              type: AnterosBorderType.rRect,
                              color: Color(0xFF19CA4B),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFE9FFEF),
                                ),
                                height: 100,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: AnterosBorder(
                              type: AnterosBorderType.rRect,
                              color: Color(0xFF19CA4B),
                              child: Image.asset(
                                'lib/assets/images/image1.png',
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 20),
                            child: AnterosTypography(
                              text: 'Dashed Border with radius',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: AnterosBorder(
                              type: AnterosBorderType.rRect,
                              radius: Radius.circular(20),
                              color: Color(0xFF19CA4B),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFE9FFEF),
                                    borderRadius: BorderRadius.circular(20)),
                                height: 100,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: AnterosBorder(
                              type: AnterosBorderType.rRect,
                              radius: Radius.circular(20),
                              color: Color(0xFF19CA4B),
                              child: AnterosCard(
                                boxFit: BoxFit.fill,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.67),
                                    BlendMode.darken),
                                image: Image.asset(
                                  'lib/assets/images/image1.png',
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.fitWidth,
                                ),
                                titlePosition: AnterosPosition.end,
                                title: AnterosListTile(
                                  avatar: const AnterosAvatar(
                                    backgroundImage: AssetImage(
                                        'lib/assets/images/avatar8.png'),
                                  ),
                                  titleText: 'Card Title',
                                  subTitleText: 'Sub Title',
                                  icon: AnterosIconButton(
                                    onPressed: null,
                                    icon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          fav2 = !fav2;
                                        });
                                      },
                                      child: fav2
                                          ? Icon(
                                              Icons.favorite,
                                              color: AnterosColors.DANGER,
                                            )
                                          : Icon(Icons.favorite_border),
                                    ),
                                    type: AnterosButtonType.transparent,
                                  ),
                                ),
                                content: Text(
                                  'GetWidget is an open source library that comes with pre-build 1000+ UI components',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 30),
                            child: AnterosTypography(
                              text: 'Rounded Corners',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                // width: 50,
                                height: 60,
                                child: AnterosBorder(
                                  type: AnterosBorderType.oval,
                                  dashedLine: [3, 1],
                                  color: Color(0xFF19CA4B),
                                  child: Center(child: Text('Oval Border')),
                                ),
                              ),
                              Container(
                                width: 130,
                                height: 90,
                                child: AnterosBorder(
                                  type: AnterosBorderType.oval,
                                  dashedLine: [3, 1],
                                  color: Color(0xFF19CA4B),
                                  child: Center(
                                      child: Image.asset(
                                    'lib/assets/images/img.png',
                                    fit: BoxFit.fitWidth,
                                  )),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                child: AnterosBorder(
                                  type: AnterosBorderType.circle,
                                  dashedLine: [3, 1],
                                  color: Color(0xFF19CA4B),
                                  child: Center(
                                      child: Text(
                                    'Circular Border',
                                    textAlign: TextAlign.center,
                                  )),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                child: AnterosBorder(
                                  type: AnterosBorderType.circle,
                                  dashedLine: [3, 1],
                                  color: Color(0xFF19CA4B),
                                  child: Container(
                                    child: Image.asset(
                                      'lib/assets/images/img1.png',
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40)
                        ],
                      ),
                    ),
                    Container(
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 20),
                            child: AnterosTypography(
                              text: 'Dotted Borders',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: AnterosBorder(
                              color: Color(0xFF19CA4B),
                              dashedLine: [2, 1],
                              type: AnterosBorderType.rect,
                              child: Container(
                                height: 100,
                                color: Color(0xFFE9FFEF),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: AnterosBorder(
                              color: Color(0xFF19CA4B),
                              dashedLine: [2, 1],
                              type: AnterosBorderType.rect,
                              child: Image.asset(
                                'lib/assets/images/image1.png',
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 20),
                            child: AnterosTypography(
                              text: 'Dotted Border with radius',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: AnterosBorder(
                              radius: Radius.circular(20),
                              color: Color(0xFF19CA4B),
                              dashedLine: [2, 1],
                              type: AnterosBorderType.rRect,
                              child: Container(
                                height: 100,
                                color: Color(0xFFE9FFEF),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: AnterosBorder(
                              radius: Radius.circular(20),
                              color: Color(0xFF19CA4B),
                              dashedLine: [2, 1],
                              type: AnterosBorderType.rRect,
                              child: AnterosCard(
                                boxFit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.40),
                                    BlendMode.darken),
                                imageOverlay: const AssetImage(
                                    'lib/assets/images/image1.png'),
                                title: AnterosListTile(
                                  title: Text(
                                    'Card Title',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  subTitle: Text(
                                    'subtitle',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                content: Text(
                                  'GetWidget is an open source library that comes with pre-build 1000+ UI components',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                buttonBar: AnterosButtonBar(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  children: <Widget>[
                                    AnterosIconButton(
                                        color: const Color(0xFF3B5998),
                                        shape: AnterosIconButtonShape.circle,
                                        icon: const Icon(
                                          IconData(0xe908,
                                              fontFamily: 'GFSocialFonts'),
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        onPressed: () {}),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 30),
                            child: AnterosTypography(
                              text: 'Rounded Corners',
                              type: AnterosTypographyType.typo5,
                              dividerWidth: 25,
                              dividerColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                // width: 50,
                                height: 60,
                                child: AnterosBorder(
                                  type: AnterosBorderType.oval,
                                  dashedLine: [2, 1],
                                  color: Color(0xFF19CA4B),
                                  child: Center(child: Text('Oval Border')),
                                ),
                              ),
                              Container(
                                width: 130,
                                height: 90,
                                child: AnterosBorder(
                                  type: AnterosBorderType.oval,
                                  dashedLine: [2, 1],
                                  color: Color(0xFF19CA4B),
                                  child: Center(
                                      child: Image.asset(
                                    'lib/assets/images/img.png',
                                    fit: BoxFit.fitWidth,
                                  )),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                child: AnterosBorder(
                                  type: AnterosBorderType.circle,
                                  dashedLine: [2, 1],
                                  color: Color(0xFF19CA4B),
                                  child: Center(
                                      child: Text(
                                    'Circular Border',
                                    textAlign: TextAlign.center,
                                  )),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                child: AnterosBorder(
                                  type: AnterosBorderType.circle,
                                  dashedLine: [2, 1],
                                  color: Color(0xFF19CA4B),
                                  child: Container(
                                    child: Image.asset(
                                      'lib/assets/images/img1.png',
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40)
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
