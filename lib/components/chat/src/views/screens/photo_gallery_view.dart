import 'dart:io';

import 'package:anterosflutter/components/chat/src/models/chat_message.dart';
import 'package:anterosflutter/components/form/validators/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

/// this widget is used for viewing the image in full size
class PhotoGalleryView extends StatefulWidget {
  final AnterosChatMessageModel chatMessage;

  const PhotoGalleryView({
    Key? key,
    required this.chatMessage,
  }) : super(key: key);
  @override
  _PhotoGalleryViewState createState() => _PhotoGalleryViewState();
}

class _PhotoGalleryViewState extends State<PhotoGalleryView> {
  late ImageProvider imageProvider;
  @override
  void initState() {
    super.initState();

    /// check if url is provided or a path to a file
    if (isURL(widget.chatMessage.content)) {
      imageProvider = NetworkImage(widget.chatMessage.content!);
    } else {
      imageProvider = FileImage(File(widget.chatMessage.content!));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: Stack(
        children: [
          PhotoView(
            heroAttributes: PhotoViewHeroAttributes(
              tag: 'photo_gallery_hero',
            ),
            loadingBuilder: (context, event) => Center(
              child: Container(
                width: 20.0,
                height: 20.0,
                child: CircularProgressIndicator(
                  value: event == null
                      ? 0
                      : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
                ),
              ),
            ),
            imageProvider: imageProvider,
          ),
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).padding.top + 16,
                horizontal: size.width / 18,
              ),
              child: Container(
                /// icon to cancel and returne to the previous view
                child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 30,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
