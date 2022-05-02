import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../utils/app.dart';
import '../color_picker_dialog.dart';

@immutable
class DialogPickerColorIndicator extends ConsumerWidget {
  const DialogPickerColorIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: const Text(
          'Clique nesta cor para atualizá-la em uma caixa de diálogo'),
      subtitle: Text(
          // ignore: lines_longer_than_80_chars
          '${ColorTools.materialNameAndARGBCode(ref.watch(dialogPickerColorPod), colorSwatchNameMap: App.colorsNameMap)} '
          'aka ${ColorTools.nameThatColor(ref.watch(dialogPickerColorPod))}'),
      trailing: AnterosColorIndicator(
        height: ref.watch(sizePod),
        width: ref.watch(sizePod),
        borderRadius: ref.watch(borderRadiusPod),
        elevation: ref.watch(elevationPod),
        color: ref.watch(dialogPickerColorPod),
        hasBorder: ref.watch(hasBorderPod),
        onSelectFocus: false,
        onSelect: () async {
          final Color colorBeforeDialog =
              ref.read(dialogPickerColorPod.state).state;
          if (!(await colorPickerDialog(context, ref))) {
            ref.read(dialogPickerColorPod.state).state = colorBeforeDialog;
          }
        },
      ),
    );
  }
}
