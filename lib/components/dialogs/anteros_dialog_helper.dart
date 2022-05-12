import 'package:anterosflutter/components/dialogs/anteros_awesome_dialog.dart';
import 'package:anterosflutter/exceptions/anteros_exceptions.dart';
import 'package:flutter/material.dart';

class AnterosDialogs {
  static void showDialogNoAvailable(context) {
    showDialog(
        context: context,
        builder: (_) => AnterosNetworkDialog(
              image: Image.asset('assets/images/catch-the-bus.gif'),
              onlyOkButton: true,
              title: const Text('Opps !!!',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600)),
              description: const Text(
                'Em breve disponível. Estamos correndo para concluir esta funcionalidade. Você será o primeiro a ser avisado.',
                textAlign: TextAlign.center,
              ),
              entryAnimation: EntryAnimation.bottom,
              onOkButtonPressed: () {
                Navigator.pop(context, false);
              },
              onCancelButtonPressed: () {},
            ));
  }

  static void showDialogNoInternet(context) async {
    await showDialog(
        context: context,
        builder: (_) => AnterosNetworkDialog(
              image: Image.asset('assets/images/no_internet.gif'),
              onlyOkButton: true,
              title: const Text('Opps !!!',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600)),
              description: const Text(
                'Você está sem acesso a INTERNET. Esta funcionalidade depende de você estar online.',
                textAlign: TextAlign.center,
              ),
              entryAnimation: EntryAnimation.bottom,
              onOkButtonPressed: () {
                Navigator.pop(context, false);
              },
              onCancelButtonPressed: () {},
            ));
  }

  static void showDialogTakeYourPhoto(context, value, gender) async {
    String img = 'assets/images/take_photo_man.gif';
    if (gender == 'FEMININO') {
      img = 'assets/images/take_photo_woman.gif';
    }
    await showDialog(
        context: context,
        builder: (_) => AnterosNetworkDialog(
              image: Image.asset(
                img,
                fit: BoxFit.fitWidth,
              ),
              onlyOkButton: true,
              title: const Text('Importante !!!',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600)),
              description: const Text(
                'Para que possamos efetuar a sua identificação junto a plataforma, precisamos que você tire uma foto do seu rosto.',
                textAlign: TextAlign.center,
              ),
              entryAnimation: EntryAnimation.bottom,
              onOkButtonPressed: () {
                Navigator.pushReplacementNamed(context, value);
              },
              onCancelButtonPressed: () {},
            ));
  }

  // static Future<dynamic> showError(e, context, [String? routeName]) {
  //   String message = e.toString();
  //   if (e is AnterosApiServiceException) {
  //     if (e.apiError != null) {
  //       message = e.apiError!.message!;
  //     } else {
  //       message = e.message!;
  //     }
  //   }
  //   return CoolAlert.show(
  //     context: context,
  //     type: CoolAlertType.error,
  //     animType: CoolAlertAnimType.slideInDown,
  //     borderRadius: 8,
  //     title: "Erro",
  //     text: message,
  //   );
  // }
}
