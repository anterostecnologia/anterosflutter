import 'package:anterosflutter/anterosflutter.dart';
import 'package:anterosflutter/components/form/validators/utils/validators.dart';
import 'package:anterosflutter/helpers/validation/src/validator/allValidations.dart';
import 'package:flutter/material.dart';

/// Para criação de [FormFieldValidator]s.
class AnterosFormValidators {
  /// [FormFieldValidator] que é composto por outros [FormFieldValidator]s.
  /// Cada validador é executado no [FormField] valor e, se houver, retorna uma
  /// falha na validação de resultado não nulo, caso contrário, a validação passa.
  static FormFieldValidator<T> compose<T>(
      List<FormFieldValidator<T>> validators) {
    return (valueCandidate) {
      for (var validator in validators) {
        final validatorResult = validator.call(valueCandidate);
        if (validatorResult != null) {
          return validatorResult;
        }
      }
      return null;
    };
  }

  /// [FormFieldValidator] que requer que o campo tenha um valor não vazio.
  static FormFieldValidator<T> required<T>({
    String? errorText,
  }) {
    return (T? valueCandidate) {
      if (valueCandidate == null ||
          (valueCandidate is String && valueCandidate.trim().isEmpty) ||
          (valueCandidate is Iterable && valueCandidate.isEmpty) ||
          (valueCandidate is Map && valueCandidate.isEmpty)) {
        return errorText ?? AnterosFormLocalizations.current.requiredErrorText;
      }
      return null;
    };
  }

  /// [FormFieldValidator] que exige que o valor do campo seja igual ao
  /// valor fornecido.
  static FormFieldValidator<T> equal<T>(
    Object value, {
    String? errorText,
  }) =>
      (valueCandidate) => valueCandidate != value
          ? errorText ?? AnterosFormLocalizations.current.equalErrorText(value)
          : null;

  /// [FormFieldValidator] que exige que o valor do campo não seja igual a
  /// o valor fornecido.
  static FormFieldValidator<T> notEqual<T>(
    Object value, {
    String? errorText,
  }) =>
      (valueCandidate) => valueCandidate == value
          ? errorText ??
              AnterosFormLocalizations.current.notEqualErrorText(value)
          : null;

  /// [FormFieldValidator] que exige que o valor do campo seja maior que
  /// (ou igual) ao número fornecido.
  static FormFieldValidator<T> min<T>(
    num min, {
    bool inclusive = true,
    String? errorText,
  }) {
    return (T? valueCandidate) {
      if (valueCandidate != null) {
        assert(valueCandidate is num || valueCandidate is String);
        final number = valueCandidate is num
            ? valueCandidate
            : num.tryParse(valueCandidate.toString());

        if (number != null && (inclusive ? number < min : number <= min)) {
          return errorText ??
              AnterosFormLocalizations.current.minErrorText(min);
        }
      }
      return null;
    };
  }

  /// [FormFieldValidator] que exige que o valor do campo seja menor que
  /// (ou igual) ao número fornecido.
  static FormFieldValidator<T> max<T>(
    num max, {
    bool inclusive = true,
    String? errorText,
  }) {
    return (T? valueCandidate) {
      if (valueCandidate != null) {
        assert(valueCandidate is num || valueCandidate is String);
        final number = valueCandidate is num
            ? valueCandidate
            : num.tryParse(valueCandidate.toString());

        if (number != null && (inclusive ? number > max : number >= max)) {
          return errorText ??
              AnterosFormLocalizations.current.maxErrorText(max);
        }
      }
      return null;
    };
  }

  /// [FormFieldValidator] que requer que o comprimento do valor do campo seja
  /// maior ou igual ao comprimento mínimo fornecido.
  static FormFieldValidator<T> minLength<T>(
    int minLength, {
    bool allowEmpty = false,
    String? errorText,
  }) {
    assert(minLength > 0);
    return (T? valueCandidate) {
      assert(valueCandidate is String ||
          valueCandidate is Iterable ||
          valueCandidate == null);
      var valueLength = 0;
      if (valueCandidate is String) valueLength = valueCandidate.length;
      if (valueCandidate is Iterable) valueLength = valueCandidate.length;
      return valueLength < minLength && (!allowEmpty || valueLength > 0)
          ? errorText ??
              AnterosFormLocalizations.current.minLengthErrorText(minLength)
          : null;
    };
  }

  /// [FormFieldValidator] que requer que o comprimento do valor do campo seja
  /// menor ou igual ao comprimento máximo fornecido.
  static FormFieldValidator<T> maxLength<T>(
    int maxLength, {
    String? errorText,
  }) {
    assert(maxLength > 0);
    return (T? valueCandidate) {
      assert(valueCandidate is String ||
          valueCandidate is Iterable ||
          valueCandidate == null);
      var valueLength = 0;
      if (valueCandidate is String) valueLength = valueCandidate.length;
      if (valueCandidate is Iterable) valueLength = valueCandidate.length;
      return null != valueCandidate && valueLength > maxLength
          ? errorText ??
              AnterosFormLocalizations.current.maxLengthErrorText(maxLength)
          : null;
    };
  }

