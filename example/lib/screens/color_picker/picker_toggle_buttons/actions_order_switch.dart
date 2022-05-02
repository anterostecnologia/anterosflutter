import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pods/pods.dart';
import '../widgets/maybe_tooltip.dart';

class ActionsOrderSwitch extends ConsumerWidget {
  const ActionsOrderSwitch({Key? key}) : super(key: key);
  static const double _kToggleFontSize = 11.5;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorPickerActionButtonOrder order = ref.watch(dialogActionsOrderPod);
    final List<bool> isSelected = <bool>[
      order == ColorPickerActionButtonOrder.okIsLeft,
      order == ColorPickerActionButtonOrder.adaptive,
      order == ColorPickerActionButtonOrder.okIsRight,
    ];
    return MaybeTooltip(
      condition: ref.watch(enableTooltipsPod),
      tooltip: 'ColorPicker(actionButtons:\n'
          '  ColorPickerActionButtons(dialogActionOrder: '
          '$order))',
      child: ListTile(
        title: const Text('Ordem dos botões de ação da caixa de diálogo'),
        subtitle: const Text('Selecione o posicionamento do botão OK'),
        trailing: ToggleButtons(
          isSelected: isSelected,
          onPressed: (int newIndex) {
            if (newIndex == 0) {
              ref.read(dialogActionsOrderPod.state).state =
                  ColorPickerActionButtonOrder.okIsLeft;
            } else if (newIndex == 1) {
              ref.read(dialogActionsOrderPod.state).state =
                  ColorPickerActionButtonOrder.adaptive;
            } else {
              ref.read(dialogActionsOrderPod.state).state =
                  ColorPickerActionButtonOrder.okIsRight;
            }
          },
          children: const <Widget>[
            Text('Esquerda', style: TextStyle(fontSize: _kToggleFontSize)),
            Text(' Platforma ', style: TextStyle(fontSize: _kToggleFontSize)),
            Text('Direita', style: TextStyle(fontSize: _kToggleFontSize)),
          ],
        ),
      ),
    );
  }
}
