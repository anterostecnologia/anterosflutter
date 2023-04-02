import 'package:anterosflutter/components/chat/src/models/chat_message.dart';
import 'package:anterosflutter/components/chat/src/utils/constants.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

/// this widget is used to render a text message container

class AnterosTextMessage extends StatelessWidget {
  final AnterosChatMessageModel message;
  final Color senderColor;

  const AnterosTextMessage({
    Key? key,
    required this.message,
    required this.senderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          message.isSender! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Bubble(
          margin: BubbleEdges.only(top: 2),
          alignment: message.isSender! ? Alignment.topRight : Alignment.topLeft,
          nip: message.isSender! ? BubbleNip.rightTop : BubbleNip.leftTop,
          color: senderColor.withOpacity(message.isSender! ? 1 : 0.1),
          child: Text(
            message.text ?? '',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: message.isSender!
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: kDefaultPadding / 2,
            right: kDefaultPadding / 2,
          ),
          child: Text(
            timeago.format(message.createdAt ?? DateTime.now(),
                locale: 'pt_br'),
            style: TextStyle(fontSize: 10, color: Colors.black26),
          ),
        ),
      ],
    );
  }
}
