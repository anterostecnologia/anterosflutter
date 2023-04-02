import 'package:anterosflutter/components/chat/src/enums/chat_message_type.dart';
import 'package:anterosflutter/components/chat/src/models/chat_message.dart';
import 'package:anterosflutter/components/chat/src/utils/constants.dart';
import 'package:anterosflutter/components/chat/src/views/components/audio_message_widget.dart';
import 'package:anterosflutter/components/chat/src/views/components/image_message_widget.dart';
import 'package:anterosflutter/components/chat/src/views/components/text_message_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math';

/// widet used to detairmen the right message type
class AnterosMessage extends StatelessWidget {
  final Color senderColor;
  final Color inActiveAudioSliderColor;
  final Color activeAudioSliderColor;

  const AnterosMessage({
    Key? key,
    required this.message,
    required this.senderColor,
    required this.inActiveAudioSliderColor,
    required this.activeAudioSliderColor,
  }) : super(key: key);

  final AnterosChatMessageModel message;

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(AnterosChatMessageModel message) {
      /// check message type and render the right widget
      switch (message.getType()) {
        case ChatMessageType.TextMessage:

          /// render text messag
          return AnterosTextMessage(
            message: message,
            senderColor: senderColor,
          );
        case ChatMessageType.AudioMessage:

          /// render audion messag
          return AnterosAudioMessage(
            message: message,
            senderColor: senderColor,
            activeAudioSliderColor: activeAudioSliderColor,
            inActiveAudioSliderColor: inActiveAudioSliderColor,
          );
        case ChatMessageType.ImageMessage:

          /// render image messag
          return AnterosImageMessage(
            message: message,
            senderColor: senderColor,
          );
        default:
          return SizedBox();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Align(
        alignment:
            message.isSender! ? Alignment.centerRight : Alignment.centerLeft,

        /// check message type and render the right widget
        child: (message.isLoading == false)
            ? messageContaint(message)
            : TypingIndicator(
                bubbleColor:
                    senderColor.withOpacity(message.isSender! ? 1 : 0.1),
              ),
      ),
    );
  }
}

class TypingIndicator extends StatefulWidget {
  const TypingIndicator({
    Key? key,
    this.showIndicator = true,
    this.bubbleColor = const Color(0xFFf1d18a),
    this.flashingCircleDarkColor = const Color(0xFF333333),
    this.flashingCircleBrightColor = const Color(0xFFaec1dd),
  }) : super(key: key);

  final bool showIndicator;
  final Color bubbleColor;
  final Color flashingCircleDarkColor;
  final Color flashingCircleBrightColor;

  @override
  _TypingIndicatorState createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with TickerProviderStateMixin {
  late AnimationController _appearanceController;

  late Animation<double> _indicatorSpaceAnimation;

  late Animation<double> _smallBubbleAnimation;
  late Animation<double> _mediumBubbleAnimation;
  late Animation<double> _largeBubbleAnimation;

  late AnimationController _repeatingController;
  final List<Interval> _dotIntervals = const [
    Interval(0.25, 0.8),
    Interval(0.35, 0.9),
    Interval(0.45, 1.0),
  ];

  @override
  void initState() {
    super.initState();

    _appearanceController = AnimationController(
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    _indicatorSpaceAnimation = CurvedAnimation(
      parent: _appearanceController,
      curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      reverseCurve: const Interval(0.0, 1.0, curve: Curves.easeOut),
    ).drive(Tween<double>(
      begin: 0.0,
      end: 50.0,
    ));

    _smallBubbleAnimation = CurvedAnimation(
      parent: _appearanceController,
      curve: const Interval(0.0, 0.2, curve: Curves.elasticOut),
      reverseCurve: const Interval(0.0, 0.3, curve: Curves.easeOut),
    );
    _mediumBubbleAnimation = CurvedAnimation(
      parent: _appearanceController,
      curve: const Interval(0.2, 0.7, curve: Curves.elasticOut),
      reverseCurve: const Interval(0.2, 0.6, curve: Curves.easeOut),
    );
    _largeBubbleAnimation = CurvedAnimation(
      parent: _appearanceController,
      curve: const Interval(0.3, 1.0, curve: Curves.elasticOut),
      reverseCurve: const Interval(0.5, 1.0, curve: Curves.easeOut),
    );

    _repeatingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    if (widget.showIndicator) {
      _showIndicator();
    }
  }

  @override
  void didUpdateWidget(TypingIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.showIndicator != oldWidget.showIndicator) {
      if (widget.showIndicator) {
        _showIndicator();
      } else {
        _hideIndicator();
      }
    }
  }

  @override
  void dispose() {
    _appearanceController.dispose();
    _repeatingController.dispose();
    super.dispose();
  }

  void _showIndicator() {
    _appearanceController
      ..duration = const Duration(milliseconds: 750)
      ..forward();
    _repeatingController.repeat();
  }

  void _hideIndicator() {
    _appearanceController
      ..duration = const Duration(milliseconds: 150)
      ..reverse();
    _repeatingController.stop();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _indicatorSpaceAnimation,
      builder: (context, child) {
        return SizedBox(
          height: _indicatorSpaceAnimation.value,
          child: child,
        );
      },
      child: _buildAnimatedBubble(
        animation: _smallBubbleAnimation,
        left: 0,
        bottom: 0,
        bubble: _buildStatusBubble(),
      ),
    );
  }

  Widget _buildAnimatedBubble({
    required Animation<double> animation,
    required double left,
    required double bottom,
    required Widget bubble,
  }) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.scale(
          scale: animation.value,
          alignment: Alignment.bottomLeft,
          child: child,
        );
      },
      child: bubble,
    );
  }

  Widget _buildCircleBubble(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.bubbleColor,
      ),
    );
  }

  Widget _buildStatusBubble() {
    return Container(
      width: 85,
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27),
        color: widget.bubbleColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildFlashingCircle(0),
          _buildFlashingCircle(1),
          _buildFlashingCircle(2),
        ],
      ),
    );
  }

  Widget _buildFlashingCircle(int index) {
    return AnimatedBuilder(
      animation: _repeatingController,
      builder: (context, child) {
        final circleFlashPercent =
            _dotIntervals[index].transform(_repeatingController.value);
        final circleColorPercent = sin(pi * circleFlashPercent);

        return Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.lerp(widget.flashingCircleDarkColor,
                widget.flashingCircleBrightColor, circleColorPercent),
          ),
        );
      },
    );
  }
}
