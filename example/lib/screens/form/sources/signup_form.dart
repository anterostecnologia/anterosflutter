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
              color: AnterosColors.PRIMARY,
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
            padding:
                EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
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
            // Either invalidate using Form Key
            _formKey.currentState?.invalidateField(
                name: 'email', errorText: 'Email already taken.');
            // OR invalidate using Field Key
            // _emailFieldKey.currentState?.invalidate('Email already taken.');
          }

          debugPrint('Valid');
        } else {
          debugPrint('Invalid');
        }
        debugPrint(_formKey.currentState?.value.toString());
      },
      shape: AnterosButtonShape.standard,
      child: const Text('Signup', style: TextStyle(color: AnterosColors.WHITE)),
      color: AnterosColors.PRIMARY,
    );
  }

  AnterosFormField<bool> getTermsField() {
    return AnterosFormField<bool>(
      name: 'test',
      validator: AnterosFormValidators.compose([
        AnterosFormValidators.required(),
        AnterosFormValidators.equal(true),
      ]),
      // initialValue: true,
      decoration: const InputDecoration(labelText: 'Accept Terms?'),
      builder: (FormFieldState<bool?> field) {
        return InputDecorator(
          decoration: InputDecoration(
            errorText: field.errorText,
          ),
          child: SwitchListTile(
            title: const Text('I have read and accept the terms of service.'),
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
      name: 'confirm_password',
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        border: OutlineInputBorder(),
        suffixIcon:
            ((_formKey.currentState?.fields['confirm_password']?.hasError ??
                    false))
                ? const Icon(Icons.error, color: Colors.red)
                : const Icon(Icons.check, color: Colors.green),
      ),
      obscureText: true,
      validator: AnterosFormValidators.compose([]),
    );
  }

  AnterosFormTextField getPasswordField() {
    return AnterosFormTextField(
      name: 'password',
      decoration: const InputDecoration(
          labelText: 'Password', border: OutlineInputBorder()),
      obscureText: true,
      validator: AnterosFormValidators.compose([
        AnterosFormValidators.required(),
        AnterosFormValidators.minLength(6),
      ]),
    );
  }

  AnterosFormTextField getEmailField() {
    return AnterosFormTextField(
      key: _emailFieldKey,
      name: 'email',
      decoration: const InputDecoration(
          labelText: 'Email', border: OutlineInputBorder()),
      validator: AnterosFormValidators.compose([
        AnterosFormValidators.required(),
        AnterosFormValidators.email(),
      ]),
    );
  }

  AnterosFormTextField getFullNameField() {
    return AnterosFormTextField(
      name: 'full_name',
      decoration: const InputDecoration(
          labelText: 'Full Name', border: OutlineInputBorder()),
      validator: AnterosFormValidators.compose([
        AnterosFormValidators.required(),
      ]),
    );
  }

}
