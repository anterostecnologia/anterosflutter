import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  final String? phoneNumber;

  const PinCodeVerificationScreen({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<AnterosErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<AnterosErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AnterosColors.DARK,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Icon(
                CupertinoIcons.back,
                color: Theme.of(context).primaryColor,
              ),
            )),
        title: const Text(
          'Pin code',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 30),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(Constants.otpGifImage),
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Verificação  número telefone',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                child: RichText(
                  text: TextSpan(
                      text: "Digite o código enviado para ",
                      children: [
                        TextSpan(
                            text: "${widget.phoneNumber}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ],
                      style:
                          const TextStyle(fontSize: 15)),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: AnterosPinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      obscureText: true,
                      obscuringCharacter: '*',
                      obscuringWidget: const FlutterLogo(
                        size: 24,
                      ),
                      blinkWhenObscuring: true,
                      animationType: AnterosPinCodeAnimationType.fade,
                      validator: (v) {
                        if (v!.length < 3) {
                          return "Código inválido.";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: AnterosPinTheme(
                        shape: AnterosPinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.white,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        debugPrint("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        debugPrint(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        // Se você retornar true, ele mostrará a caixa de diálogo de confirmação de pasta.Caso contrário, se false, nada acontecerá.
                        // Mas você pode mostrar o que quiser aqui, como seu pop -up dizendo formato de pasta errado ou etc
                        return true;
                      },
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  hasError
                      ? "*Por favor, preencha todas as células corretamente"
                      : "",
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Não recebeu o código? ",
                    style: TextStyle(fontSize: 15),
                  ),
                  AnterosButton(
                    onPressed: () => snackBar("OTP reenviado!!"),
                    child: const Text(
                      "REENVIAR",
                      style: TextStyle(
                          color: AnterosColors.WHITE,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                child: AnterosButton(
                  onPressed: () {
                    formKey.currentState!.validate();
                    // conditions for validating
                    if (currentText.length != 6 || currentText != "123456") {
                      errorController!.add(AnterosErrorAnimationType
                          .shake); // Triggering error shake animation
                      setState(() => hasError = true);
                    } else {
                      setState(
                        () {
                          hasError = false;
                          snackBar("OTP Verificado!!");
                        },
                      );
                    }
                  },
                  color: AnterosColors.WARNING,
                  child: Center(
                      child: Text(
                    "VERIFICAR".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                      child: AnterosButton(
                    onPressed: () {
                      textEditingController.text = "123456";
                    },
                    child: const Text('Defina o texto'),
                    icon: const Icon(
                      Icons.text_increase,
                      color: AnterosColors.WHITE,
                    ),
                    color: AnterosColors.INFO,
                  )),
                  const SizedBox(width: 10),
                  Flexible(
                      child: AnterosButton(
                    onPressed: () {
                      textEditingController.clear();
                    },
                    child: const Text('Limpar'),
                    icon: const Icon(
                      Icons.clean_hands,
                      color: AnterosColors.WHITE,
                    ),
                    color: AnterosColors.DANGER,
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Constants {
  static const Color primaryColor = Color(0xffFBFBFB);
  static const String otpGifImage = "lib/assets/gif/otp.gif";
}
