import 'package:anteros_flutter_app/screens/carousel/advanced_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:anteros_flutter_app/screens/button/like_buttons.dart';

class AdvancedCarouselTypes extends StatefulWidget {
  @override
  _AdvancedCarouselTypesState createState() => _AdvancedCarouselTypesState();
}

class _AdvancedCarouselTypesState extends State<AdvancedCarouselTypes> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: AnterosColors.DARK,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Icon(
                CupertinoIcons.back,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          title: const Text(
            'Advanced Carousel Slider',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            makeCarousel(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => BasicDemo()),
                'Basic'),
            makeCarousel(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => NoCenterDemo()),
                'No Center'),
            makeCarousel(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ImageSliderDemo()),
                'Image'),
            makeCarousel(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ComplicatedImageDemo()),
                'Complicated Image'),
            makeCarousel(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => EnlargeStrategyDemo()),
                'Enlarge Strategy'),
            makeCarousel(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ManuallyControlledSlider()),
                'Manually Controlled'),
            makeCarousel(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => OnDemandCarouselDemo()),
                'OnDemand Carousel'),
            makeCarousel(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => VerticalSliderDemo()),
                'Vertical Slider'),
            makeCarousel(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => FullscreenSliderDemo()),
                'Fullscreen'),
            makeCarousel(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        CarouselWithIndicatorDemo()),
                'Carousel With Indicator'),
            makeCarousel(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => PrefetchImageDemo()),
                'Prefetch Image'),
            makeCarousel(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        CarouselChangeReasonDemo()),
                'Carousel Change Reason'),
            makeCarousel(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        KeepPageviewPositionDemo()),
                'Keep Pageview Position'),
            makeCarousel(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => MultipleItemDemo()),
                'Multiple Item'),
          ],
        ),
      );

  GestureDetector makeCarousel(
      BuildContext context, MaterialPageRoute route, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          route,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            color: AnterosColors.DARK,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.40), blurRadius: 5)
            ]),
        child: AnterosListTile(
          color: AnterosColors.DARK,
          title: Text(
            title,
            style: TextStyle(color: AnterosColors.WHITE),
          ),
          icon: Icon(
            CupertinoIcons.forward,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
