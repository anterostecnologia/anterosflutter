// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AnterosFormLocalizations {
  AnterosFormLocalizations();

  static AnterosFormLocalizations? _current;

  static AnterosFormLocalizations get current {
    assert(_current != null,
        'Nenhuma instância de AnterosFormLocalizations foi carregada. Tente inicializar o AnterosFormLocalizations delegate antes de acessar FormBuilderLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AnterosFormLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AnterosFormLocalizations();
      AnterosFormLocalizations._current = instance;

      return instance;
    });
  }

  static AnterosFormLocalizations of(BuildContext context) {
    final instance = AnterosFormLocalizations.maybeOf(context);
    assert(instance != null,
        'Nenhuma instância de AnterosFormLocalizations presente na árvore do widget. Você acrescentou AnterosFormLocalizations.delegate em localizationsDelegates?');
    return instance!;
  }

  static AnterosFormLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AnterosFormLocalizations>(
        context, AnterosFormLocalizations);
  }

  /// `This field cannot be empty.`
  String get requiredErrorText {
    return Intl.message(
      'Este campo não pode estar vazio.',
      name: 'requiredErrorText',
      desc: 'Error Text for required field',
      args: [],
    );
  }

  /// `Value must be greater than or equal to {min}.`
  String minErrorText(Object min) {
    return Intl.message(
      'O valor deve ser maior ou igual a $min.',
      name: 'minErrorText',
      desc: 'Error Text for required field',
      args: [min],
    );
  }

  /// `Value must have a length greater than or equal to {minLength}`
  String minLengthErrorText(Object minLength) {
    return Intl.message(
      'O valor deve ter um comprimento maior ou igual a $minLength',
      name: 'minLengthErrorText',
      desc: 'Error Text for required field',
      args: [minLength],
    );
  }

  /// `Value must be less than or equal to {max}`
  String maxErrorText(Object max) {
    return Intl.message(
      'O valor deve ser menor ou igual a $max',
      name: 'maxErrorText',
      desc: 'Error Text for required field',
      args: [max],
    );
  }

  /// `Value must have a length less than or equal to {maxLength}`
  String maxLengthErrorText(Object maxLength) {
    return Intl.message(
      'O valor deve ter um comprimento menor ou igual a $maxLength',
      name: 'maxLengthErrorText',
      desc: 'Error Text for required field',
      args: [maxLength],
    );
  }

  /// `This field requires a valid email address.`
  String get emailErrorText {
    return Intl.message(
      'Este campo requer um endereço de e -mail válido.',
      name: 'emailErrorText',
      desc: 'Error Text for email field',
      args: [],
    );
  }

  /// `This field requires a valid integer.`
  String get integerErrorText {
    return Intl.message(
      'Este campo requer um número inteiro válido.',
      name: 'integerErrorText',
      desc: 'Error Text for integer validator',
      args: [],
    );
  }

  /// `This field value must be equal to {value}.`
  String equalErrorText(Object value) {
    return Intl.message(
      'Este valor de campo deve ser igual a $value.',
      name: 'equalErrorText',
      desc: 'Error Text for equal validator',
      args: [value],
    );
  }

  /// `This field value must not be equal to {value}.`
  String notEqualErrorText(Object value) {
    return Intl.message(
      'Este valor de campo não deve ser igual a $value.',
      name: 'notEqualErrorText',
      desc: 'Error Text for not-equal validator',
      args: [value],
    );
  }

  /// `This field requires a valid URL address.`
  String get urlErrorText {
    return Intl.message(
      'Este campo requer um endereço de URL válido.',
      name: 'urlErrorText',
      desc: 'Error Text for URL field',
      args: [],
    );
  }

  /// `Value does not match pattern.`
  String get matchErrorText {
    return Intl.message(
      'O valor não corresponde ao padrão.',
      name: 'matchErrorText',
      desc: 'Error Text for pattern field',
      args: [],
    );
  }

  /// `Value must be numeric.`
  String get numericErrorText {
    return Intl.message(
      'O valor deve ser numérico.',
      name: 'numericErrorText',
      desc: 'Error Text for numeric field',
      args: [],
    );
  }

  /// `This field requires a valid credit card number.`
  String get creditCardErrorText {
    return Intl.message(
      'Este campo requer um número de cartão de crédito válido.',
      name: 'creditCardErrorText',
      desc: 'Error Text for credit card field',
      args: [],
    );
  }

  /// `This field requires a valid IP.`
  String get ipErrorText {
    return Intl.message(
      'Este campo requer um IP válido.',
      name: 'ipErrorText',
      desc: 'Error Text for IP address field',
      args: [],
    );
  }

  /// `This field requires a valid date string.`
  String get dateStringErrorText {
    return Intl.message(
      'Este campo requer uma string de data válida.',
      name: 'dateStringErrorText',
      desc: 'Error Text for date string field',
      args: [],
    );
  }
}

class AppLocalizationDelegate
    extends LocalizationsDelegate<AnterosFormLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'bn'),
      Locale.fromSubtags(languageCode: 'ca'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'et'),
      Locale.fromSubtags(languageCode: 'fa'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'hu'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'lo'),
      Locale.fromSubtags(languageCode: 'messages'),
      Locale.fromSubtags(languageCode: 'nl'),
      Locale.fromSubtags(languageCode: 'pl'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'pt-BR'),
      Locale.fromSubtags(languageCode: 'ro'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'sk'),
      Locale.fromSubtags(languageCode: 'sl'),
      Locale.fromSubtags(languageCode: 'sw'),
      Locale.fromSubtags(languageCode: 'uk'),
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AnterosFormLocalizations> load(Locale locale) =>
      AnterosFormLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
