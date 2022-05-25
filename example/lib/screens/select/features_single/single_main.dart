import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';
import './single_page.dart';
import './single_sheet.dart';
import './single_popup.dart';
import './single_chips.dart';
import './single_switches.dart';
import '../features_header.dart';
import '../keep_alive.dart';

class FeaturesSingle extends StatelessWidget {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      child: ListView(
        controller: scrollController,
        addAutomaticKeepAlives: true,
        children: <Widget>[
          KeepAliveWidget(
            child: AnterosStickyHeader(
              stickyContent: const FeaturesHeader('Open in Full Page'),
              content: FeaturesSinglePage(),
            ),
          ),
          KeepAliveWidget(
            child: AnterosStickyHeader(
              stickyContent: const FeaturesHeader('Open in Bottom Sheet'),
              content: FeaturesSingleSheet(),
            ),
          ),
          KeepAliveWidget(
            child: AnterosStickyHeader(
              stickyContent: const FeaturesHeader('Open in Popup Dialog'),
              content: FeaturesSinglePopup(),
            ),
          ),
          KeepAliveWidget(
            child: AnterosStickyHeader(
              stickyContent: const FeaturesHeader('Use Chips'),
              content: FeaturesSingleChips(),
            ),
          ),
          KeepAliveWidget(
            child: AnterosStickyHeader(
              stickyContent: const FeaturesHeader('Use Switches'),
              content: FeaturesSingleSwitches(),
            ),
          ),
        ],
      ),
    );
  }
}
