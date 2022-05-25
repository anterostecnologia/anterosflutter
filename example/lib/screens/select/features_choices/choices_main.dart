import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';
import './choices_grouped.dart';
import './choices_divider.dart';
import './choices_builder.dart';
import './choices_theme.dart';
import '../features_header.dart';
import '../keep_alive.dart';

class FeaturesChoices extends StatelessWidget {
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
              stickyContent: const FeaturesHeader('Grouped Items'),
              content: FeaturesChoicesGrouped(),
            ),
          ),
          KeepAliveWidget(
            child: AnterosStickyHeader(
              stickyContent: const FeaturesHeader('Divider Between Item'),
              content: FeaturesChoicesDivider(),
            ),
          ),
          KeepAliveWidget(
            child: AnterosStickyHeader(
              stickyContent:
                  const FeaturesHeader('Custom Choice Widget and Layout'),
              content: FeaturesChoicesBuilder(),
            ),
          ),
          KeepAliveWidget(
            child: AnterosStickyHeader(
              stickyContent: const FeaturesHeader('Customize Theme'),
              content: FeaturesChoicesTheme(),
            ),
          ),
        ],
      ),
    );
  }
}
