import 'package:flutter/material.dart';

/// Default widget for empty choices list
class AnterosChoicesEmpty extends StatelessWidget {
  /// Default constructor
  const AnterosChoicesEmpty();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.search,
              color: Colors.grey,
              size: 120.0,
            ),
            const SizedBox(height: 25),
            const Text(
              'Whoops, no matches',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 7),
            const Text(
              "We couldn't find any search result",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 7),
            const Text(
              "Give it another go",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