  /// [FormFieldValidator] que exige que o valor do campo seja um endereço de e-mail válido.
  static FormFieldValidator<String> email({
    String? errorText,
  }) =>
      (valueCandidate) =>
          (valueCandidate?.isNotEmpty ?? false) && !isEmail(valueCandidate!)
              ? errorText ?? AnterosFormLocalizations.current.emailErrorText
              : null;

  /// [FormFieldValidator] que requer que o valor do campo seja um URL válido.
  static FormFieldValidator<String> url({
    String? errorText,
    List<String> protocols = const ['http', 'https', 'ftp'],
    bool requireTld = true,
    bool requireProtocol = false,
    bool allowUnderscore = false,
    List<String> hostWhitelist = const [],
    List<String> hostBlacklist = const [],
  }) =>
      (valueCandidate) => true == valueCandidate?.isNotEmpty &&
              !isURL(valueCandidate,
                  protocols: protocols,
                  requireTld: requireTld,
                  requireProtocol: requireProtocol,
                  allowUnderscore: allowUnderscore,
                  hostWhitelist: hostWhitelist,
                  hostBlacklist: hostBlacklist)
          ? errorText ?? AnterosFormLocalizations.current.urlErrorText
          : null;

  /// [FormFieldValidator] que requer que o valor do campo corresponda ao padrão regex fornecido.
  static FormFieldValidator<String> match(
    String pattern, {
    String? errorText,
  }) =>
      (valueCandidate) => true == valueCandidate?.isNotEmpty &&
              !RegExp(pattern).hasMatch(valueCandidate!)
          ? errorText ?? AnterosFormLocalizations.current.matchErrorText
          : null;

  /// [FormFieldValidator] que requer que o valor do campo seja um número válido.
  static FormFieldValidator<String> numeric({
    String? errorText,
  }) =>
      (valueCandidate) => true == valueCandidate?.isNotEmpty &&
              null == num.tryParse(valueCandidate!)
          ? errorText ?? AnterosFormLocalizations.current.numericErrorText
          : null;

  /// [FormFieldValidator] que requer que o valor do campo seja um inteiro válido.
  static FormFieldValidator<String> integer({
    String? errorText,
    int? radix,
  }) =>
      (valueCandidate) => true == valueCandidate?.isNotEmpty &&
              null == int.tryParse(valueCandidate!, radix: radix)
          ? errorText ?? AnterosFormLocalizations.current.integerErrorText
          : null;

  /// [FormFieldValidator] que exige que o valor do campo seja um número de cartão de crédito válido.
  static FormFieldValidator<String> creditCard({
    String? errorText,
  }) =>
      (valueCandidate) => true == valueCandidate?.isNotEmpty &&
              !isCreditCard(valueCandidate!)
          ? errorText ?? AnterosFormLocalizations.current.creditCardErrorText
          : null;

  /// [FormFieldValidator] que requer que o valor do campo seja um endereço IP válido.
  /// * [version] é uma `String` ou um `int`.
  static FormFieldValidator<String> ip({
    int? version,
    String? errorText,
  }) =>
      (valueCandidate) =>
          true == valueCandidate?.isNotEmpty && !isIP(valueCandidate!, version)
              ? errorText ?? AnterosFormLocalizations.current.ipErrorText
              : null;

  /// [FormFieldValidator] que requer que o valor do campo seja uma string de data válida.
  static FormFieldValidator<String> dateString({
    String? errorText,
  }) =>
      (valueCandidate) => true == valueCandidate?.isNotEmpty &&
              !isDate(valueCandidate!)
          ? errorText ?? AnterosFormLocalizations.current.dateStringErrorText
          : null;

  /// [FormFieldValidator] que requer que o valor do campo seja uma string de CPF válido.
  static FormFieldValidator<String> cpf({
    String? errorText,
  }) =>
      (valueCandidate) => true == valueCandidate?.isNotEmpty &&
              !AnterosValidationHelper.isCpf(valueCandidate!)
          ? errorText ?? "Cpf inválido."
          : null;

  /// [FormFieldValidator] que requer que o valor do campo seja uma string de CNPJ válido.
  static FormFieldValidator<String> cnpj({
    String? errorText,
  }) =>
      (valueCandidate) => true == valueCandidate?.isNotEmpty &&
              !AnterosValidationHelper.isCnpj(valueCandidate!)
          ? errorText ?? "Cnpj inválido."
          : null;

  /// [FormFieldValidator] que requer que o valor do campo seja uma string de PLACA válida.
  static FormFieldValidator<String> placaVeiculo({
    String? errorText,
  }) =>
      (valueCandidate) => true == valueCandidate?.isNotEmpty &&
              !AnterosValidationHelper.isPlacaVeiculo(valueCandidate!)
          ? errorText ?? "Placa inválida."
          : null;  

  /// [FormFieldValidator] que requer que o valor do campo seja uma string de hora válida.
  static FormFieldValidator<String> time({
    String? errorText,
  }) =>
      (valueCandidate) => true == valueCandidate?.isNotEmpty &&
              !AnterosValidationHelper.isTime(valueCandidate!)
          ? errorText ?? "Hora inválida."
          : null;                

}
