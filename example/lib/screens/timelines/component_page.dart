import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widget.dart';

class ComponentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final children = [
      _ComponentRow(
        name: 'Dot\nIndicator',
        item: AnterosDotIndicator(),
      ),
      _ComponentRow(
        name: 'Outlined dot\nIndicator',
        item: AnterosOutlinedDotIndicator(),
      ),
      _ComponentRow(
        name: 'Container\nIndicator',
        item: AnterosContainerIndicator(
          child: Container(
            width: 15.0,
            height: 15.0,
            color: Colors.blue,
          ),
        ),
      ),
      _ComponentRow(
        name: 'Solid line\nConnector',
        item: SizedBox(
          height: 20.0,
          child: AnterosSolidLineConnector(),
        ),
      ),
      _ComponentRow(
        name: 'Dashed line\nConnector',
        item: SizedBox(
          height: 20.0,
          child: DashedLineConnector(),
        ),
      ),
      _ComponentRow(
        name: 'Decorated line\nConnector',
        item: SizedBox(
          height: 20.0,
          child: DecoratedLineConnector(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Colors.lightBlueAccent.shade100],
              ),
            ),
          ),
        ),
      ),
      _ComponentRow(
        name: 'Simple TimelineNode',
        item: SizedBox(
          height: 50.0,
          child: AnterosTimelineNode.simple(),
        ),
      ),
      _ComponentRow(
        name: 'Complex TimelineNode',
        item: SizedBox(
          height: 80.0,
          child: AnterosTimelineNode(
            indicator: Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Complex'),
              ),
            ),
            startConnector: DashedLineConnector(),
            endConnector: AnterosSolidLineConnector(),
          ),
        ),
      ),
      _ComponentRow(
        name: 'TimelineTile',
        item: AnterosTimelineTile(
          oppositeContents: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('opposite\ncontents'),
          ),
          contents: Card(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Text('contents'),
            ),
          ),
          node: AnterosTimelineNode(
            indicator: AnterosDotIndicator(),
            startConnector: AnterosSolidLineConnector(),
            endConnector: AnterosSolidLineConnector(),
          ),
        ),
      ),
      _ComponentRow(
        name: 'AnterosConnectionDirection.before',
        item: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: AnterosFixedTimelines.tileBuilder(
            builder: AnterosTimelineTileBuilder.connectedFromStyle(
              connectionDirection: AnterosConnectionDirection.before,
              connectorStyleBuilder: (context, index) {
                return (index == 1)
                    ? AnterosConnectorStyle.dashedLine
                    : AnterosConnectorStyle.solidLine;
              },
              indicatorStyleBuilder: (context, index) =>
                  AnterosIndicatorStyle.dot,
              itemExtent: 40.0,
              itemCount: 3,
            ),
          ),
        ),
      ),
      _ComponentRow(
        name: 'AnterosConnectionDirection.after',
        item: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnterosFixedTimelines.tileBuilder(
            builder: AnterosTimelineTileBuilder.connectedFromStyle(
              connectionDirection: AnterosConnectionDirection.after,
              connectorStyleBuilder: (context, index) {
                return (index == 1)
                    ? AnterosConnectorStyle.dashedLine
                    : AnterosConnectorStyle.solidLine;
              },
              indicatorStyleBuilder: (context, index) =>
                  AnterosIndicatorStyle.dot,
              itemExtent: 40.0,
              itemCount: 3,
            ),
          ),
        ),
      ),
      _ComponentRow(
        name: 'ContentsAlign.basic',
        item: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnterosFixedTimelines.tileBuilder(
            builder: AnterosTimelineTileBuilder.connectedFromStyle(
              contentsAlign: AnterosContentsAlign.basic,
              oppositeContentsBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('opposite\ncontents'),
              ),
              contentsBuilder: (context, index) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Contents'),
                ),
              ),
              connectorStyleBuilder: (context, index) =>
                  AnterosConnectorStyle.solidLine,
              indicatorStyleBuilder: (context, index) =>
                  AnterosIndicatorStyle.dot,
              itemCount: 3,
            ),
          ),
        ),
      ),
      _ComponentRow(
        name: 'ContentsAlign.reverse',
        item: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnterosFixedTimelines.tileBuilder(
            builder: AnterosTimelineTileBuilder.connectedFromStyle(
              contentsAlign: AnterosContentsAlign.reverse,
              oppositeContentsBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('opposite\ncontents'),
              ),
              contentsBuilder: (context, index) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Contents'),
                ),
              ),
              connectorStyleBuilder: (context, index) =>
                  AnterosConnectorStyle.solidLine,
              indicatorStyleBuilder: (context, index) =>
                  AnterosIndicatorStyle.dot,
              itemCount: 3,
            ),
          ),
        ),
      ),
      _ComponentRow(
        name: 'ContentsAlign.alternating',
        item: AnterosFixedTimelines.tileBuilder(
          builder: AnterosTimelineTileBuilder.connectedFromStyle(
            contentsAlign: AnterosContentsAlign.alternating,
            oppositeContentsBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('opposite\ncontents'),
            ),
            contentsBuilder: (context, index) => Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Contents'),
              ),
            ),
            connectorStyleBuilder: (context, index) =>
                AnterosConnectorStyle.solidLine,
            indicatorStyleBuilder: (context, index) =>
                AnterosIndicatorStyle.dot,
            itemCount: 3,
          ),
        ),
      ),
      _ComponentRow(
        name: 'Horizontal\nTimeline',
        item: SizedBox(
          height: 150,
          child: AnterosTimelines.tileBuilder(
            // shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            builder: AnterosTimelineTileBuilder.fromStyle(
              contentsBuilder: (context, index) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Contents'),
                ),
              ),
              oppositeContentsBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('opposite\ncontents'),
              ),
              itemCount: 20,
            ),
          ),
        ),
      ),
      _ComponentRow(
        name: 'Styled node\nHorizontal\nTimeline',
        item: SizedBox(
          height: 150,
          child: AnterosTimelines.tileBuilder(
            // shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            builder: AnterosTimelineTileBuilder.fromStyle(
              contentsBuilder: (context, index) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Contents'),
                ),
              ),
              oppositeContentsBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('opposite\ncontents'),
              ),
              indicatorStyle: AnterosIndicatorStyle.outlined,
              connectorStyle: AnterosConnectorStyle.dashedLine,
              itemCount: 20,
            ),
          ),
        ),
      ),
      _ComponentRow(
        name: 'Reverse\nHorizontal\nTimeline',
        item: SizedBox(
          height: 150,
          child: AnterosTimelines.tileBuilder(
            // shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            builder: AnterosTimelineTileBuilder.fromStyle(
              contentsBuilder: (context, index) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Contents'),
                ),
              ),
              oppositeContentsBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('opposite\ncontents'),
              ),
              contentsAlign: AnterosContentsAlign.reverse,
              itemCount: 20,
            ),
          ),
        ),
      ),
      _ComponentRow(
        name: 'Alternating\nHorizontal\nTimeline',
        item: SizedBox(
          height: 150,
          child: AnterosTimelines.tileBuilder(
            // shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            builder: AnterosTimelineTileBuilder.fromStyle(
              contentsBuilder: (context, index) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Contents'),
                ),
              ),
              oppositeContentsBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('opposite\ncontents'),
              ),
              contentsAlign: AnterosContentsAlign.alternating,
              itemCount: 20,
            ),
          ),
        ),
      ),
      _ComponentRow(
        name: 'Vertical\nTimeline',
        item: SizedBox(
          height: 500,
          child: AnterosTimelines.tileBuilder(
            builder: AnterosTimelineTileBuilder.fromStyle(
              contentsBuilder: (context, index) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Contents'),
                ),
              ),
              oppositeContentsBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('opposite\ncontents'),
              ),
              contentsAlign: AnterosContentsAlign.alternating,
              indicatorStyle: AnterosIndicatorStyle.outlined,
              connectorStyle: AnterosConnectorStyle.dashedLine,
              itemCount: 10,
            ),
          ),
        ),
      ),
    ];

    return Scaffold(
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
            )),
        title: const Text(
          'Components',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Table(
          children: children,
          columnWidths: {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(0.3),
          },
        ),
      ),
    );
  }
}

class _ComponentRow extends TableRow {
  _ComponentRow({
    required String name,
    required Widget item,
  }) : super(
          children: [
            _ComponentName(name),
            _ComponentItem(child: item),
          ],
        );
}

class _ComponentItem extends StatelessWidget {
  const _ComponentItem({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 65.0,
      ),
      child: Center(
        child: child,
      ),
    );
  }
}

class _ComponentName extends StatelessWidget {
  const _ComponentName(
    this.name, {
    Key? key,
  })  : assert(name.length > 0),
        super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return _ComponentItem(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: FittedBox(
            child: Text(name),
          ),
        ),
      ),
    );
  }
}
