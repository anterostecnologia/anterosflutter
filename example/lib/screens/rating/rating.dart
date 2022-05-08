import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anterosflutter/anterosflutter.dart';

class RatingPage extends StatefulWidget {
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  final _ratingController = TextEditingController();
  final _customController = TextEditingController();
  double _userRating = 4.5;
  double _rating = 3;
  double _customrating = 2;
  double _iconRating = 2;
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
            color: AnterosColors.SUCCESS,
          ),
        ),
        title: const Text(
          'Rating',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 30, bottom: 10),
            child: AnterosTypography(
              text: 'Basic Rating',
              type: AnterosTypographyType.typo5,
              dividerWidth: 25,
              dividerColor: AnterosColors.PRIMARY,
            ),
          ),
          AnterosRating(
            color: AnterosColors.SUCCESS,
            borderColor: AnterosColors.SUCCESS,
            value: _rating,
            onChanged: (value) {
              setState(() {
                _rating = value;
              });
            },
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 30, bottom: 10),
            child: AnterosTypography(
              text: 'Rating with Icons',
              type: AnterosTypographyType.typo5,
              dividerWidth: 25,
              dividerColor: AnterosColors.PRIMARY,
            ),
          ),
          AnterosRating(
            color: AnterosColors.SUCCESS,
            borderColor: AnterosColors.SUCCESS,
            filledIcon: Icon(
              Icons.check,
              color: AnterosColors.DANGER,
            ),
            size: AnterosSize.SMALL,
            value: _iconRating,
            onChanged: (value) {
              setState(() {
                _iconRating = value;
              });
            },
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 30, bottom: 10),
            child: AnterosTypography(
              text: 'Rating using Text Field',
              type: AnterosTypographyType.typo5,
              dividerWidth: 25,
              dividerColor: AnterosColors.PRIMARY,
            ),
          ),
          AnterosRating(
            color: AnterosColors.SUCCESS,
            borderColor: AnterosColors.SUCCESS,
            value: _userRating,
            showTextForm: true,
            filledIcon: Icon(
              Icons.favorite,
              color: AnterosColors.DANGER,
            ),
            defaultIcon:
                Icon(Icons.favorite_border, color: AnterosColors.DANGER),
            size: AnterosSize.SMALL,
            halfFilledIcon: Icon(
              Icons.favorite,
              color: Colors.amber,
            ),
            allowHalfRating: true,
            controller: _ratingController,
            suffixIcon: AnterosButton(
              type: AnterosButtonType.transparent,
              onPressed: () {
                setState(() {
                  _userRating = double.parse(_ratingController.text);
                });
              },
              child: const Text('Rate'),
            ),
            onChanged: (double rating) {},
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 30, bottom: 10),
            child: AnterosTypography(
              text: 'Custom Rating',
              type: AnterosTypographyType.typo5,
              dividerWidth: 25,
              dividerColor: AnterosColors.PRIMARY,
            ),
          ),
          AnterosRating(
            color: AnterosColors.DANGER,
            borderColor: AnterosColors.DANGER,
            value: _customrating,
            showTextForm: true,
            halfFilledIcon: Icon(
              Icons.star_half,
            ),
            allowHalfRating: true,
            filledIcon: Icon(Icons.insert_emoticon),
            itemCount: 6,
            size: AnterosSize.SMALL,
            controller: _customController,
            suffixIcon: AnterosButton(
              type: AnterosButtonType.transparent,
              onPressed: () {
                setState(() {
                  _customrating = double.parse(_customController.text);
                });
              },
              child: Icon(Icons.insert_emoticon),
            ),
            onChanged: (double rating) {},
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ));
}
