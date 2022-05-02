import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/maybe_tooltip.dart';

@immutable
class OpacityThumbRadiusSlider extends ConsumerWidget {
  const OpacityThumbRadiusSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaybeTooltip(
      condition: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(opacityThumbRadius: '
          '${ref.read(opacityThumbRadiusPod).floor().toString()})',
      child: ListTile(
        title:
            const Text('Raio do polegar do controle deslizante de opacidade'),
        subtitle: Slider.adaptive(
          min: 12,
          max: 30,
          divisions: 30 - 12,
          label: ref.read(opacityThumbRadiusPod).floor().toString(),
          value: ref.watch(opacityThumbRadiusPod),
          onChanged: (double value) =>
              ref.read(opacityThumbRadiusPod.state).state = value,
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
                ref.read(opacityThumbRadiusPod).floor().toString(),
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
