import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class SemanticOrderingPage extends StatelessWidget {
  const SemanticOrderingPage({Key? key}) : super(key: key);

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
            'Semantic Ordering layout',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: Semantics(
          // We need to wrap the entire grid in a Semantics widget, with
          // `explicitChildNodes: true`, in order for sorting to work properly.
          explicitChildNodes: true,
          child: AnterosLayoutGrid(
            areas: '''
          header
          content
          footer
        ''',
            columnSizes: const [auto],
            rowSizes: const [
              auto,
              auto,
              auto,
            ],
            children: [
              // Using the Semantics widget and its sortKey tells screenreaders to
              // announce the children in the order you specify, regardless of their
              // ordering in source code (which is the default).
              //
              // In this example, you wouldn't want Footer() to be announced by the
              // screenreader first, would you? sortKey fixes that.
              Semantics(sortKey: const OrdinalSortKey(3), child: const Footer())
                  .inGridArea('footer'),
              Semantics(sortKey: const OrdinalSortKey(1), child: const Header())
                  .inGridArea('header'),
              Semantics(
                      sortKey: const OrdinalSortKey(2), child: const Content())
                  .inGridArea('content'),
            ],
          ),
        ));
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.red,
        child: const Text('Header'),
      );
}

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.grey[300],
        child: const Text('Content'),
      );
}

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.deepPurple,
        child: const Text('Footer'),
      );
}
