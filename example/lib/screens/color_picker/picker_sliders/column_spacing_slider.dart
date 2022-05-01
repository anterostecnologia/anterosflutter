import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/maybe_tooltip.dart';

@immutable
class ColumnSpacingSlider extends ConsumerWidget {
  const ColumnSpacingSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaybeTooltip(
      condition: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(columnSpacing: '
          '${ref.read(columnSpacingPod).floor().toString()})',
      child: ListTile(
        title: const Text('Espaçamento vertical entre itens'),
        subtitle: Slider.adaptive(
          max: 40,
          divisions: 40,
          label: ref.read(columnSpacingPod).floor().toString(),
          value: ref.watch(columnSpacingPod),
          onChanged: (double value) =>
              ref.read(columnSpacingPod.state).state = value,
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              const Text(
                'dp',
                style: TextStyle(fontSize: 11),
              ),
              Text(
                ref.read(columnSpacingPod).floor().toString(),
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
