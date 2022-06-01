import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalKeysPage extends StatelessWidget {
  const GlobalKeysPage({Key? key}) : super(key: key);

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
          'Global keys Example',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserWidget(user: User('Bob')),
            UserWidget(user: User('Alice')),
            UserWidget(user: User('Marcelo')),
            const Divider(color: Colors.black),
            toggleUser(User('Bob')),
            toggleUser(User('Alice')),
            toggleUser(User('Marcelo')),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget toggleUser(User user) => ElevatedButton(
        onPressed: () => UserWidget.toggleSelected(user),
        child: Text('Toggle $user'),
      );
}

///////////////////////////////////////////////////////////////////////////////

class UserWidget extends StatefulWidget {
  final User user;

  static UserWidgetState? currentState(User user) =>
      GlobalValueKey<UserWidgetState>(user).currentState;

  static void toggleSelected(User user) => currentState(user)?.toggleSelected();

  UserWidget({required this.user})
      : super(key: GlobalValueKey<UserWidgetState>(user));

  @override
  State<UserWidget> createState() => UserWidgetState();
}

class UserWidgetState extends State<UserWidget> {
  bool _selected = false;

  void toggleSelected() {
    setState(() {
      _selected = !_selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: _selected ? Colors.red : Colors.white,
        width: 120,
        height: 50,
        margin: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            widget.user.toString(),
            style: TextStyle(
                color: _selected ? Colors.white : Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ));
  }
}

///////////////////////////////////////////////////////////////////////////////

class User {
  final String name;

  User(this.name);

  @override
  String toString() => name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}

///////////////////////////////////////////////////////////////////////////////
