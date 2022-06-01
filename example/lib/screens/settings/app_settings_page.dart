import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';

class AppSettingsPage extends StatefulWidget {
  @override
  _AppSettingsPageState createState() => _AppSettingsPageState();
}

class _AppSettingsPageState extends State<AppSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnterosSettingsScreen(
        title: 'Configurações do aplicativo',
        children: [
          AnterosSettingsGroup(
            title: 'Configurações de escolha única',
            children: <Widget>[
              AnterosSwitchSettingsTile(
                settingKey: 'key-wifi',
                title: 'Wi-Fi',
                subtitle: 'Wi-Fi permite interagir com a rede local '
                    'ou internet via conexão com um roteador W-Fi',
                enabledLabel: 'Habilitada',
                disabledLabel: 'Desabilitada',
                leading: Icon(Icons.wifi),
                onChange: (value) {
                  debugPrint('key-wifi: $value');
                },
              ),
              AnterosCheckboxSettingsTile(
                settingKey: 'key-blue-tooth',
                title: 'Bluetooth',
                subtitle: 'Bluetooth permite interagir com o '
                    'próximo por dispositivos habilitados para Bluetooth',
                enabledLabel: 'Habilitada',
                disabledLabel: 'Desabilitada',
                leading: Icon(Icons.bluetooth),
                onChange: (value) {
                  debugPrint('key-blue-tooth: $value');
                },
              ),
              AnterosSwitchSettingsTile(
                leading: Icon(Icons.developer_mode),
                settingKey: 'key-switch-dev-mode',
                title: 'Configurações do desenvolvedor',
                onChange: (value) {
                  debugPrint('key-switch-dev-mod: $value');
                },
                childrenIfEnabled: <Widget>[
                  AnterosCheckboxSettingsTile(
                    leading: Icon(Icons.adb),
                    settingKey: 'key-is-developer',
                    title: 'Modo de desenvolvedor',
                    defaultValue: true,
                    onChange: (value) {
                      debugPrint('key-is-developer: $value');
                    },
                  ),
                  AnterosSwitchSettingsTile(
                    leading: Icon(Icons.usb),
                    settingKey: 'key-is-usb-debugging',
                    title: 'Depuração USB',
                    onChange: (value) {
                      debugPrint('key-is-usb-debugging: $value');
                    },
                  ),
                  AnterosSettingsTile(
                    title: 'Configurações raiz',
                    subtitle: 'Essas configurações não são acessíveis',
                    enabled: false,
                  ),
                  AnterosSettingsTile(
                    title: 'Opções customizadas',
                    subtitle:
                        'Toque para executar o retorno de chamada personalizado',
                    onTap: () => debugPrint('Ação personalizada'),
                  ),
                ],
              ),
              AnterosSettingsTile(
                title: 'Mais configurações',
                subtitle: 'Configurações de aplicativos gerais',
                child: AnterosSettingsScreen(
                  title: 'Configurações do aplicativo',
                  children: <Widget>[
                    AnterosCheckboxSettingsTile(
                      leading: Icon(Icons.adb),
                      settingKey: 'key-is-developer',
                      title: 'Modo de desenvolvedor',
                      onChange: (bool value) {
                        debugPrint(
                            'Modo de desenvolvedor ${value ? 'on' : 'off'}');
                      },
                    ),
                    AnterosSwitchSettingsTile(
                      leading: Icon(Icons.usb),
                      settingKey: 'key-is-usb-debugging',
                      title: 'Depuração USB',
                      onChange: (value) {
                        debugPrint('Depuração USB: $value');
                      },
                    ),
                  ],
                ),
              ),
              AnterosTextInputSettingsTile(
                title: 'Nome de usuário',
                settingKey: 'key-user-name',
                initialValue: 'admin',
                validator: (username) {
                  if (username != null && username.length > 3) {
                    return null;
                  }
                  return "O nome de usuário não pode ser menor que 4 letras";
                },
                borderColor: Colors.blueAccent,
                errorColor: Colors.deepOrangeAccent,
              ),
              AnterosTextInputSettingsTile(
                title: 'password',
                settingKey: 'key-user-password',
                obscureText: true,
                validator: (password) {
                  if (password != null && password.length > 6) {
                    return null;
                  }
                  return "A senha não pode ser menor que 7 letras";
                },
                borderColor: Colors.blueAccent,
                errorColor: Colors.deepOrangeAccent,
              ),
              AnterosModalSettingsTile(
                title: 'Diálogo de configuração rápida',
                subtitle: 'Configurações em uma caixa de diálogo',
                children: <Widget>[
                  AnterosCheckboxSettingsTile(
                    settingKey: 'key-day-light-savings',
                    title: 'Economizando da hora do dia',
                    enabledLabel: 'Habilitada',
                    disabledLabel: 'Desabilitada',
                    leading: Icon(Icons.timelapse),
                    onChange: (value) {
                      debugPrint('key-day-light-saving: $value');
                    },
                  ),
                  AnterosSwitchSettingsTile(
                    settingKey: 'key-dark-mode',
                    title: 'Modo escuro',
                    enabledLabel: 'Enabled',
                    disabledLabel: 'Disabled',
                    leading: Icon(Icons.palette),
                    onChange: (value) {
                      debugPrint('jey-dark-mode: $value');
                    },
                  ),
                ],
              ),
              AnterosExpandableSettingsTile(
                title: 'Configuração rápida 2',
                subtitle: 'Configurações expansíveis',
                expanded: true,
                children: <Widget>[
                  AnterosCheckboxSettingsTile(
                    settingKey: 'key-day-light-savings-2',
                    title: 'Economizando da hora do dia',
                    enabledLabel: 'Habilitada',
                    disabledLabel: 'Desabilitada',
                    leading: Icon(Icons.timelapse),
                    onChange: (value) {
                      debugPrint('key-day-light-savings-2: $value');
                    },
                  ),
                  AnterosSwitchSettingsTile(
                    settingKey: 'key-dark-mode-2',
                    title: 'Modo escuro',
                    enabledLabel: 'Enabled',
                    disabledLabel: 'Disabled',
                    leading: Icon(Icons.palette),
                    onChange: (value) {
                      debugPrint('key-dark-mode-2: $value');
                    },
                  ),
                ],
              ),
            ],
          ),
          AnterosSettingsGroup(
            title: 'Configurações de múltipla escolha',
            children: <Widget>[
              AnterosRadioSettingsTile<int>(
                title: 'Período de sincronização preferida',
                settingKey: 'key-radio-sync-period',
                values: <int, String>{
                  0: 'Nunca',
                  1: 'Diária',
                  7: 'Semanalmente',
                  15: 'Quinzena',
                  30: 'Por mês',
                },
                selected: 0,
                onChange: (value) {
                  debugPrint('key-radio-sync-period: $value');
                },
              ),
              AnterosDropDownSettingsTile<int>(
                title: 'Visão por e-mail',
                settingKey: 'key-dropdown-email-view',
                values: <int, String>{
                  2: 'Simples',
                  3: 'Ajustada',
                  4: 'Normal',
                  5: 'Compactar',
                  6: 'Sóbia',
                },
                selected: 2,
                onChange: (value) {
                  debugPrint('key-dropdown-email-view: $value');
                },
              ),
            ],
          ),
          AnterosModalSettingsTile(
            title: 'Configurações do grupo',
            subtitle:
                'Mesmos configurações de grupo, mas em uma caixa de diálogo',
            children: <Widget>[
              AnterosDefaultRadioSettingsTile(
                title: 'Configurações de sincronização',
                settingKey: 'key-radio-sync-settings',
                values: <String>[
                  'Nunca',
                  'Diária',
                  'Semanalmente',
                  'Quinzena',
                  'Por mês',
                ],
                selected: 'Daily',
                onChange: (value) {
                  debugPrint('key-radio-sync-settins: $value');
                },
              ),
              AnterosDefultDropDownSettingsTile(
                title: 'Filtro de beleza',
                settingKey: 'key-dropdown-beauty-filter',
                values: <String>[
                  'Simples',
                  'Normal',
                  'Pequeno especial',
                  'Especial',
                  'Extra especial',
                  'Bizarro',
                  'Horrível',
                ],
                selected: 'Special',
                onChange: (value) {
                  debugPrint('key-dropdown-beauty-filter: $value');
                },
              )
            ],
          ),
          AnterosExpandableSettingsTile(
            title: 'Configurações expansíveis do grupo',
            subtitle: 'Grupo de configurações (expansível)',
            children: <Widget>[
              AnterosRadioSettingsTile<double>(
                title: 'Filtro de beleza',
                settingKey: 'key-radio-beauty-filter-exapndable',
                values: <double, String>{
                  1.0: 'Simples',
                  1.5: 'Normal',
                  2.0: 'Pequeno especial',
                  2.5: 'Especial',
                  3.0: 'Extra especial',
                  3.5: 'Bizarro',
                  4.0: 'Horrível',
                },
                selected: 2.5,
                onChange: (value) {
                  debugPrint('key-radio-beauty-filter-expandable: $value');
                },
              ),
              AnterosDropDownSettingsTile<int>(
                title: 'Período de sincronização preferida',
                settingKey: 'key-dropdown-sync-period-2',
                values: <int, String>{
                  0: 'Nunca',
                  1: 'Diária',
                  7: 'Semanalmente',
                  15: 'Quinzena',
                  30: 'Por mês',
                },
                selected: 0,
                onChange: (value) {
                  debugPrint('key-dropdown-sync-period-2: $value');
                },
              )
            ],
          ),
          AnterosSettingsGroup(
            title: 'Outros ajustes',
            children: <Widget>[
              AnterosSliderSettingsTile(
                title: 'Volume [Ajustando automaticamente 20]',
                settingKey: 'key-slider-volume',
                defaultValue: 20,
                min: 0,
                max: 100,
                step: 1,
                leading: Icon(Icons.volume_up),
                decimalPrecision: 0,
                onChange: (value) {
                  debugPrint('\n===== on change end =====\n'
                      'key-slider-volume: $value'
                      '\n==========\n');
                  Future.delayed(Duration(seconds: 1), () {
                    AnterosSettings.setValue('key-slider-volume', 20.0,
                        notify: true);
                  });
                },
              ),
              AnterosColorPickerSettingsTile(
                settingKey: 'key-color-picker',
                title: 'Cor de destaque',
                defaultValue: Colors.blue,
                onChange: (value) {
                  debugPrint('key-color-picker: $value');
                },
              )
            ],
          ),
          AnterosModalSettingsTile(
            title: 'Outros ajustes',
            subtitle: 'Outras configurações em uma caixa de diálogo',
            children: <Widget>[
              AnterosSliderSettingsTile(
                title: 'Proporção personalizada',
                settingKey: 'key-custom-ratio-slider-2',
                defaultValue: 2.5,
                min: 1,
                max: 5,
                step: 0.1,
                decimalPrecision: 1,
                leading: Icon(Icons.aspect_ratio),
                onChange: (value) {
                  debugPrint('\n===== on change =====\n'
                      'key-custom-ratio-slider-2: $value'
                      '\n==========\n');
                },
                onChangeStart: (value) {
                  debugPrint('\n===== on change start =====\n'
                      'key-custom-ratio-slider-2: $value'
                      '\n==========\n');
                },
                onChangeEnd: (value) {
                  debugPrint('\n===== on change end =====\n'
                      'key-custom-ratio-slider-2: $value'
                      '\n==========\n');
                },
              ),
              AnterosColorPickerSettingsTile(
                settingKey: 'key-color-picker-2',
                title: 'Seletor de sotaque',
                defaultValue: Colors.blue,
                onChange: (value) {
                  debugPrint('key-color-picker-2: $value');
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
