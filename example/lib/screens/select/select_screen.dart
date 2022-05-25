import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'features_single/single_main.dart';
import 'features_multi/multi_main.dart';
import 'features_tile/tile_main.dart';
import 'features_option/option_main.dart';
import 'features_modal/modal_main.dart';
import 'features_choices/choices_main.dart';
import 'features_brightness.dart';
import 'features_color.dart';
// import 'features_theme.dart';
import 'keep_alive.dart';

class SelectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AnterosColors.DARK,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.back,
              color: AnterosColors.PRIMARY,
            ),
          ),
          title: const Text(
            'Select',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            labelColor: AnterosColors.PRIMARY,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(text: 'Single Choice'),
              Tab(text: 'Multiple Choice'),
              Tab(text: 'Choices Option'),
              Tab(text: 'Choices Widget'),
              Tab(text: 'Customize Modal'),
              Tab(text: 'Customize Tile'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            KeepAliveWidget(
              child: FeaturesSingle(),
            ),
            KeepAliveWidget(
              child: FeaturesMulti(),
            ),
            KeepAliveWidget(
              child: FeaturesOption(),
            ),
            KeepAliveWidget(
              child: FeaturesChoices(),
            ),
            KeepAliveWidget(
              child: FeaturesModal(),
            ),
            KeepAliveWidget(
              child: FeaturesTile(),
            ),
          ],
        ),
        // bottomNavigationBar: Card(
        //   elevation: 3,
        //   margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        //   child: FeaturesTheme(),
        // ),
      ),
    );
  }

  void _about(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (_) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                'flutter_awesome_select',
                style: Theme.of(context).textTheme.headline5,
              ),
              subtitle: Text('by davigmacode'),
              trailing: IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Smart select allows you to easily convert your usual form selects to dynamic pages with grouped radio or checkbox inputs. This widget is inspired by Smart Select component from Framework7',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Container(height: 15),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
