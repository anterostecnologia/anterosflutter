import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import '../choices.dart' as choices;

class FeaturesSinglePopup extends StatefulWidget {
  @override
  _FeaturesSinglePopupState createState() => _FeaturesSinglePopupState();
}

class _FeaturesSinglePopupState extends State<FeaturesSinglePopup> {
  String? _fruit = 'mel';
  String? _framework = 'flu';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 7),
        AnterosSmartSelect<String?>.single(
          title: 'Fruit',
          selectedValue: _fruit,
          choiceItems: choices.fruits,
          onChange: (selected) => setState(() => _fruit = selected.value),
          modalType: AnterosModalType.popupDialog,
          tileBuilder: (context, state) {
            return AnterosTile.fromState(
              state,
              leading: const Icon(Icons.shopping_cart),
            );
          },
        ),
        const Divider(indent: 20),
        AnterosSmartSelect<String?>.single(
          title: 'Frameworks',
          selectedValue: _framework,
          choiceItems: choices.frameworks,
          modalType: AnterosModalType.popupDialog,
          onChange: (selected) {
            setState(() => _framework = selected.value);
          },
          tileBuilder: (context, state) {
            return ListTile(
              title: Text(state.title ?? ''),
              subtitle: Text(
                state.selected.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  '${state.selected.toString()[0]}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
              ),
              onTap: state.showModal,
            );
          },
        ),
        const SizedBox(height: 7),
      ],
    );
  }
}
