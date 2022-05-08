import 'package:anteros_flutter_app/screens/form/sources/signup_form.dart';
import 'package:anterosflutter/anterosflutter.dart';

import 'sources/custom_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'code_page.dart';
import 'sources/complete_form.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

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
              color: AnterosColors.PRIMARY,
            ),
          ),
        ),
        title: const Text(
          'Forms editors',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          completeForm(context),
          customFields(context),
          signupForm(context)
        ],
      ),
    );
  }

  GestureDetector signupForm(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => SignupForm(),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(7)),
              color: AnterosColors.DARK,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.40), blurRadius: 5)
              ]),
          child: AnterosListTile(
              color: AnterosColors.DARK,
              title: const Text(
                'Signup Form',
                style: TextStyle(color: AnterosColors.WHITE),
              ),
              icon: Icon(
                CupertinoIcons.forward,
                color: AnterosColors.PRIMARY,
              )),
        ));
  }

  GestureDetector customFields(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => CustomFields(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            color: AnterosColors.DARK,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.40), blurRadius: 5)
            ]),
        child: AnterosListTile(
          color: AnterosColors.DARK,
          title: const Text(
            'Custom fields',
            style: TextStyle(color: AnterosColors.WHITE),
          ),
          icon: Icon(
            CupertinoIcons.forward,
            color: AnterosColors.PRIMARY,
          ),
        ),
      ),
    );
  }

  GestureDetector completeForm(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => CompleteForm(),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(7)),
              color: AnterosColors.DARK,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.40), blurRadius: 5)
              ]),
          child: AnterosListTile(
              color: AnterosColors.DARK,
              title: const Text(
                'Complete form',
                style: TextStyle(color: AnterosColors.WHITE),
              ),
              icon: Icon(
                CupertinoIcons.forward,
                color: AnterosColors.PRIMARY,
              )),
        ));
  }
}
