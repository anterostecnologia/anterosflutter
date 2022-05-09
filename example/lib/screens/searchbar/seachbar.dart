import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';

class SearchbarPage extends StatefulWidget {
  @override
  _SearchbarPageState createState() => _SearchbarPageState();
}

class _SearchbarPageState extends State<SearchbarPage> {
  List list = [
    'Flutter',
    'React',
    'Ionic',
    'Xamarin',
    'Flutter2',
    'React2',
    'Ionic2',
    'Xamarin2',
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AnterosAppBar(
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
            'SearchBar',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: ListView(
          physics: const ScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30, bottom: 10),
              child: AnterosTypography(
                text: 'Basic SearchBar',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            AnterosSearchBar(
                searchList: list,
                searchQueryBuilder: (query, list) => list.where((item) {
                      return item!
                          .toString()
                          .toLowerCase()
                          .contains(query.toLowerCase());
                    }).toList(),
                overlaySearchListItemBuilder: (dynamic item) => Container(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                onItemSelected: (dynamic item) {
                  setState(() {
                    print('$item');
                  });
                }),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30, bottom: 10),
              child: AnterosTypography(
                text: 'Customised SearchBar',
                type: AnterosTypographyType.typo5,
                dividerWidth: 25,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            AnterosSearchBar(
                searchBoxInputDecoration: InputDecoration(
                  labelText: 'Type Here',
                  labelStyle: const TextStyle(color: Colors.black26),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.greenAccent),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black26,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(50)),
                ),
                searchList: list,
                searchQueryBuilder: (query, list) => list.where((item) {
                      return item!
                          .toString()
                          .toLowerCase()
                          .contains(query.toLowerCase());
                    }).toList(),
                overlaySearchListItemBuilder: (dynamic item) => Container(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                onItemSelected: (dynamic item) {
                  setState(() {
                    print('$item');
                  });
                }),
          ],
        ),
      );
}
