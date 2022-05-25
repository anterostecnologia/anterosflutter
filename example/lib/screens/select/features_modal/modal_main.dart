import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';
import './modal_filter.dart';
import './modal_confirm.dart';
import './modal_validation.dart';
import './modal_selector.dart';
import './modal_shape.dart';
import './modal_header.dart';
import './modal_choices.dart';
import './modal_widget.dart';
import '../features_header.dart';
import '../keep_alive.dart';

class FeaturesModal extends StatelessWidget {
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
              stickyContent: const FeaturesHeader('Use Filter'),
              content: FeaturesModalFilter(),
            ),
          ),
          KeepAliveWidget(
            child: AnterosStickyHeader(
              stickyContent: const FeaturesHeader('Need to Confirm'),
              content: FeaturesModalConfirm(),
            ),
          ),
          KeepAliveWidget(
            child: AnterosStickyHeader(
              stickyContent: const FeaturesHeader('Validation'),
              content: FeaturesModalValidation(),
            ),
          ),
          KeepAliveWidget(
            child: AnterosStickyHeader(
              stickyContent: const FeaturesHeader('Choice Selector'),
              content: FeaturesModalSelector(),
            ),
          ),
          KeepAliveWidget(
            child: AnterosStickyHeader(
              stickyContent: const FeaturesHeader('Modal Shape'),
              content: FeaturesModalShape(),
            ),
          ),
          KeepAliveWidget(
            child: AnterosStickyHeader(
              stickyContent: const FeaturesHeader('Modal Header'),
              content: FeaturesModalHeader(),
            ),
          ),
          KeepAliveWidget(
            child: AnterosStickyHeader(
              stickyContent:
                  const FeaturesHeader('Custom Modal Header & Footer Widget'),
              content: FeaturesModalWidget(),
            ),
          ),
          KeepAliveWidget(
            child: AnterosStickyHeader(
              stickyContent:
                  const FeaturesHeader('Only Choices, Without Header & Footer'),
              content: FeaturesModalChoices(),
            ),
          ),
        ],
      ),
    );
  }
}
