import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:gf_app/screens/animations/animation.dart';
import 'package:gf_app/screens/border/border.dart';
import 'package:gf_app/screens/bottomsheet/bottomsheet.dart';
import 'package:gf_app/screens/checkbox/checkboxs.dart';
import 'package:gf_app/screens/checkboxlisttile/checkbox_list_tile_page.dart';
import 'package:gf_app/screens/dropdowns/dropdown-types.dart';
import 'package:gf_app/screens/intro-screen/introscreen.dart';
import 'package:gf_app/screens/radiobutton/radio_buttons.dart';
import 'package:gf_app/screens/radiolisttile/radiolisttile.dart';
import 'package:gf_app/screens/sticky_header/sticky_types.dart';
import '../../screens/accordian/accordian.dart';
import '../../screens/alert/alert.dart';
import '../../screens/appbar/app_home.dart';
import '../../screens/avatar/avatars.dart';
import '../../screens/badges/badges.dart';
import '../../screens/button/icon_buttons.dart';
import '../../screens/button/pill_buttons.dart';
import '../../screens/button/shadow_buttons.dart';
import '../../screens/button/social_buttons.dart';
import '../../screens/button/square_buttons.dart';
import '../../screens/button/standard_buttons.dart';
import '../../screens/cards/cards.dart';
import '../../screens/carousel/carousel.dart';
import '../../screens/drawer/webview.dart';
import '../../screens/floating_widget/floating_widget.dart';
import '../../screens/images/images.dart';
import '../../screens/loader/loaders.dart';
import '../../screens/progress_bar/progress_bar.dart';
import '../../screens/rating/rating.dart';
import '../../screens/searchbar/seachbar.dart';
import '../../screens/shimmer/shimmer.dart';
import '../../screens/tabs/tab_types.dart';
import '../../screens/tiles/tiles_page.dart';
import '../../screens/toast/toasts.dart';
import '../../screens/toggle/toggles.dart';
import '../../screens/typography/typography.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) => AnterosDrawer(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: const [Color(0xFFD685FF), Color(0xFF7466CC)],
              )),
              height: 250,
              child: AnterosDrawerHeader(
                closeButton: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    CupertinoIcons.back,
                    color: AnterosColors.SUCCESS,
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: const [Color(0xFFD685FF), Color(0xFF7466CC)],
                  ),
                ),
                otherAccountsPictures: <Widget>[
                  AnterosAvatar(
                    backgroundColor: Colors.green,
                    child: const Text('G'),
                  ),
                  const AnterosAvatar(
                    backgroundColor: Colors.black,
                    child: Text('W'),
                  ),
                ],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const AnterosAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        'lib/assets/images/gflogo.png',
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'GetWidget',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'info@getflutter.dev',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  AnterosAccordion(
                      title: 'Components',
                      expandedTitleBackgroundColor: Colors.white,
                      textStyle:
                          const TextStyle(color: Colors.black87, fontSize: 16),
                      contentChild: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(children: <Widget>[
                          AnterosAccordion(
                            margin: const EdgeInsets.all(0),
                            titlePadding: const EdgeInsets.only(
                                left: 7, top: 10, bottom: 10, right: 0),
                            expandedTitleBackgroundColor: Colors.white,
                            titleChild: Row(children: [
                              Icon(
                                const IconData(
                                  0xe904,
                                  fontFamily: 'GFFontIcons',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 9),
                                child: Text(
                                  'Buttons',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                              )
                            ]),
                            textStyle: const TextStyle(fontSize: 15),
                            contentChild: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              StandardButtons()),
                                    );
                                  },
                                  child: AnterosListTile(
                                    title: Text(
                                      'Standard',
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              PillsButtons()),
                                    );
                                  },
                                  child: AnterosListTile(
                                    title: Text(
                                      'Pills',
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              SquareButtons()),
                                    );
                                  },
                                  child: AnterosListTile(
                                    title: Text(
                                      'Square',
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ShadowButtons()),
                                    );
                                  },
                                  child: AnterosListTile(
                                    title: Text(
                                      'Shadow',
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              IconButtons()),
                                    );
                                  },
                                  child: AnterosListTile(
                                    title: Text(
                                      'Icons',
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              SocialButtons()),
                                    );
                                  },
                                  child: AnterosListTile(
                                    title: Text(
                                      'Social Buttons',
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        BadgesPage()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Badge',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe902,
                                  fontFamily: 'GFFontIcons',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Avatar()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Avatar',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe903,
                                  fontFamily: 'GFFontIcons',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Images()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Images',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe90d,
                                  fontFamily: 'GFFontIcons',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CardPage()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Cards',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe905,
                                  fontFamily: 'GFFontIcons',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Carousel()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Carousels',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe906,
                                  fontFamily: 'GFFontIcons',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        TilesPage()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Tiles',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe90e,
                                  fontFamily: 'GFFontIcons',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        TabTypes()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Tabs',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe91d,
                                  fontFamily: 'GFFontIcons',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Toggles()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Toggle',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe910,
                                  fontFamily: 'GFFontIcons',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Toasts()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Toast',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe920,
                                  fontFamily: 'GFFontIcons',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        AlertPage()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Alert',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe901,
                                  fontFamily: 'GFFontIcons',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Accordion()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Accordion',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe900,
                                  fontFamily: 'GFFontIcons',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SearchbarPage()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'SearchBar',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe919,
                                  fontFamily: 'GFFontIcons',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        AppHome()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Appbar',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe91e,
                                  fontFamily: 'GFFontIcons',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        TypographyPage()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Typography',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe923,
                                  fontFamily: 'GFFontIcons',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Loaders()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Loader',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe901,
                                  fontFamily: 'GFIcons',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        RatingPage()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Rating',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe901,
                                  fontFamily: 'GFFontIcons2',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        FloatingWidgetHome()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Floating Widget',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe900,
                                  fontFamily: 'GFFontIcons2',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ProgressBar()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Progress Bar',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe900,
                                  fontFamily: 'GFIcons',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ShimmerPage()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Shimmer',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe900,
                                  fontFamily: 'GFIcons',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CheckBoxPage()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Checkbox',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe906,
                                  fontFamily: 'GFIconsnew',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CheckBoxListTilePage()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Checkbox ListTile',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe905,
                                  fontFamily: 'GFIconsnew',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        RadioButtonPage()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Radio Button',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe908,
                                  fontFamily: 'GFIconsnew',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        RadioListTilePage()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Radio ListTile',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe909,
                                  fontFamily: 'GFIconsnew',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        BorderPage()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Border',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe900,
                                  fontFamily: 'GFIconsnew',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        BottomSheetPage()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'BottomSheet',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe901,
                                  fontFamily: 'GFIconsnew',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        AnimationPage()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Animation',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe907,
                                  fontFamily: 'GFIconsnew',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Introscreen()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Intro Screen',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe901,
                                  fontFamily: 'GFIconsneww',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        StickyTypes()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Sticky Header',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe907,
                                  fontFamily: 'GFIconsneww',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        DropDown()),
                              );
                            },
                            child: AnterosListTile(
                              title: const Text(
                                'Dropdown',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              avatar: Icon(
                                const IconData(
                                  0xe900,
                                  fontFamily: 'GFIconsneww',
                                ),
                                color: AnterosColors.DARK,
                                size: 17,
                              ),
                            ),
                          ),
                        ]),
                      )),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              WebView(url: 'https://docs.getwidget.dev'),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 2),
                      child: AnterosListTile(
                        title: Text('Documents',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              WebView(url: 'https://getwidget.dev/features/'),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 2),
                      child: AnterosListTile(
                        title: Text('Features',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
