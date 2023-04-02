import 'package:anterosflutter/components/chat/src/models/chat_message.dart';
import 'package:anterosflutter/components/chat/src/utils/constants.dart';
import 'package:anterosflutter/components/form/validators/utils/validators.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:anterosflutter/components/extensions/anteros_extensions.dart';
import 'package:timeago/timeago.dart' as timeago;

/// this widget is used to render voice note container
/// with ist full functionality

class AnterosAudioMessage extends StatefulWidget {
  final AnterosChatMessageModel message;
  final Color senderColor;
  final Color inActiveAudioSliderColor;
  final Color activeAudioSliderColor;

  AnterosAudioMessage(
      {Key? key,
      required this.message,
      required this.senderColor,
      required this.inActiveAudioSliderColor,
      required this.activeAudioSliderColor})
      : super(key: key);

  @override
  _AnterosAudioMessageState createState() => _AnterosAudioMessageState();
}

class _AnterosAudioMessageState extends State<AnterosAudioMessage> {
  final player = AudioPlayer();
  Duration? duration = Duration.zero;
  Duration seekBarposition = Duration.zero;
  bool isPlaying = false;

  @override
  void initState() {
    setData();
    super.initState();
  }

  void setData() async {
    isURL(widget.message.content)
        ? duration = await player.setUrl(widget.message.content!)
        : duration = await player.setFilePath(widget.message.content!);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: widget.message.isSender!
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 0.75,
            vertical: kDefaultPadding / 2.5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: (widget.senderColor)
                .withOpacity(widget.message.isSender! ? 1 : 0.1),
          ),
          child: Row(
            /// mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  isPlaying ? player.pause() : play();
                  setState(() {
                    isPlaying = !isPlaying;
                  });
                },
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: widget.message.isSender!
                      ? Colors.white
                      : (widget.senderColor),
                  // size: 25,
                ),
              ),
              Expanded(
                child: Slider(
                    activeColor: widget.activeAudioSliderColor,
                    inactiveColor: widget.inActiveAudioSliderColor,
                    max: player.duration?.inMilliseconds.toDouble() ?? 1,
                    value: player.position.inMilliseconds.toDouble(),
                    onChanged: (d) {
                      setState(() {
                        player.seek(Duration(milliseconds: d.toInt()));
                      });
                    }),
              ),
              Text(
                _printDuration(player.position),
                style: TextStyle(
                    fontSize: 12,
                    color: widget.message.isSender! ? Colors.white : null),
              ),
            ],
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
            timeago.format(widget.message.createdAt ?? DateTime.now(),
                locale: 'pt_br'),
            style: TextStyle(fontSize: 10, color: Colors.black26),
          ),
        ),
      ],
    );
  }

  /// this function is used to play audio wither its from url or path file
  void play() {
    if (player.duration != null && player.position >= player.duration!) {
      player.seek(Duration.zero);
      setState(() {
        isPlaying = false;
      });
    }
    print(player.duration);
    print(player.position);
    player.play();

    player.positionStream.listen((duration) {
      // duration == player.duration;
      setState(() {
        seekBarposition = duration;
      });
      if (player.duration != null && player.position >= player.duration!) {
        player.stop();
        player.seek(Duration.zero);
        setState(() {
          isPlaying = false;
          seekBarposition = Duration.zero;
        });
      }
    });
  }

  /// function used to print the duration of the current audio duration
  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    String hoursString =
        duration.inHours == 0 ? '' : "${twoDigits(duration.inHours)}:";
    return "$hoursString$twoDigitMinutes:$twoDigitSeconds";
  }
}
