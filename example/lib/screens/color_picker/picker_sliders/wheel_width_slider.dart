import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/maybe_tooltip.dart';

@immutable
class WheelWidthSlider extends ConsumerWidget {
  const WheelWidthSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaybeTooltip(
      condition: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(wheelWidth: '
          '${ref.read(wheelWidthPod).floor().toString()})',
      child: ListTile(
        title: const Text('Largura do círculo de matiz da roda de cores'),
        subtitle: Slider.adaptive(
          min: 4,
          max: 50,
          divisions: 50 - 4,
          label: ref.read(wheelWidthPod).floor().toString(),
          value: ref.watch(wheelWidthPod),
          onChanged: (double value) =>
              ref.read(wheelWidthPod.state).state = value,
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
                ref.read(wheelWidthPod).floor().toString(),
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
