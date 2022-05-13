import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AlertPage extends StatefulWidget {
  @override
  _AlertPageState createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  bool showblur = false;
  Widget? alertWidget;
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
            'Alert\'s',
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
        ),
        body: AnterosFloatingWidget(
          verticalPosition: 150,
          showBlurness: showblur,
          child: alertWidget,
          body: ListView(
            children: <Widget>[
              makeTitle(context, 'Cool alert\'s'),
              makeCoolAlertsOne(context),
              makeCoolAlertsTwo(context),
              makeTitle(context, 'Basic alert'),
              makeBasicAlert(),
              makeTitle(context, 'Rounded Alert'),
              makeRoundedAlert(),
              makeTitle(context, 'Full Width Alert'),
              makeFullWidthAlert(context),
              makeTitle(context, 'Custom Alert'),
              makeCustomAlert(),
            ],
          ),
        ),
      );

  Padding makeTitle(BuildContext context, title) {
    return Padding(
      padding: EdgeInsets.only(left: 15, top: 30),
      child: AnterosTypography(
        text: title,
        type: AnterosTypographyType.typo5,
        dividerWidth: 25,
        dividerColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Container makeCustomAlert() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          AnterosButton(
              text: 'Visualizar',
              onPressed: () {
                setState(() {
                  showblur = true;
                  alertWidget = AnterosAlert(
                    alignment: Alignment.center,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'lib/assets/gif/success1.gif',
                      width: 80,
                    ),
                    contentChild: const Text(
                      'Você viu com sucesso o alerta personalizado... Vassscoooo!!',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    bottombar: AnterosButton(
                      onPressed: () {
                        setState(() {
                          alertWidget = null;
                          showblur = false;
                        });
                      },
                      fullWidthButton: true,
                      color: AnterosColors.SECONDARY,
                      text: 'OK',
                    ),
                  );
                });
              }),
        ],
      ),
    );
  }

  Container makeFullWidthAlert(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      color: Colors.transparent,
      child: Center(
        child: AnterosButton(
            text: 'Visualizar',
            onPressed: () {
              setState(() {
                showblur = true;
                alertWidget = AnterosAlert(
                  backgroundColor: Colors.white,
                  title: 'Bem vindo !',
                  content:
                      'Anteros Flutter é uma das maiores bibliotecas de interface do usuário do Flutter de código aberto para aplicativos móveis ou da web com  1200+ Widgets reutilizáveis pré-criados.',
                  type: AnterosAlertType.fullWidth,
                  bottombar: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      AnterosButton(
                        onPressed: () {
                          setState(() {
                            alertWidget = null;
                            showblur = false;
                          });
                        },
                        shape: AnterosButtonShape.square,
                        color: AnterosColors.LIGHT,
                        child: const Text(
                          'Próximo',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      AnterosButton(
                        onPressed: () {
                          setState(() {
                            alertWidget = null;
                            showblur = false;
                          });
                        },
                        shape: AnterosButtonShape.square,
                        type: AnterosButtonType.outline2x,
                        icon: Icon(
                          Icons.keyboard_arrow_right,
                          color: Theme.of(context).primaryColor,
                        ),
                        position: AnterosPosition.end,
                        text: 'Saber mais',
                      )
                    ],
                  ),
                );
              });
            }),
      ),
    );
  }

  Container makeRoundedAlert() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      color: Colors.transparent,
      child: Center(
        child: AnterosButton(
            text: 'Visualizar',
            onPressed: () {
              setState(() {
                showblur = true;
                alertWidget = AnterosAlert(
                  alignment: Alignment.center,
                  backgroundColor: Colors.white,
                  title: 'Bem Vindo!',
                  content:
                      'Anteros Flutter é uma das maiores bibliotecas de interface do usuário do Flutter de código aberto para aplicativos móveis ou da web com  1200+ Widgets reutilizáveis pré-criados.',
                  type: AnterosAlertType.rounded,
                  bottombar: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      AnterosButton(
                        onPressed: () {
                          setState(() {
                            alertWidget = null;
                            showblur = false;
                          });
                        },
                        color: AnterosColors.LIGHT,
                        child: const Text(
                          'Próximo',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      AnterosButton(
                        onPressed: () {
                          setState(() {
                            alertWidget = null;
                            showblur = false;
                          });
                        },
                        shape: AnterosButtonShape.pills,
                        icon: Icon(
                          Icons.keyboard_arrow_right,
                          color: AnterosColors.WHITE,
                        ),
                        position: AnterosPosition.end,
                        text: 'Saber mais',
                      )
                    ],
                  ),
                );
              });
            }),
      ),
    );
  }

  Container makeBasicAlert() {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            AnterosButton(
                text: 'Visualizar',
                onPressed: () {
                  setState(() {
                    showblur = true;
                    alertWidget = AnterosAlert(
                      backgroundColor: Colors.white,
                      title: 'Bem vindo!',
                      content:
                          'Anteros Flutter é uma das maiores bibliotecas de interface do usuário de faixa aberta '
                          'Para aplicativos móveis ou da Web com mais de 1200 widgets reutilizáveis pré-construídos.',
                      bottombar: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          AnterosButton(
                            onPressed: () {
                              setState(() {
                                alertWidget = null;
                                showblur = false;
                              });
                            },
                            shape: AnterosButtonShape.pills,
                            color: AnterosColors.LIGHT,
                            type: AnterosButtonType.outline2x,
                            child: const Text(
                              'Próximo',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          AnterosButton(
                            onPressed: () {
                              setState(() {
                                alertWidget = null;
                                showblur = false;
                              });
                            },
                            shape: AnterosButtonShape.pills,
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              color: AnterosColors.WHITE,
                            ),
                            position: AnterosPosition.end,
                            text: 'Saber mais',
                          )
                        ],
                      ),
                    );
                  });
                }),
          ],
        ));
  }

  Widget makeCoolAlertsOne(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnterosButton(
              onPressed: () {
                AnterosCoolAlert.show(
                  context: context,
                  type: AnterosCoolAlertType.success,
                  text: 'Transação concluída com sucesso!',
                  autoCloseDuration: Duration(seconds: 5),
                );
              },
              text: 'Success Alert',
              color: AnterosColors.SUCCESS),
          Gap(8),
          AnterosButton(
              onPressed: () {
                AnterosCoolAlert.show(
                  context: context,
                  type: AnterosCoolAlertType.error,
                  title: 'Oops...',
                  text: 'Desculpe, algo deu errado',
                  loopAnimation: false,
                );
              },
              text: 'Error',
              color: AnterosColors.DANGER),
          Gap(8),
          AnterosButton(
              onPressed: () {
                AnterosCoolAlert.show(
                  context: context,
                  type: AnterosCoolAlertType.warning,
                  text: 'Você acabou de quebrar o protocolo',
                );
              },
              text: 'Atenção',
              color: AnterosColors.WARNING),
        ]);
  }

  Widget makeCoolAlertsTwo(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnterosButton(
              onPressed: () {
                AnterosCoolAlert.show(
                  context: context,
                  type: AnterosCoolAlertType.info,
                  text: 'Compre dois, ganhe um grátis',
                );
              },
              text: 'Informação',
              color: AnterosColors.INFO),
          Gap(8),
          AnterosButton(
              onPressed: () {
                AnterosCoolAlert.show(
                  context: context,
                  type: AnterosCoolAlertType.confirm,
                  text: 'Você quer fazer logout',
                  confirmBtnText: 'Sim',
                  cancelBtnText: 'Não',
                  confirmBtnColor: Colors.green,
                );
              },
              text: 'Confirmação',
              color: Colors.lightGreen)
        ]);
  }

  SizedBox Gap(double _width) {
    return SizedBox(
      width: _width,
    );
  }
}
