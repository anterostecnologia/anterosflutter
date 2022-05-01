import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class SnackbarParseErrorSwitch extends ConsumerWidget {
  const SnackbarParseErrorSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title: const Text('Mensagem de erro de formato de pasta de snackbar'),
      value: ref.watch(snackbarParseErrorPod),
      onChanged: (bool value) =>
          ref.read(snackbarParseErrorPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(copyPasteBehavior:\n'
          '  ColorPickerCopyPasteBehavior(snackBarParseError: '
          '${ref.read(snackbarParseErrorPod)}))',
    );
  }
}
