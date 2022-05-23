import 'package:anterosflutter/components/dialogs/anteros_dialog.dart';
import 'package:flutter/material.dart';

class AnterosRadioListTileDialog extends StatefulWidget {
  AnterosRadioListTileDialog({
    Key? key,
    this.items,
    this.intialValue,
    this.color,
    this.activeColor,
    this.onChanged,
  })  : assert(items != null),
        super(key: key);

  final List<RadioItem>? items;
  final Color? color;
  final Color? activeColor;
  final intialValue;
  final Function(int)? onChanged;

  @override
  State<StatefulWidget> createState() {
    return AnterosRadioListTileDialogState();
  }
}

class AnterosRadioListTileDialogState
    extends State<AnterosRadioListTileDialog> {
  var groupId = -1;

  void intialSelectedItem() {
    //intialValue:
    // O botão inicializa a posição.
    // Se não estiver preenchido, não será selecionado.
    if (groupId == -1) {
      groupId = widget.intialValue ?? -1;
    }
  }

  @override
  Widget build(BuildContext context) {
    intialSelectedItem();

    return ListView.builder(
      padding: const EdgeInsets.all(0.0),
      shrinkWrap: true,
      itemCount: widget.items?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          color: widget.color,
          child: RadioListTile(
            title: Text(
              widget.items?[index].text ?? "",
              style: TextStyle(
                  fontSize: widget.items?[index].fontSize ?? 14,
                  fontWeight:
                      widget.items?[index].fontWeight ?? FontWeight.normal,
                  color: widget.items?[index].color ?? Colors.black),
            ),
            value: index,
            groupValue: groupId,
            activeColor: widget.activeColor,
            onChanged: (int? value) {
              setState(() {
                if (widget.onChanged != null) {
                  widget.onChanged!(value ?? 0);
                }
                groupId = value ?? -1;
              });
            },
          ),
        );
      },
    );
  }
}
