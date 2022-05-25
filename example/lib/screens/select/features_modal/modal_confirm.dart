import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import '../choices.dart' as choices;

class FeaturesModalConfirm extends StatefulWidget {
  @override
  _FeaturesModalConfirmState createState() => _FeaturesModalConfirmState();
}

class _FeaturesModalConfirmState extends State<FeaturesModalConfirm> {
  List<String> _day = ['fri'];
  List<String> _fruit = ['mel'];
  String? _hero = 'iro';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 7),
        AnterosSmartSelect<String>.multiple(
          title: 'Days',
          selectedValue: _day,
          onChange: (selected) => setState(() => _day = selected.value),
          choiceItems: choices.days,
          modalType: AnterosModalType.fullPage,
          modalConfirm: true,
          tileBuilder: (context, state) {
            return AnterosTile<dynamic>(
              title: state.titleWidget,
              value: state.selected.toWidget(),
              onTap: state.showModal,
              isTwoLine: true,
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://source.unsplash.com/xsGxhtAsfSA/100x100',
                ),
              ),
            );
          },
        ),
        const Divider(indent: 20),
        AnterosSmartSelect<String>.multiple(
          title: 'Fruit',
          selectedValue: _fruit,
          onChange: (selected) => setState(() => _fruit = selected.value),
          choiceItems: choices.fruits,
          modalType: AnterosModalType.popupDialog,
          modalConfirm: true,
          modalValidation: (value) {
            return value.length > 0 ? '' : 'Select at least one';
          },
          modalHeaderStyle: AnterosModalHeaderStyle(
            backgroundColor: Theme.of(context).cardColor,
          ),
          tileBuilder: (context, state) {
            return AnterosTile.fromState(
              state,
              isTwoLine: true,
              leading: Container(
                width: 40,
                alignment: Alignment.center,
                child: const Icon(Icons.shopping_cart),
              ),
            );
          },
          modalActionsBuilder: (context, state) {
            return [];
          },
          modalDividerBuilder: (context, state) {
            return const Divider(height: 1);
          },
          modalFooterBuilder: (context, state) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 7.0,
              ),
              child: Row(
                children: <Widget>[
                  const Spacer(),
                  FlatButton(
                    child: const Text('Cancel'),
                    onPressed: () => state.closeModal(confirmed: false),
                  ),
                  const SizedBox(width: 5),
                  FlatButton(
                    child: Text('OK (${state.selection?.length ?? 0})'),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: (state.selection?.isValid ?? true)
                        ? () => state.closeModal(confirmed: true)
                        : null,
                  ),
                ],
              ),
            );
          },
        ),
        const Divider(indent: 20),
        AnterosSmartSelect<String?>.single(
          title: 'Super Hero',
          selectedValue: _hero,
          onChange: (selected) => setState(() => _hero = selected.value),
          choiceItems: choices.heroes,
          choiceActiveStyle: const AnterosChoiceStyle(color: Colors.redAccent),
          modalType: AnterosModalType.bottomSheet,
          modalValidation: (selected) {
            if (selected == null) return 'Select at least one';
            if (selected.value == 'iro') return 'Ironman is busy';
            return '';
          },
          modalConfig: AnterosModalConfig(
            useConfirm: true,
            confirmLabel: const Text('Send'),
            confirmIcon: const Icon(Icons.send),
          ),
          tileBuilder: (context, state) {
            return AnterosTile.fromState(
              state,
              isTwoLine: true,
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://source.unsplash.com/8I-ht65iRww/100x100',
                ),
              ),
            );
          },
          modalConfirmBuilder: (context, state) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: FlatButton(
                  child: const Text('Send'),
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  onPressed: () => state.closeModal(confirmed: true),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 7),
      ],
    );
  }
}
