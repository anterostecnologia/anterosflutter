import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../utils/theme.dart';
import '../widgets/maybe_tooltip.dart';
import './hex_color.dart';

@immutable
class OnChangedColorIndicator extends ConsumerWidget {
  const OnChangedColorIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Color background = ref.watch(onColorChangedPod);
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return MaybeTooltip(
      condition: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(onColorChanged: '
          '(Cor ${background.toHex()}) { ... } )',
      child: Chip(
        label: Text('Mudar ${background.toHex()}',
            style: TextStyle(
                color: AppTheme.getChipTextColor(background, isLight),
                fontSize: 12)),
        backgroundColor: background,
      ),
    );
  }
}
