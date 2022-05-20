import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlassKitContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          ),
        ),
        title: const Text(
          'Glasskit Containers',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black87,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/bg_1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: AnterosGlassContainer(
            height: 200,
            width: 350,
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.40),
                Colors.white.withOpacity(0.10),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderGradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.60),
                Colors.white.withOpacity(0.10),
                Colors.purpleAccent.withOpacity(0.05),
                Colors.purpleAccent.withOpacity(0.60),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 0.39, 0.40, 1.0],
            ),
            blur: 20,
            borderRadius: BorderRadius.circular(24.0),
            borderWidth: 1.0,
            elevation: 3.0,
            isFrostedGlass: true,
            shadowColor: Colors.purple.withOpacity(0.20),
          ),
        ),
      ),
    );
  }
}
