import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:intl/intl.dart';

class Element implements Comparable {
  DateTime date;
  String name;
  bool sender = false;

  Element(this.date, this.name, [this.sender = false]);

  @override
  int compareTo(other) {
    return date.compareTo(other.date);
  }
}

List<Element> _elements = [
  Element(DateTime(2020, 6, 24, 9, 25), 'Hello how are you?'),
  Element(DateTime(2020, 6, 24, 9, 36), 'Fine and what about you?', true),
  Element(DateTime(2020, 6, 24, 9, 39), 'I am fine too'),
  Element(DateTime(2020, 6, 25, 14, 12),
      'Hey you do you wanna go to the cinema?', true),
  Element(
      DateTime(2020, 6, 25, 14, 19), 'Yes of course when do we want to meet'),
  Element(DateTime(2020, 6, 25, 14, 20), 'Lets meet at 8 o clock', true),
  Element(DateTime(2020, 6, 25, 14, 25), 'Okay see you then :)'),
  Element(DateTime(2020, 6, 27, 18, 41),
      'Hey whats up? Can you help me real quick?'),
  Element(DateTime(2020, 6, 27, 18, 45), 'Of course  what do you need?', true),
  Element(DateTime(2020, 6, 28, 8, 47),
      'Can you send me the homework for tomorrow please?'),
  Element(
    DateTime(2020, 6, 28, 8, 48),
    'I dont understand the math questions :(',
  ),
  Element(DateTime(2020, 6, 28, 8, 56), 'Yeah sure I have send them per mail',
      true),
];

class GroupedListChat extends StatefulWidget {
  @override
  _GroupedListChatState createState() => _GroupedListChatState();
}

class _GroupedListChatState extends State<GroupedListChat>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
            'Grouped list chat',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: Builder(
          builder: (context) => Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: AnterosGroupedListView<Element, DateTime>(
                  elements: _elements,
                  order: AnterosGroupedListOrder.DESC,
                  reverse: true,
                  floatingHeader: true,
                  useStickyGroupSeparators: true,
                  groupBy: (Element element) => DateTime(
                      element.date.year, element.date.month, element.date.day),
                  groupHeaderBuilder: (Element element) => Container(
                    height: 40,
                    child: Align(
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${DateFormat.yMMMd().format(element.date)}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  itemBuilder: (_, Element element) {
                    return Align(
                      alignment: element.sender
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          elevation: 8.0,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            leading: element.sender
                                ? Text(DateFormat.Hm().format(element.date))
                                : const Icon(Icons.person),
                            title: Text(element.name),
                            trailing: element.sender
                                ? const Icon(Icons.person_outline)
                                : Text(DateFormat.Hm().format(element.date)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
}