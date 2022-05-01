import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../utils/theme.dart';
import '../widgets/maybe_tooltip.dart';
import './hex_color.dart';

@immutable
class OnStartColorIndicator extends ConsumerWidget {
  const OnStartColorIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Color background = ref.watch(onColorChangeStartPod);
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return MaybeTooltip(
      condition: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(onColorChangeStart: '
          '(Cor ${background.toHex()}) { ... } )',
      child: Chip(
        label: Text('Inicial ${ref.watch(onColorChangeStartPod).toHex()}',
            style: TextStyle(
                color: AppTheme.getChipTextColor(background, isLight),
                fontSize: 12)),
        backgroundColor: background,
      ),
    );
  }
}
