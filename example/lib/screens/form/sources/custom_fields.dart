import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class CustomFields extends StatefulWidget {
  const CustomFields({Key? key}) : super(key: key);

  @override
  _CustomFieldsState createState() => _CustomFieldsState();
}

class _CustomFieldsState extends State<CustomFields> {
  final _formKey = GlobalKey<AnterosFormState>();
  var options = ["Option 1", "Option 2", "Option 3"];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: AnterosColors.DARK,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.back,
              color: AnterosColors.PRIMARY,
            ),
          ),
          title: const Text(
            'Campos customizados',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding:
                  EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  AnterosFormField<String?>(
                    name: 'name',
                    builder: (FormFieldState field) {
                      return CupertinoTextField(
                        onChanged: (value) => field.didChange(value),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  AnterosFormField<bool>(
                    name: 'terms',
                    builder: (FormFieldState field) {
                      return CheckboxListTile(
                        title: const Text('Eu aceito os termos e condições'),
                        value: false,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (value) => field.didChange(value),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  AnterosFormField<String?>(
                    name: 'name',
                    builder: (FormFieldState field) {
                      return CupertinoFormRow(
                        prefix: const Text('Nome: '),
                        error: field.errorText != null
                            ? Text(field.errorText!)
                            : null,
                        child: CupertinoTextField(
                          onChanged: (value) => field.didChange(value),
                        ),
                      );
                    },
                    autovalidateMode: AutovalidateMode.always,
                    validator: (valueCandidate) {
                      if (valueCandidate?.isEmpty ?? true) {
                        return 'Este campo é obrigatório.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  AnterosFormField<bool>(
                    name: 'terms',
                    builder: (FormFieldState field) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Termos',
                          errorText: field.errorText,
                        ),
                        child: CheckboxListTile(
                          title:
                              const Text('Eu aceito os termos e condições'),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: false,
                          onChanged: (value) => field.didChange(value),
                        ),
                      );
                    },
                    validator: (valueCandidate) {
                      if (valueCandidate != true) {
                        return 'Aceitar termos e condições para continuar.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {
                            _formKey.currentState!.save();
                            if (_formKey.currentState!.validate()) {
                              debugPrint(
                                  _formKey.currentState!.value.toString());
                            } else {
                              debugPrint("validation failed");
                            }
                          },
                          shape: AnterosButtonShape.standard,
                          child: const Text('Enviar',
                              style: TextStyle(color: AnterosColors.WHITE)),
                          color: AnterosColors.PRIMARY,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: AnterosButton(
                          onPressed: () {
                            _formKey.currentState!.reset();
                          },
                          shape: AnterosButtonShape.standard,
                          child: const Text('Limpar',
                              style: TextStyle(color: AnterosColors.WHITE)),
                          color: AnterosColors.DANGER,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      );
}
