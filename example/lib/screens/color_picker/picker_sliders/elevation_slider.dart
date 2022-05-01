import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/maybe_tooltip.dart';

@immutable
class ElevationSlider extends ConsumerWidget {
  const ElevationSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaybeTooltip(
      condition: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(elevation: '
          '${ref.read(elevationPod).floor().toString()})',
      child: ListTile(
        title: const Text('Elevação do item do seletor de cores'),
        subtitle: Slider.adaptive(
          max: 16,
          divisions: 16,
          label: ref.read(elevationPod).floor().toString(),
          value: ref.watch(elevationPod),
          onChanged: (double value) =>
              ref.read(elevationPod.state).state = value,
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
                ref.read(elevationPod).floor().toString(),
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
