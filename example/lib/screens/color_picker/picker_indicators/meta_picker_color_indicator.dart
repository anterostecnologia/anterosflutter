import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../color_picker_dialog.dart';

@immutable
class MetaPickerColorIndicator extends ConsumerWidget {
  const MetaPickerColorIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: const Text('Controle o ColorPicker abaixo'),
      subtitle: Wrap(
        runSpacing: 4,
        spacing: 4,
        children: const <Widget>[
          ColorControlBox(color: Color(0xFF43A047)),
          ColorControlBox(color: Color(0xCAFF5252)),
          ColorControlBox(color: Color(0xFFF7F7F7)),
          ColorControlBox(color: Color(0xF04F75B8)),
          ColorControlBox(color: Color(0xA8E86600)),
          ColorControlBox(color: Color(0xFFFF5319)),
          ColorControlBox(color: Color(0xFF7D2079)),
        ],
      ),
      trailing: AnterosColorIndicator(
        height: ref.watch(sizePod),
        width: ref.watch(sizePod),
        borderRadius: ref.watch(borderRadiusPod),
        elevation: ref.watch(elevationPod),
        color: ref.watch(cardPickerColorPod),
        hasBorder: ref.watch(hasBorderPod),
        onSelectFocus: false,
        onSelect: () async {
          final Color colorBeforeDialog = ref.read(cardPickerColorPod);
          if (!(await colorPickerDialog(
            context,
            ref,
            cardRemote: true,
          ))) {
            ref.read(cardPickerColorPod.state).state = colorBeforeDialog;
          }
        },
      ),
    );
  }
}

class ColorControlBox extends ConsumerWidget {
  const ColorControlBox({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnterosColorIndicator(
      height: ref.watch(sizePod) * 0.8,
      width: ref.watch(sizePod) * 0.8,
      borderRadius: ref.watch(borderRadiusPod) * 0.8,
      elevation: ref.watch(elevationPod),
      color: ref.watch(enableOpacityPod) ? color : color.withAlpha(0xFF),
      hasBorder: ref.watch(hasBorderPod),
      onSelectFocus: false,
      isSelected: ref.watch(cardPickerColorPod) == color,
      onSelect: () {
        ref.read(cardPickerColorPod.state).state = color;
      },
    );
  }
}