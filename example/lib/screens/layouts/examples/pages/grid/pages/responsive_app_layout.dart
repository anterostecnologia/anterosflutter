import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveLayoutPage extends StatelessWidget {
  const ResponsiveLayoutPage({
    Key? key,
    required this.viewportWidth,
  }) : super(key: key);

  final double viewportWidth;

  GridConfiguration computeGridConfig() {
    if (viewportWidth > 700) {
      // Desktop
      return GridConfiguration(
        areas: '''
          header header  header
          nav    content sidebar
          nav    content ad
          footer footer  footer
        ''',
        columnSizes: [186.px, 1.fr, 186.px],
        rowSizes: [
          144.px,
          auto,
          1.fr,
          112.px,
        ],
      );
    } else if (viewportWidth > 500) {
      // Larger mobile
      return GridConfiguration(
        areas: '''
          header  header
          nav     nav
          sidebar content
          ad      footer
        ''',
        columnSizes: [1.fr, 3.fr],
        rowSizes: [
          104.px,
          96.px,
          1.fr,
          72.px,
        ],
      );
    } else {
      // Small mobile
      return GridConfiguration(
        areas: '''
          header
          nav
          content
          sidebar
          ad
          footer
        ''',
        columnSizes: [1.fr],
        rowSizes: [
          96.px,
          72.px,
          1.fr,
          72.px,
          auto,
          54.px,
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final gridConfig = computeGridConfig();
    return Scaffold(
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
            'Responsive Grid layout',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.grey[400],
          child: AnterosLayoutGrid(
            areas: gridConfig.areas,
            // A number of extension methods are provided for concise track sizing
            columnSizes: gridConfig.columnSizes,
            rowSizes: gridConfig.rowSizes,
            children: [
              const Header().inGridArea('header'),
              const Navigation().inGridArea('nav'),
              const Content().inGridArea('content'),
              const Sidebar().inGridArea('sidebar'),
              const Footer().inGridArea('footer'),
              const Ad().inGridArea('ad'),
            ],
          ),
        ));
  }
}

class GridConfiguration {
  final String areas;
  final List<AnterosTrackSize> columnSizes;
  final List<AnterosTrackSize> rowSizes;
  GridConfiguration(
      {required this.areas, required this.columnSizes, required this.rowSizes});
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(color: Colors.red);
}

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(color: Colors.purple);
}

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(color: Colors.grey[300]);
}

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Container(color: Colors.grey[600], width: 184);
}

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(color: Colors.deepPurple);
}

class Ad extends StatelessWidget {
  const Ad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(color: Colors.deepOrange);
}
