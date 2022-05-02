import 'package:flutter/material.dart';

class TextFieldFocusDemo extends StatefulWidget {
  const TextFieldFocusDemo({Key? key}) : super(key: key);

  @override
  State<TextFieldFocusDemo> createState() => _TextFieldFocusDemoState();
}

class _TextFieldFocusDemoState extends State<TextFieldFocusDemo> {
  late TextEditingController _textController;
  bool _errorState = false;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const ListTile(
          title: Text(
              'Demonstração da configuração de foco automático do seletor'),
          subtitle: Text(
              'Se o foco automático do seletor estiver DESLIGADO ou se nenhum teclado '
              'atalho copiar e colar estiver ativado, este campo será autofoco em '
              'esta demonstração. Para experimentar, altere as configurações, volte para a tela principal '
              'e volte para esta tela, para ver o resultado do foco.'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: TextField(
            autofocus: true,
            onChanged: (String text) {
              setState(() {
                if (text.contains('a') | text.isEmpty) {
                  _errorState = false;
                } else {
                  _errorState = true;
                }
              });
            },
            controller: _textController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText:
                  'Se o foco automático do selecionador estiver DESLIGADO, o campo terá foco',
              labelText: 'Entrada de demonstração de foco',
              errorText: _errorState
                  ? "Qualquer entrada sem um 'a' irá acionar este erro"
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
