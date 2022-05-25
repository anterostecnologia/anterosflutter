export 'package:flutter/material.dart' show Divider;

// import 'package:flutter/material.dart';

// /// Default divider widget
// class AnterosDivider extends StatelessWidget {

//   /// Divider color
//   final Color color;

//   /// Divider thickness
//   final double thickness;

//   /// Divider spacing
//   final double spacing;

//   /// Default constructor
//   const AnterosDivider({
//     Key? key,
//     this.color,
//     this.thickness,
//     this.spacing,
//   }) : super(key: key);

//   /// Default color of the divider widget
//   static const Color defaultColor = const Color(0xFFEEEEEE);

//   /// Default spacing of the divider widget
//   static const double defaultSpacing = 4.0;

//   /// Default thickness of the divider widget
//   static const double defaultThickness = 0.5;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//         vertical: spacing ?? AnterosDivider.defaultSpacing
//       ),
//       child: SizedBox(
//         height: thickness ?? AnterosDivider.defaultThickness,
//         child: DecoratedBox(
//           decoration: BoxDecoration(
//             border: Border(
//               bottom: BorderSide(
//                 color: color ?? Theme.of(context).dividerColor,
//                 width: thickness ?? AnterosDivider.defaultThickness,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
