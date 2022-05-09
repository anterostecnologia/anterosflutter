import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AdvancedBadgesPage extends StatefulWidget {
  @override
  _AdvancedBadgesPageState createState() => _AdvancedBadgesPageState();
}

class _AdvancedBadgesPageState extends State<AdvancedBadgesPage> {
  int _counter = 0;
  bool showElevatedButtonBadge = true;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.back,
              color: Theme.of(context).primaryColor,
            ),
          ),
          backgroundColor: AnterosColors.DARK,
          title: const Text(
            'Advanced Badges',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            _addRemoveCartButtons(),
            _textBadge(),
            _directionalBadge(),
            _elevatedButtonBadge(),
            _chipWithZeroPadding(),
            expandedBadge(),
            _badgeWithZeroPadding(),
            _badgesWithBorder(),
            _listView(),
          ],
        ),
      );

  Widget expandedBadge() {
    return Expanded(
      child: Center(
        child: AnterosAdvancedBadge(
          badgeContent: Text('10'),
          child: Icon(Icons.person, size: 30),
        ),
      ),
    );
  }

  Widget _shoppingCartBadge() {
    return AnterosAdvancedBadge(
      position: AnterosAdvancedBadgePosition.topEnd(top: 0, end: 3),
      animationDuration: Duration(milliseconds: 300),
      animationType: AnterosAdvancedBadgeAnimationType.slide,
      badgeContent: Text(
        _counter.toString(),
        style: TextStyle(color: Colors.white),
      ),
      child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
    );
  }

  PreferredSizeWidget _tabBar() {
    return TabBar(tabs: [
      Tab(
        icon: AnterosAdvancedBadge(
          badgeColor: Colors.blue,
          badgeContent: Text(
            '3',
            style: TextStyle(color: Colors.white),
          ),
          child: Icon(Icons.account_balance_wallet, color: Colors.grey),
        ),
      ),
      Tab(
        icon: AnterosAdvancedBadge(
          shape: AnterosAdvancedBadgeShape.square,
          borderRadius: BorderRadius.circular(5),
          position: AnterosAdvancedBadgePosition.topEnd(top: -12, end: -20),
          padding: EdgeInsets.all(2),
          badgeContent: Text(
            'NEW',
            style: TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
          ),
          child: Text(
            'MUSIC',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
      ),
    ]);
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          label: 'Events',
          icon: Icon(Icons.event),
        ),
        BottomNavigationBarItem(
          label: 'Messages',
          icon: Icon(Icons.message),
        ),
        BottomNavigationBarItem(
          label: 'Settings',
          icon: AnterosAdvancedBadge(
            shape: AnterosAdvancedBadgeShape.circle,
            position: AnterosAdvancedBadgePosition.center(),
            borderRadius: BorderRadius.circular(100),
            child: Icon(Icons.settings),
            badgeContent: Container(
              height: 5,
              width: 5,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _addRemoveCartButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              icon: Icon(Icons.add),
              label: Text('Add to cart')),
          ElevatedButton.icon(
              onPressed: () {
                if (_counter > 0) {
                  setState(() {
                    _counter--;
                  });
                }
              },
              icon: Icon(Icons.remove),
              label: Text('Remove from cart')),
        ],
      ),
    );
  }

  Widget _textBadge() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: AnterosAdvancedBadge(
        padding: EdgeInsets.all(6),
        gradient: LinearGradient(colors: [
          Colors.black,
          Colors.red,
        ]),
        badgeContent: Text(
          '!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        position: AnterosAdvancedBadgePosition.topStart(top: -15),
        child: Text('This is a text'),
      ),
    );
  }

  Widget _elevatedButtonBadge() {
    return AnterosAdvancedBadge(
      showBadge: showElevatedButtonBadge,
      padding: EdgeInsets.all(8),
      badgeColor: Colors.deepPurple,
      badgeContent: Text(
        '!',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            showElevatedButtonBadge = !showElevatedButtonBadge;
          });
        },
        child: Text('Raised Button'),
      ),
    );
  }

  Widget _chipWithZeroPadding() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text('Chip with zero padding:'),
      Chip(
        label: Text('Hello'),
        padding: EdgeInsets.all(0),
      ),
    ]);
  }

  Widget _badgeWithZeroPadding() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Badges:'),
        for (int i = 0; i < 5; i++)
          _getExampleBadge(padding: (i * 2).toDouble())
      ],
    );
  }

  Widget _getExampleBadge({double? padding}) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: AnterosAdvancedBadge(
        badgeColor: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(20),
        padding: EdgeInsets.all(padding ?? 4),
        shape: AnterosAdvancedBadgeShape.square,
        badgeContent: Text(
          'Hello',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _badgesWithBorder() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Badges with borders:'),
          AnterosAdvancedBadge(
            position: AnterosAdvancedBadgePosition.topEnd(top: 0, end: 2),
            elevation: 0,
            shape: AnterosAdvancedBadgeShape.circle,
            badgeColor: Colors.red,
            borderSide: BorderSide(color: Colors.black),
            child: Icon(
              Icons.person,
              size: 30,
            ),
          ),
          AnterosAdvancedBadge(
            position: AnterosAdvancedBadgePosition.topEnd(top: -5, end: -5),
            shape: AnterosAdvancedBadgeShape.square,
            badgeColor: Colors.blue,
            badgeContent: SizedBox(
              height: 5,
              width: 5,
            ),
            elevation: 0,
            borderSide: BorderSide(
              color: Colors.black,
              width: 3,
            ),
            child: Icon(
              Icons.games_outlined,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listView() {
    Widget _listTile(String title, String value) {
      return ListTile(
        dense: true,
        title: Text(title, style: TextStyle(fontSize: 16)),
        trailing: SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              AnterosAdvancedBadge(
                elevation: 0,
                shape: AnterosAdvancedBadgeShape.circle,
                padding: EdgeInsets.all(7),
                badgeContent: Text(
                  value,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Expanded(
      child: ListView.separated(
        itemCount: 3,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return _listTile('Messages', '2');
            case 1:
              return _listTile('Friends', '7');
            case 2:
            default:
              return _listTile('Events', '!');
          }
        },
      ),
    );
  }

  Widget _directionalBadge() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: AnterosAdvancedBadge(
        elevation: 0,
        position: AnterosAdvancedBadgePosition.topEnd(),
        padding: EdgeInsetsDirectional.only(end: 4),
        badgeColor: Colors.transparent,
        badgeContent: Icon(Icons.error, size: 16.0, color: Colors.red),
        child: Text('This is RTL'),
      ),
    );
  }
}
