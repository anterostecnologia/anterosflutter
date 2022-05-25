import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';
import './tile_one_line.dart';
import './tile_two_line.dart';
import './tile_loading.dart';
import './tile_leading.dart';
import './tile_trailing.dart';
import './tile_builder.dart';
import './tile_validation.dart';
import '../features_header.dart';
import '../keep_alive.dart';

class FeaturesTile extends StatelessWidget {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      child: ListView(
        controller: scrollController,
        addAutomaticKeepAlives: true,
        children: <Widget>[
          AnterosStickyHeader(
            stickyContent: const FeaturesHeader('One Line'),
            content: FeaturesTileOneLine(),
          ),
          AnterosStickyHeader(
            stickyContent: const FeaturesHeader('Two Line'),
            content: FeaturesTileTwoLine(),
          ),
          AnterosStickyHeader(
            stickyContent: const FeaturesHeader('Leading Widget'),
            content: FeaturesTileLeading(),
          ),
          AnterosStickyHeader(
            stickyContent: const FeaturesHeader('Custom Trailing Widget'),
            content: FeaturesTileTrailing(),
          ),
          KeepAliveWidget(
            child: AnterosStickyHeader(
              stickyContent: const FeaturesHeader('Loading Stats'),
              content: FeaturesTileLoading(),
            ),
          ),
          KeepAliveWidget(
            child: AnterosStickyHeader(
              stickyContent: const FeaturesHeader('Custom Tile Builder'),
              content: FeaturesTileBuilder(),
            ),
          ),
          KeepAliveWidget(
            child: AnterosStickyHeader(
              stickyContent: const FeaturesHeader('Validation'),
              content: FeaturesTileValidation(),
            ),
          ),
        ],
      ),
    );
  }
}
