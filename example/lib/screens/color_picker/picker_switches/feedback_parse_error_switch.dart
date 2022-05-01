import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/switch_tile_tooltip.dart';

@immutable
class FeedbackParseErrorSwitch extends ConsumerWidget {
  const FeedbackParseErrorSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchTileTooltip(
      title:
          const Text('Vibração de feedback e alerta de erro de pasta audível'),
      subtitle: const Text('Esse recurso é experimental. Seu suporte '
          'é limitado na maioria das plataformas no Flutter SDK atual.'),
      value: ref.watch(feedbackParseErrorPod),
      onChanged: (bool value) =>
          ref.read(feedbackParseErrorPod.state).state = value,
      tooltipEnabled: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(copyPasteBehavior:\n'
          '  ColorPickerCopyPasteBehavior(\n'
          '    feedbackParseError: '
          '${ref.read(feedbackParseErrorPod)}))',
    );
  }
}
