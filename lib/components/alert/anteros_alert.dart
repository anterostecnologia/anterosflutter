import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class AnterosAlert extends StatefulWidget {
  /// Alert has to be wrap inside the body like [AnterosFloatingWidget]. See [AnterosFloatingWidget]
  const AnterosAlert(
      {Key? key,
      this.content,
      this.title,
      this.child,
      this.backgroundColor,
      this.width,
      this.type = AnterosAlertType.basic,
      this.alignment,
      this.contentChild,
      this.bottombar,
      this.contentTextStyle = const TextStyle(color: Colors.black87),
      this.titleTextStyle = const TextStyle(
        color: Colors.black87,
        fontSize: 17,
        fontWeight: FontWeight.w500,
      )})
      : super(key: key);

  /// child of  type [Widget]is alternative to title key. title will get priority over child
  final Widget? child;

  /// title of type [String] used to describe the title of the [AnterosAlert]
  final String? title;

  /// child of  type [Widget]is alternative to title key. title will get priority over contentchild
  final Widget? contentChild;

  /// title of type [String] used to describe the content of the [AnterosAlert]
  final String? content;

  ///type of [TextStyle] to change the style of the title not for the child
  final TextStyle titleTextStyle;

  ///pass color of type [Color] or [AnterosColors] for background of [AnterosAlert]
  final Color? backgroundColor;

  ///type of [TextStyle] to change the style of the content not for the contentchild
  final TextStyle contentTextStyle;

  /// width of type [double] used to control the width of the [AnterosAlert]
  final double? width;

  ///type of [AnterosAlertType] which takes the type ie, basic, rounded and fullWidth for the [AnterosAlert]
  final AnterosAlertType type;

  /// type of [Alignment] used to align the text inside the [AnterosAlert]
  final Alignment? alignment;

  ///type of [Widget] used for the buttons ie, OK, Cancel for the action in [AnterosAlert]
  final Widget? bottombar;

  @override
  _AnterosAlertState createState() => _AnterosAlertState();
}

class _AnterosAlertState extends State<AnterosAlert>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    );
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
        opacity: animation,
        child: Column(
          children: <Widget>[
            Container(
              width: widget.type == AnterosAlertType.fullWidth
                  ? MediaQuery.of(context).size.width
                  : widget.width ?? MediaQuery.of(context).size.width * 0.885,
              constraints: const BoxConstraints(minHeight: 50),
              margin: widget.type == AnterosAlertType.fullWidth
                  ? const EdgeInsets.only(left: 0, right: 0)
                  : const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: widget.type == AnterosAlertType.basic
                      ? BorderRadius.circular(3)
                      : widget.type == AnterosAlertType.rounded
                          ? BorderRadius.circular(10)
                          : BorderRadius.zero,
                  color: widget.backgroundColor != null
                      ? widget.backgroundColor
                      : AnterosColors.WHITE,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.10), blurRadius: 2)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: widget.alignment ?? Alignment.topLeft,
                    child: widget.title != null
                        ? Text(widget.title!, style: widget.titleTextStyle)
                        : (widget.child ?? Container()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: widget.alignment ?? Alignment.topLeft,
                    child: widget.content != null
                        ? Text(widget.content!, style: widget.contentTextStyle)
                        : (widget.contentChild ?? Container()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  widget.bottombar ?? Container(),
                ],
              ),
            ),
          ],
        ),
      );
}
