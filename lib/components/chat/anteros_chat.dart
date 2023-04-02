import 'dart:developer';
import 'package:anterosflutter/components/chat/src/enums/chat_message_type.dart';
import 'package:anterosflutter/components/chat/src/models/chat_message.dart';
import 'package:anterosflutter/components/chat/src/utils/constants.dart';
import 'package:anterosflutter/components/chat/src/views/components/chat_input_field.dart';
import 'package:anterosflutter/components/chat/src/views/components/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timeago/timeago.dart' as timeago;

class AnterosChatScreen extends StatefulWidget {
  ///color of all message containers if its belongs to the user
  final Color? senderColor;

  ///color of the inactive part of the audio slider
  final Color? inActiveAudioSliderColor;

  ///color of the active part of the audio slider
  final Color? activeAudioSliderColor;

  ///scrollcontroller for the chat screen
  final ScrollController? scrollController;

  /// the color of the outer container and the color used to hide
  /// the text on slide
  final Color containerColor;

  /// Cor do refresh indicator
  final Color colorIndicator;

  ///hint text to be shown for sending messages
  final String sendMessageHintText;

  /// texts shown wen trying to chose image attachment
  final String imageAttachmentFromGalary;
  final String imageAttachmentFromCamery;
  final String imageAttachmentCancelText;
  final Color imageAttachmentTextColor;

  ///hint text to be shown for recording voice note
  final String recordinNoteHintText;

  /// handel [text message] on submit
  final Function(String? text)? onSubmit;

  final bool loading;

  /// [required] the list of chat messages
  final List<AnterosChatMessageModel> messages;

  /// function to handel sucessful recordings, bass to override
  final Function(String? path, bool canceled)? handleRecord;

  /// function to handel image selection
  final Function(XFile)? handleImageSelect;

  /// to handel canceling of the record
  final VoidCallback? onSlideToCancelRecord;

  ///TextEditingController to handel input text
  final TextEditingController? textEditingController;

  /// use this flag to disable the input
  final bool disableInput;

  AnterosChatScreen({
    Key? key,
    this.senderColor,
    this.inActiveAudioSliderColor,
    this.activeAudioSliderColor,
    required this.messages,
    this.scrollController,
    this.loading = false,
    this.sendMessageHintText = 'Mensagem',
    this.recordinNoteHintText = 'Gravando',
    this.imageAttachmentFromGalary = 'Galeria imagens',
    this.imageAttachmentFromCamery = 'Câmera',
    this.imageAttachmentCancelText = 'Cancela',
    this.containerColor = const Color(0xFFCFD8DC),
    this.colorIndicator = Colors.blue,
    this.imageAttachmentTextColor = const Color(0xFF255965),
    this.handleRecord,
    this.handleImageSelect,
    this.onSlideToCancelRecord,
    this.textEditingController,
    this.disableInput = false,
    this.onSubmit,
  }) : super(key: key);

  @override
  _AnterosChatScreenState createState() => _AnterosChatScreenState();
}

class _AnterosChatScreenState extends State<AnterosChatScreen> {
  var _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('pt_br', timeago.PtBrMessages());

    return Column(
      children: [
        widget.loading
            ? CircularProgressIndicator(color: widget.colorIndicator)
            : SizedBox(),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            controller: widget.scrollController ?? _controller,
            itemCount: widget.messages.length,
            itemBuilder: (context, index) => AnterosMessage(
              message: widget.messages[index],
              activeAudioSliderColor:
                  widget.activeAudioSliderColor ?? kSecondaryColor,
              inActiveAudioSliderColor:
                  widget.inActiveAudioSliderColor ?? kLightColor,
              senderColor: widget.senderColor ?? kPrimaryColor,
            ),
          ),
        ),
        KeyboardVisibilityProvider(
          child: AnterosChatInputField(
            imageAttachmentCancelText: widget.imageAttachmentCancelText,
            imageAttachmentFromCamery: widget.imageAttachmentFromCamery,
            imageAttachmentFromGalary: widget.imageAttachmentFromGalary,
            imageAttachmentTextColor: widget.imageAttachmentTextColor,
            containerColor: widget.containerColor,
            recordinNoteHintText: widget.recordinNoteHintText,
            sendMessageHintText: widget.sendMessageHintText,
            disableInput: widget.disableInput,
            handleRecord: widget.handleRecord ??
                (source, canceled) {
                  if (!canceled && source != null) {
                    setState(() {
                      widget.messages.add(AnterosChatMessageModel(
                          isSender: true,
                          content: source,
                          isLoading: false,
                          messageType: ChatMessageType.AudioMessage));
                      widget.scrollController?.jumpTo(
                          widget.scrollController!.position.maxScrollExtent +
                              90);
                    });
                  }
                },
            handleImageSelect: widget.handleImageSelect ??
                (file) async {
                  setState(() {
                    widget.messages.add(AnterosChatMessageModel(
                        isSender: true,
                        content: file.path,
                        isLoading: false,
                        messageType: ChatMessageType.TextMessage));
                  });

                  setState(() {
                    widget.scrollController?.jumpTo(
                        widget.scrollController!.position.maxScrollExtent +
                            300);
                  });
                },
            onSlideToCancelRecord: widget.onSlideToCancelRecord ??
                () {
                  log('slide to cancel');
                },
            onSubmit: (text) {
              if (widget.onSubmit != null) {
                widget.onSubmit!(text);
              } else {
                if (text != null && text.length > 0) {
                  setState(() {
                    widget.messages.add(AnterosChatMessageModel(
                        isSender: true,
                        text: text,
                        isLoading: false,
                        messageType: ChatMessageType.TextMessage));

                    widget.scrollController?.jumpTo(
                        widget.scrollController!.position.maxScrollExtent + 50);
                  });
                }
              }
            },
            textController:
                widget.textEditingController ?? TextEditingController(),
          ),
        ),
      ],
    );
  }
}
