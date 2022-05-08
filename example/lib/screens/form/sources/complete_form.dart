import 'package:anterosflutter/components/form/fields/advanced/anteros_form_cnpj.dart';
import 'package:anterosflutter/components/form/fields/advanced/anteros_form_plate.dart';
import 'package:anterosflutter/components/form/fields/advanced/anteros_form_age.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:intl/intl.dart';

class CompleteForm extends StatefulWidget {
  const CompleteForm({Key? key}) : super(key: key);

  @override
  CompleteFormState createState() {
    return CompleteFormState();
  }
}

class CompleteFormState extends State<CompleteForm> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<AnterosFormState>();
  bool _ageHasError = false;
  bool _cpfHasError = false;
  bool _cnpjHasError = false;
  bool _plateHasError = false;
  bool _genderHasError = false;
  bool _timeHasError = false;
  bool _languageHasError = false;
  bool _classificacaoHasError = false;
  bool _languagesHasError = false;
  bool _aceiteHasError = false;
  bool _aceite1HasError = false;

  var genderOptions = ['Masculino', 'Feminino', 'Outro'];

  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: getAppBar(),
        body: getBody(context),
      );

  SingleChildScrollView getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
          child: Column(
            children: <Widget>[
              getForm(),
              getFooterButtons(context),
            ],
          )),
    );
  }

  Row getFooterButtons(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: getSubmitButton(context),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: getResetButton(context),
        ),
      ],
    );
  }

  AnterosButton getResetButton(BuildContext context) {
    return AnterosButton(
      onPressed: () {
        _formKey.currentState?.reset();
      },
      shape: AnterosButtonShape.standard,
      child: const Text('Limpar', style: TextStyle(color: AnterosColors.WHITE)),
      color: AnterosColors.DANGER,
    );
  }

  AnterosButton getSubmitButton(BuildContext context) {
    return AnterosButton(
      onPressed: () {
        if (_formKey.currentState?.saveAndValidate() ?? false) {
          debugPrint(_formKey.currentState?.value.toString());
        } else {
          debugPrint(_formKey.currentState?.value.toString());
          debugPrint('validação falhou');
        }
      },
      shape: AnterosButtonShape.standard,
      child: const Text('Enviar', style: TextStyle(color: AnterosColors.WHITE)),
      color: AnterosColors.PRIMARY,
    );
  }

  AnterosForm getForm() {
    return AnterosForm(
      key: _formKey,
      // enabled: false,
      autovalidateMode: AutovalidateMode.disabled,
      initialValue: const {
        'classificacao': 5,
        'linguagem': 'Dart',
        'idade': '13',
        'sexo': 'Masculino'
      },
      skipDisabled: true,
      child: Column(
        children: <Widget>[
          getSpace(),
          getDatetimeField(),
          getSpace(),
          getDateRangeField(),
          getSpace(),
          getSliderField(),
          getSpace(),
          getRangeSliderField(),
          getSpace(),
          getCheckboxField(),
          getSpace(),
          getAgeField(),
          getSpace(),
          getCpfField(),
          getSpace(),
          getCnpjField(),
          getSpace(),
          getPlateField(),
          getSpace(),
          getDropdownField(),
          getSpace(),
          getRadioGroupField(),
          getSpace(),
          getSegmentedControlField(),
          getSpace(),
          getSwitchField(),
          getSpace(),
          getCheckboxGroup(),
        ],
      ),
    );
  }

  AnterosFormSwitch getSwitchField() {
    return AnterosFormSwitch(
      context: context,
      title: const Text('Eu aceito os termos e condições'),
      name: 'aceite',
      labelText : "Aceite",
      initialValue: true,
      hasError: _aceiteHasError,
      validator: AnterosFormValidators.compose([
        AnterosFormValidators.required(),
      ]),
      onChanged: (val) {
        setState(() {
          _aceiteHasError =
              !(_formKey.currentState?.fields['aceite']?.validate() ??
                  false);
        });
      },
    );
  }

  AnterosFormCheckboxGroup<String> getCheckboxGroup() {
    return AnterosFormCheckboxGroup<String>(
      context: context,
      labelText: 'A linguagem do meu povo',
      name: 'linguagens',
      hasError: _languagesHasError,
      options: const [
        AnterosFormFieldOption(value: 'Dart'),
        AnterosFormFieldOption(value: 'Kotlin'),
        AnterosFormFieldOption(value: 'Java'),
        AnterosFormFieldOption(value: 'Swift'),
        AnterosFormFieldOption(value: 'Objective-C'),
      ],
      onChanged: (val) {
        setState(() {
          _classificacaoHasError =
              !(_formKey.currentState?.fields['linguagens']?.validate() ??
                  false);
        });
      },
      separator: const VerticalDivider(
        width: 10,
        thickness: 5,
        color: Colors.red,
      ),
      validator: AnterosFormValidators.compose([
        AnterosFormValidators.minLength(1),
        AnterosFormValidators.maxLength(3),
      ]),
    );
  }

  AnterosFormSegmentedControl<int> getSegmentedControlField() {
    return AnterosFormSegmentedControl(
      context: context,
      labelText: 'Classificação de filme (Vikings)',
      name: 'classificacao',
      hasError: _classificacaoHasError,
      options: List.generate(5, (i) => i + 1)
          .map((number) => AnterosFormFieldOption(
                value: number,
                child: Text(
                  number.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ))
          .toList(),
      onChanged: (val) {
        setState(() {
          _classificacaoHasError =
              !(_formKey.currentState?.fields['classificacao']?.validate() ??
                  false);
        });
      },
    );
  }

  AnterosFormRadioGroup<String> getRadioGroupField() {
    return AnterosFormRadioGroup<String>(
      context: context,
      labelText: 'Minha linguagem escolhida',
      initialValue: null,
      name: 'linguagem',
      hasError: _languageHasError,
      validator:
          AnterosFormValidators.compose([AnterosFormValidators.required()]),
      onChanged: (val) {
        setState(() {
          _languageHasError =
              !(_formKey.currentState?.fields['linguagem']?.validate() ??
                  false);
        });
      },
      options: ['Dart', 'Kotlin', 'Java', 'Swift', 'Objective-C']
          .map((lang) => AnterosFormFieldOption(
                value: lang,
                child: Text(lang),
              ))
          .toList(growable: false),
      controlAffinity: ControlAffinity.trailing,
    );
  }

  AnterosFormDropdown<String> getDropdownField() {
    return AnterosFormDropdown<String>(
      context: context,
      name: 'sexo',
      hasError: _genderHasError,
      decoration: InputDecoration(
        labelText: 'Sexo',
      ),
      allowClear: true,
      hint: const Text('Informe o sexo'),
      validator:
          AnterosFormValidators.compose([AnterosFormValidators.required()]),
      items: genderOptions
          .map((gender) => DropdownMenuItem(
                alignment: AlignmentDirectional.center,
                value: gender,
                child: Text(gender),
              ))
          .toList(),
      onChanged: (val) {
        setState(() {
          _genderHasError =
              !(_formKey.currentState?.fields['sexo']?.validate() ?? false);
        });
      },
      valueTransformer: (val) => val?.toString(),
    );
  }

  AnterosFormAgeField getAgeField() {
    return AnterosFormAgeField(
      context: context,
      name: 'idade',
      labelText: 'Idade',
      hasError: _ageHasError,
      onClearValue: () {
        _formKey.currentState!.fields['idade']?.didChange(null);
      },
      onChanged: (val) {
        setState(() {
          _ageHasError =
              !(_formKey.currentState?.fields['idade']?.validate() ?? false);
        });
      },
    );
  }

  AnterosFormCpfField getCpfField() {
    return AnterosFormCpfField(
      context: context,
      name: 'cpf',
      hasError: _cpfHasError,
      onChanged: (val) {
        setState(() {
          _cpfHasError =
              !(_formKey.currentState?.fields['cpf']?.validate() ?? false);
        });
      },
    );
  }

  AnterosFormCnpjField getCnpjField() {
    return AnterosFormCnpjField(
      context: context,
      name: 'cnpj',
      hasError: _cnpjHasError,
      onChanged: (val) {
        setState(() {
          _cnpjHasError =
              !(_formKey.currentState?.fields['cnpj']?.validate() ?? false);
        });
      },
    );
  }

  AnterosFormPlateField getPlateField() {
    return AnterosFormPlateField(
      context: context,
      name: 'placa',
      labelText: 'Placa',
      hasError: _plateHasError,
      onChanged: (val) {
        setState(() {
          _plateHasError =
              !(_formKey.currentState?.fields['placa']?.validate() ?? false);
        });
      },
    );
  }

  AnterosFormCheckbox getCheckboxField() {
    return AnterosFormCheckbox(
      context: context,
      name: 'aceite1',
      initialValue: false,
      labelText: "Aceite",
      hasError: _aceite1HasError, 
      onChanged: (val) {
        setState(() {
          _timeHasError =
              !(_formKey.currentState?.fields['aceite1']?.validate() ?? false);
        });
      },
      title: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color),
              text: 'Eu li e concordo com o ',
            ),
            TextSpan(
              text: 'Termos e condições',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
      validator: AnterosFormValidators.equal(
        true,
        errorText: 'Você deve aceitar os termos e condições para continuar',
      ),
    );
  }

  AnterosFormRangeSlider getRangeSliderField() {
    return AnterosFormRangeSlider(
      name: 'intervalo_preco',
      validator: AnterosFormValidators.compose([AnterosFormValidators.min(6)]),
      onChanged: _onChanged,
      min: 0.0,
      max: 100.0,
      initialValue: const RangeValues(4, 7),
      divisions: 20,
      activeColor: Colors.red,
      inactiveColor: Colors.pink[100],
      decoration: InputDecoration(
          labelText: 'Intervalo preço',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(style: BorderStyle.none, width: 0))),
    );
  }

  AnterosFormSlider getSliderField() {
    return AnterosFormSlider(
      name: 'itensSlider',
      validator: AnterosFormValidators.compose([
        AnterosFormValidators.min(6),
      ]),
      onChanged: _onChanged,
      min: 0.0,
      max: 10.0,
      initialValue: 7.0,
      divisions: 20,
      activeColor: Colors.red,
      inactiveColor: Colors.pink[100],
      decoration: InputDecoration(
        labelText: 'Total de itens',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(style: BorderStyle.none, width: 0),
        ),
      ),
    );
  }

  AnterosFormDateRangePicker getDateRangeField() {
    return AnterosFormDateRangePicker(
        context: context,
        name: 'periodo',
        firstDate: DateTime(1970),
        lastDate: DateTime(2030),
        format: DateFormat('dd/MM/yyyy'),
        onChanged: _onChanged,
        hasError: false,
        onClearValue: () {
          _formKey.currentState!.fields['periodo']?.didChange(null);
        },
        labelText: 'Período',
        helperText: 'Período',
        hintText: 'Informe o período');
  }

  AnterosFormDateTimePicker getDatetimeField() {
    return AnterosFormDateTimePicker(
      name: 'hora',
      context: context,
      labelText: 'Hora',
      initialValue: DateTime.now(),
      inputType: InputType.time,
      onClearValue: () {
        _formKey.currentState!.fields['hora']?.didChange(null);
      },
      hasError: _timeHasError,
      onChanged: (val) {
        setState(() {
          _timeHasError =
              !(_formKey.currentState?.fields['hora']?.validate() ?? false);
        });
      },
      validator: AnterosFormValidators.compose([
        AnterosFormValidators.required(),
      ]),
      initialTime: const TimeOfDay(hour: 8, minute: 0),
    );
  }

  SizedBox getSpace() => const SizedBox(height: 10);

  AppBar getAppBar() => AppBar(
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
          'Formulário completo',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      );
}
