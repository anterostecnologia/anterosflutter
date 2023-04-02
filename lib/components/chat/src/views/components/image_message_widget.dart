import 'dart:io';

import 'package:anterosflutter/components/chat/src/models/chat_message.dart';
import 'package:anterosflutter/components/chat/src/utils/constants.dart';
import 'package:anterosflutter/components/chat/src/views/screens/photo_gallery_view.dart';
import 'package:anterosflutter/components/form/validators/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:timeago/timeago.dart' as timeago;

class AnterosImageMessage extends StatelessWidget {
  /// chat message model to get teh data
  final AnterosChatMessageModel message;

  ///the color of the sender container
  final Color senderColor;

  const AnterosImageMessage(
      {Key? key, required this.message, required this.senderColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          message.isSender! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            /// navigate to to the photo galary view, for viewing the taped image
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => PhotoGalleryView(
                  chatMessage: message,
                ),
              ),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: senderColor.withOpacity(message.isSender! ? 1 : 0.1),
            ),

            /// 45% of total width
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: isURL(message.content)
                    ? FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: message.content!,
                        fit: BoxFit.cover,
                      )
                    : Image.file(File(message.content!)),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Padding(
          padding: EdgeInsets.only(
            // top: 2,
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
