import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';
import './option_disabled.dart';
import './option_hidden.dart';
import './option_list_of_string.dart';
import './option_list_of_map.dart';
import './option_list_of_list.dart';
import './option_async.dart';
import '../features_header.dart';
import '../keep_alive.dart';

class FeaturesOption extends StatelessWidget {
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
              stickyContent: const FeaturesHeader('Disabled Options'),
              content: FeaturesOptionDisabled(),
            ),
          ),
          KeepAliveWidget(
            child: AnterosStickyHeader(
              stickyContent: const FeaturesHeader('Hidden Options'),
              content: FeaturesOptionHidden(),
            ),
          ),
          KeepAliveWidget(
            child: AnterosStickyHeader(
              stickyContent:
                  const FeaturesHeader('Build Options from List of String'),
              content: FeaturesOptionListOfString(),
            ),
          ),
          KeepAliveWidget(
            child: AnterosStickyHeader(
              stickyContent:
                  const FeaturesHeader('Build Options from List of Map'),
              content: FeaturesOptionListOfMap(),
            ),
          ),
          KeepAliveWidget(
            child: AnterosStickyHeader(
              stickyContent:
                  const FeaturesHeader('Build Options from List of List'),
              content: FeaturesOptionListOfList(),
            ),
          ),
          KeepAliveWidget(
            child: AnterosStickyHeader(
              stickyContent: const FeaturesHeader('Async Options'),
              content: FeaturesOptionAsync(),
            ),
          ),
        ],
      ),
    );
  }
}
