import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/maybe_tooltip.dart';

@immutable
class WheelSquarePaddingSlider extends ConsumerWidget {
  const WheelSquarePaddingSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaybeTooltip(
      condition: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(wheelSquarePadding: '
          '${ref.read(wheelSquarePaddingPod).floor().toString()})',
      child: ListTile(
        title: const Text('Preenchimento quadrado da sombra da roda de cores'),
        subtitle: Slider.adaptive(
          min: 0,
          max: 20,
          divisions: 20,
          label: ref.read(wheelSquarePaddingPod).floor().toString(),
          value: ref.watch(wheelSquarePaddingPod),
          onChanged: (double value) =>
              ref.read(wheelSquarePaddingPod.state).state = value,
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
                ref.read(wheelSquarePaddingPod).floor().toString(),
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
