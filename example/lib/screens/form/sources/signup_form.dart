import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<AnterosFormState>();
  final _emailFieldKey = GlobalKey<AnterosFormFieldState>();

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
              color: Theme.of(context).primaryColor,
            ),
          ),
          title: const Text(
            'Signup form',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: getBody(),
      );

  SingleChildScrollView getBody() {
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
          child: Column(
            children: [
              getFullNameField(),
              getSpace(),
              getEmailField(),
              getSpace(),
              getPasswordField(),
              getSpace(),
              getConfirmPasswordField(),
              getSpace(),
              getTermsField(),
              getSpace(),
              getSignupButton(),
            ],
          )),
    );
  }

  SizedBox getSpace() => const SizedBox(height: 10);

  AnterosButton getSignupButton() {
    return AnterosButton(
      onPressed: () {
        if (_formKey.currentState?.saveAndValidate() ?? false) {
          if (true) {
            _formKey.currentState?.invalidateField(
                name: 'email', errorText: 'E-mail já registrado.');
          }
          debugPrint('Valid');
        } else {
          debugPrint('Invalid');
        }
        debugPrint(_formKey.currentState?.value.toString());
      },
      shape: AnterosButtonShape.standard,
      child:
          const Text('Registrar', style: TextStyle(color: AnterosColors.WHITE)),
      color: Theme.of(context).primaryColor,
    );
  }

  AnterosFormField<bool> getTermsField() {
    return AnterosFormField<bool>(
      name: 'test',
      validator: AnterosFormValidators.compose([
        AnterosFormValidators.required(),
        AnterosFormValidators.equal(true),
      ]),
      decoration: const InputDecoration(labelText: 'Aceitar os termos?'),
      builder: (FormFieldState<bool?> field) {
        return InputDecorator(
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x4437474F),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x4437474F),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            errorText: field.errorText,
          ),
          child: SwitchListTile(
            title: const Text('Eu li e aceito os termos de serviço.'),
            onChanged: (bool value) {
              field.didChange(value);
            },
            value: field.value ?? false,
          ),
        );
      },
    );
  }

  AnterosFormTextField getConfirmPasswordField() {
    return AnterosFormTextField(
      context: context,
      name: 'confirm_password',
      labelText: 'Confirm Password',
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: true,
      validator: AnterosFormValidators.compose([]),
    );
  }

  AnterosFormTextField getPasswordField() {
    return AnterosFormTextField(
      context: context,
      name: 'password',
      labelText: "Password",
      obscureText: true,
      validator: AnterosFormValidators.compose([
        AnterosFormValidators.required(),
        AnterosFormValidators.minLength(6),
      ]),
    );
  }

  AnterosFormTextField getEmailField() {
    return AnterosFormTextField(
      context: context,
      key: _emailFieldKey,
      name: 'email',
      labelText: 'Email',
      validator: AnterosFormValidators.compose([
        AnterosFormValidators.required(),
        AnterosFormValidators.email(),
      ]),
    );
  }

  AnterosFormTextField getFullNameField() {
    return AnterosFormTextField(
      context: context,
      name: 'full_name',
      labelText: 'Full Name',
      validator: AnterosFormValidators.compose([
        AnterosFormValidators.required(),
      ]),
    );
  }
}
