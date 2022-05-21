import 'package:anteros_flutter_app/screens/calendar/calendar_page.dart';
import 'package:anteros_flutter_app/screens/chips_input/chips_input.dart';
import 'package:anteros_flutter_app/screens/clippers/clippers_page.dart';
import 'package:anteros_flutter_app/screens/color_picker/colors_picker.dart';
import 'package:anteros_flutter_app/screens/containers/containers_types.dart';
import 'package:anteros_flutter_app/screens/dialogs/dialogs.dart';
import 'package:anteros_flutter_app/screens/draggable_home/anteros_draggable_home.dart';
import 'package:anteros_flutter_app/screens/form/form_page.dart';
import 'package:anteros_flutter_app/screens/indicators/progress_indicators_types.dart';
import 'package:anteros_flutter_app/screens/layouts/layouts_types.dart';
import 'package:anteros_flutter_app/screens/pin_code/pin_code.dart';
import 'package:anteros_flutter_app/screens/switch/switch_page.dart';
import 'package:anteros_flutter_app/screens/uiblock/uiblock_page.dart';
import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:anteros_flutter_app/screens/animations/animation.dart';
import 'package:anteros_flutter_app/screens/badges/badges_adv.dart';
import 'package:anteros_flutter_app/screens/border/border.dart';
import 'package:anteros_flutter_app/screens/bottomsheet/bottomsheet.dart';
import 'package:anteros_flutter_app/screens/grouped_list/grouped_list_types.dart';
import 'package:anteros_flutter_app/screens/intro-screen/introscreen.dart';
import 'package:anteros_flutter_app/screens/radiolisttile/radiolisttile.dart';
import 'package:anteros_flutter_app/screens/sticky_header/sticky_types.dart';
import '../screens/accordian/accordian.dart';
import '../screens/alert/alert.dart';
import '../screens/appbar/app_home.dart';
import '../screens/avatar/avatars.dart';
import '../screens/badges/badges.dart';
import '../screens/button/button_types.dart';
import '../screens/cards/cards.dart';
import '../screens/carousel/carousel.dart';
import '../screens/drawer/drawer.dart';
import '../screens/floating_widget/floating_widget.dart';
import '../screens/images/images.dart';
import '../screens/loader/loaders.dart';
import '../screens/progress_bar/progress_bar.dart';
import '../screens/rating/rating.dart';
import '../screens/searchbar/seachbar.dart';
import '../screens/shimmer/shimmer.dart';
import '../screens/tabs/tab_types.dart';
import '../screens/tiles/tiles_page.dart';
import '../screens/toast/toasts.dart';
import '../screens/toggle/toggles.dart';
import '../screens/typography/typography.dart';
import '../screens/checkbox/checkboxs.dart';
import '../screens/checkboxlisttile/checkbox_list_tile_page.dart';
import '../screens/radiobutton/radio_buttons.dart';
import 'dropdowns/dropdown-types.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List anterosComponents = [
    {
      'icon': const IconData(
        0xe904,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Button',
      'route': ButtonTypes(),
      'newFeature': false,
    },
    {
      'icon': const IconData(
        0xe902,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Badge',
      'route': BadgesPage(),
      'newFeature': false,
    },
    {
      'icon': const IconData(
        0xe902,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Advanced Badge',
      'route': AdvancedBadgesPage(),
      'newFeature': true,
    },
    {
      'icon': FontAwesome.object_group,
      'title': 'Grouped list',
      'route': GroupedListTypes(),
      'newFeature': true,
    },
    {
      'icon': const IconData(
        0xe905,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Cards',
      'route': CardPage(),
      'newFeature': false,
    },
    {
      'icon': FontAwesome.wpforms,
      'title': 'Forms',
      'route': FormPage(),
      'newFeature': true,
    },
    {
      'icon': const IconData(
        0xe906,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Carousel',
      'route': Carousel(),
      'newFeature': false,
    },
    {
      'icon': const IconData(
        0xe903,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Avatar',
      'route': Avatar(),
      'newFeature': false,
    },
    {
      'icon': const IconData(
        0xe90d,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Images',
      'route': Images(),
      'newFeature': false,
    },
    {
      'icon': const IconData(
        0xe90e,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Tiles',
      'route': TilesPage(),
      'newFeature': false,
    },
    {
      'icon': const IconData(
        0xe91d,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Tabs',
      'route': TabTypes(),
      'newFeature': true,
    },
    {
      'icon': const IconData(
        0xe910,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Toggle',
      'route': Toggles(),
      'newFeature': false,
    },
    {
      'icon': const IconData(
        0xe920,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Toast',
      'route': Toasts(),
      'newFeature': false,
    },
    {
      'icon': const IconData(
        0xe901,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Alert',
      'route': AlertPage(),
      'newFeature': true,
    },
    {
      'icon': const IconData(
        0xe900,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Accordion',
      'route': Accordion(),
      'newFeature': false,
    },
    {
      'icon': const IconData(
        0xe919,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Search Bar',
      'route': SearchbarPage(),
      'newFeature': false,
    },
    {
      'icon': const IconData(
        0xe91e,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Appbar',
      'route': AppHome(),
      'newFeature': false,
    },
    {
      'icon': const IconData(
        0xe901,
        fontFamily: 'GFFontIcons2',
      ),
      'title': 'Rating',
      'route': RatingPage(),
      'newFeature': false,
    },
    {
      'icon': const IconData(
        0xe901,
        fontFamily: 'GFIcons',
      ),
      'title': 'Loaders',
      'route': Loaders(),
      'newFeature': false,
    },
    {
      'icon': const IconData(
        0xe923,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Typography',
      'route': TypographyPage(),
      'newFeature': false,
    },
    {
      'icon': const IconData(
        0xe900,
        fontFamily: 'GFFontIcons2',
      ),
      'title': 'Floating Widget',
      'route': FloatingWidgetHome(),
      'newFeature': false,
    },
    {
      'icon': const IconData(
        0xe900,
        fontFamily: 'GFIcons',
      ),
      'title': 'Progress Bar',
      'route': ProgressBar(),
      'newFeature': false,
    },
    {
      'icon': const IconData(
        0xe900,
        fontFamily: 'GFFontIcons2',
      ),
      'title': 'Shimmer',
      'route': ShimmerPage(),
      'newFeature': false,
    },
    {
      'icon': const IconData(
        0xe906,
        fontFamily: 'GFIconsnew',
      ),
      'title': 'CheckBox',
      'route': CheckBoxPage(),
      'newFeature': false,
    },
    {
      'icon': const IconData(
        0xe905,
        fontFamily: 'GFIconsnew',
      ),
      'title': 'Checkbox List Tile',
      'route': CheckBoxListTilePage(),
      'newFeature': true,
    },
    {
      'icon': const IconData(
        0xe908,
        fontFamily: 'GFIconsnew',
      ),
      'title': 'RadioButton',
      'route': RadioButtonPage(),
      'newFeature': false,
    },
    {
      'icon': const IconData(
        0xe909,
        fontFamily: 'GFIconsnew',
      ),
      'title': 'RadioListTile',
      'route': RadioListTilePage(),
      'newFeature': true,
    },
    {
      'icon': const IconData(
        0xe900,
        fontFamily: 'GFIconsnew',
      ),
      'title': 'Border',
      'route': BorderPage(),
      'newFeature': false,
    },
    {
      'icon': const IconData(
        0xe901,
        fontFamily: 'GFIconsnew',
      ),
      'title': 'BottomSheet',
      'route': BottomSheetPage(),
      'newFeature': false,
    },
    {
      'icon': const IconData(
        0xe907,
        fontFamily: 'GFIconsnew',
      ),
      'title': 'Animation',
      'route': AnimationPage(),
      'newFeature': false,
    },
    {
      'icon': const IconData(
        0xe901,
        fontFamily: 'GFIconsneww',
      ),
      'title': 'IntroScreen',
      'route': Introscreen(),
      'newFeature': false,
    },
    {
      'icon': const IconData(
        0xe907,
        fontFamily: 'GFIconsneww',
      ),
      'title': 'StickyHeader',
      'route': StickyTypes(),
      'newFeature': false,
    },
    {
      'icon': FontAwesome.caret_down,
      'title': 'DropDown',
      'route': DropDown(),
      "newFeature": false
    },
    {
      'icon': FontAwesome.tint,
      'title': 'Color picker',
      'route': ColorPickerPage(),
      'newFeature': true,
    },
    {
      'icon': FontAwesome.home,
      'title': 'Draggable home',
      'route': DraggableHomePage(),
      'newFeature': true,
    },
    {
      'icon': FontAwesome5Regular.stop_circle,
      'title': 'Pin code',
      'route': PinCodeVerificationScreen(phoneNumber: "+554498812290"),
      'newFeature': true,
    },
    {
      'icon': FontAwesome.search,
      'title': 'Dialogs',
      'route': Dialogs(),
      'newFeature': true,
    },
    {
      'icon': FontAwesome.table,
      'title': 'Layouts',
      'route': LayoutsTypes(),
      'newFeature': true,
    },
    {
      'icon': FontAwesome.angle_double_right,
      'title': 'Indicators',
      'route': ProgressIndicatorsTypes(),
      'newFeature': true,
    },
    {
      'icon': FontAwesome.circle,
      'title': 'Clippers',
      'route': ClippersPage(),
      'newFeature': true,
    },
    {
      'icon': FontAwesome.times_rectangle,
      'title': 'Containers',
      'route': ContainersTypes(),
      'newFeature': true,
    },
    {
      'icon': FontAwesome.subway,
      'title': 'Switchers',
      'route': SwitchPage(),
      'newFeature': true,
    },
    {
      'icon': FontAwesome.calendar,
      'title': 'Calendar',
      'route': CalendarPage(),
      'newFeature': true,
    },
    {
      'icon': FontAwesome.align_right,
      'title': 'UI Block',
      'route': UIBlockPage(),
      'newFeature': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    anterosComponents.sort(
      (a, b) {
        return a['title'].compareTo(b['title']);
      },
    );
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        backgroundColor: AnterosColors.DARK,
        title: Image.asset(
          'lib/assets/icons/gflogo.png',
          width: 150,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.swap_calls_rounded),
            tooltip: 'Alterar tema',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      body: ListView(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          Container(
            margin:
                const EdgeInsets.only(left: 15, bottom: 20, top: 20, right: 15),
            child: GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: anterosComponents.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                        onTap: () {},
                        child: buildSquareTile(
                            anterosComponents[index]['title'],
                            anterosComponents[index]['icon'],
                            anterosComponents[index]['route'],
                            anterosComponents[index]['newFeature']))),
          )
        ],
      ),
    );
  }

  Widget buildSquareTile(
      String title, IconData? icon, Widget? route, bool newFeature) {
    var iconWidget = newFeature
        ? AnterosIconBadge(
            child: AnterosIconButton(
              type: AnterosButtonType.transparent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => route!),
                );
              },
              icon: Icon(
                icon,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
            ),
            counterChild: const AnterosBadge(
              text: 'new',
              shape: AnterosBadgeShape.pills,
            ),
          )
        : Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 30,
          );
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => route!),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF333333),
          borderRadius: const BorderRadius.all(Radius.circular(7)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.61),
                blurRadius: 6,
                spreadRadius: 0),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            iconWidget,
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AnterosColors.WHITE, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
