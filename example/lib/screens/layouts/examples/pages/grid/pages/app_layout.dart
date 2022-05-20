import 'package:anterosflutter/anterosflutter.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DesktopLayoutPage extends StatelessWidget {
  const DesktopLayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            'Desktop layout',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.grey[400],
          child: AnterosLayoutGrid(
            areas: '''
          header header  header
          nav    content aside
          nav    content .
          footer footer  footer
        ''',
            // A number of extension methods are provided for concise track sizing
            columnSizes: [152.px, 1.fr, 152.px],
            rowSizes: [
              112.px,
              auto,
              1.fr,
              64.px,
            ],
            children: [
              const Header().inGridArea('header'),
              const Navigation().inGridArea('nav'),
              const Content().inGridArea('content'),
              const Aside().inGridArea('aside'),
              const Footer().inGridArea('footer'),
            ],
          ),
        ));
  }
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

class Aside extends StatelessWidget {
  const Aside({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Container(color: Colors.grey[600], width: 184);
}

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(color: Colors.deepPurple);
}
