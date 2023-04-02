import 'package:anterosflutter/anterosflutter.dart';
import 'package:anterosflutter/components/notification/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
            color: AnterosColors.SUCCESS,
          ),
        ),
        title: const Text(
          'Notification',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  AnterosNotification.success(
                    width: 360,
                    notificationPosition: AnterosNotificationPosition.topLeft,
                    animation: AnimationType.fromTop,
                    title: Text('Update',
                        style: TextStyle(
                          color: Colors.green,
                        )),
                    description: Text(
                      'Seus dados foram atualizados.',
                      style: TextStyle(fontSize: 12, color: Colors.green),
                    ),
                    onDismiss: () {
                      print(
                        'This print will be displayed when dismissing the popup',
                      );
                    },
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Success theme notification\n(top left)',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  AnterosNotification.error(
                    width: 360,
                    notificationPosition: AnterosNotificationPosition.topRight,
                    animation: AnimationType.fromRight,
                    title: Text('Erro',
                        style: TextStyle(
                          color: Colors.red,
                        )),
                    description: Text('Por favor verifique seus dados.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.red,
                        )),
                    onDismiss: () {
                      print(
                        'This print will be displayed when dismissing the popup',
                      );
                    },
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Error theme notification\n(top right)',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  AnterosNotification.info(
                    width: 360,
                    notificationPosition:
                        AnterosNotificationPosition.centerLeft,
                    animation: AnimationType.fromLeft,
                    title: Text('Info',
                        style: TextStyle(
                          color: Colors.blue,
                        )),
                    description:
                        Text('Esta conta será atualizada antes de você sair.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                            )),
                    showProgressIndicator: false,
                    onDismiss: () {
                      print(
                        'This print will be displayed when dismissing the popup',
                      );
                    },
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Info theme notification\n(center left)',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  AnterosNotification(
                    width: 360,
                    notificationPosition:
                        AnterosNotificationPosition.centerRight,
                    animation: AnimationType.fromRight,
                    title: Text(
                      'Nova versão.',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    description:
                        Text('A new version is available to you please update.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 227, 129, 122),
                            )),
                    icon: Icon(
                      Icons.access_alarm,
                      color: Colors.orange,
                    ),
                    progressIndicatorColor: Colors.orange,
                    onDismiss: () {
                      print(
                        'This print will be displayed when dismissing the popup',
                      );
                    },
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Custom notification\n(center right)',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  AnterosNotification.info(
                    width: 360,
                    notificationPosition:
                        AnterosNotificationPosition.bottomLeft,
                    animation: AnimationType.fromLeft,
                    title: Text('Info',
                        style: TextStyle(
                          color: Colors.blue,
                        )),
                    description:
                        Text('Esta conta será atualizad quando você sair.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                            )),
                    action: Text(
                      'Link',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                    ),
                    onActionPressed: () {},
                    showProgressIndicator: false,
                    onDismiss: () {
                      print(
                        'This print will be displayed when dismissing the popup',
                      );
                    },
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Notificação com ação \n(bottom left)',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  AnterosNotification(
                    width: 360,
                    notificationPosition:
                        AnterosNotificationPosition.bottomRight,
                    animation: AnimationType.fromBottom,
                    description: Text(
                        'Uma nova versão está disponível por favor atualize.',
                        style: TextStyle(
                          color: Colors.orange,
                        )),
                    icon: Icon(
                      Icons.access_alarm,
                      color: Colors.orange,
                    ),
                    progressIndicatorColor: Colors.orange,
                    showProgressIndicator: false,
                    autoDismiss: false,
                    onDismiss: () {
                      print(
                        'This print will be displayed when dismissing the popup',
                      );
                    },
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Notificação sem título \n(bottom right)',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ));
}
