import 'dart:convert';
import 'package:dio/dio.dart';

class ApiErrorManager {
  Apierror? apierror;

  ApiErrorManager({this.apierror});

  static ApiErrorManager fromJson(Map<String, dynamic> json) {
    return ApiErrorManager(
        apierror: json['apierror'] != null
            ? Apierror.fromJson(json['apierror'])
            : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.apierror != null) {
      data['apierror'] = this.apierror!.toJson();
    }
    return data;
  }

  static bool isApi(DioError e) {
    try {
      var data = e.response!.data;
      if (isJson(data)) {
        var json = jsonDecode(data);
        return json.containsKey('apierror');
      }
      return false;
    } on Exception catch (ex) {
      return false;
    }
  }

  @override
  String toString() => 'ApiErrorManager(apierror: $apierror)';
}

bool isJson(str) {
  try {
    json.decode(str);
  } catch (e) {
    return false;
  }
  return true;
}

class Apierror {
  String? status;
  Timestamp? timestamp;
  String? message;
  String? debugMessage;
  List<SubErrors>? subErrors;

  Apierror(
      {this.status,
      this.timestamp,
      this.message,
      this.debugMessage,
      this.subErrors});

  static Apierror fromJson(Map<String, dynamic> json) {
    var api = json['apierror'];
    List<SubErrors> subErrors = [];
    if (api['subErrors'] != null) {
      api['subErrors'].forEach((v) {
        var error = SubErrors.fromJson(v);
        subErrors.add(error);
      });
    }

    return Apierror(
        status: api['status'],
        timestamp: api['timestamp'] != null
            ? Timestamp.fromJson(api['timestamp'])
            : null,
        message: api['message'],
        debugMessage: api['debugMessage'],
        subErrors: subErrors);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.timestamp != null) {
      data['timestamp'] = this.timestamp!.toJson();
    }
    data['message'] = this.message;
    data['debugMessage'] = this.debugMessage;
    if (this.subErrors != null) {
      data['subErrors'] = this.subErrors!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Apierror(status: $status, timestamp: $timestamp, message: $message, debugMessage: $debugMessage, subErrors: $subErrors)';
  }
}

class Timestamp {
  int nano;
  int year;
  int monthValue;
  int dayOfMonth;
  int hour;
  int minute;
  int second;
  String dayOfWeek;
  int dayOfYear;
  String month;
  Chronology? chronology;

  Timestamp(
      {required this.nano,
      required this.year,
      required this.monthValue,
      required this.dayOfMonth,
      required this.hour,
      required this.minute,
      required this.second,
      required this.dayOfWeek,
      required this.dayOfYear,
      required this.month,
      this.chronology});

  static fromJson(Map<String, dynamic> json) {
    var chronology = json['chronology'] != null
        ? Chronology.fromJson(json['chronology'])
        : null;
    return Timestamp(
        nano: json['nano'],
        year: json['year'],
        monthValue: json['monthValue'],
        dayOfMonth: json['dayOfMonth'],
        hour: json['hour'],
        minute: json['minute'],
        second: json['second'],
        dayOfWeek: json['dayOfWeek'],
        dayOfYear: json['dayOfYear'],
        month: json['month'],
        chronology: chronology);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nano'] = this.nano;
    data['year'] = this.year;
    data['monthValue'] = this.monthValue;
    data['dayOfMonth'] = this.dayOfMonth;
    data['hour'] = this.hour;
    data['minute'] = this.minute;
    data['second'] = this.second;
    data['dayOfWeek'] = this.dayOfWeek;
    data['dayOfYear'] = this.dayOfYear;
    data['month'] = this.month;
    if (this.chronology != null) {
      data['chronology'] = this.chronology!.toJson();
    }
    return data;
  }
}

class Chronology {
  String? id;
  String? calendarType;

  Chronology({this.id, this.calendarType});

  static Chronology fromJson(Map<String, dynamic> json) {
    return Chronology(id: json['id'], calendarType: json['calendarType']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['calendarType'] = this.calendarType;
    return data;
  }
}

class SubErrors {
  String? object;
  String? field;
  String? rejectedValue;
  String? message;

  SubErrors({this.object, this.field, this.rejectedValue, this.message});

  static SubErrors fromJson(Map<String, dynamic> json) {
    return SubErrors(
        object: json['object'],
        field: json['field'],
        rejectedValue: json['rejectedValue'],
        message: json['message']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['object'] = this.object;
    data['field'] = this.field;
    data['rejectedValue'] = this.rejectedValue;
    data['message'] = this.message;
    return data;
  }

  @override
  String toString() {
    return 'SubErrors(object: $object, field: $field, rejectedValue: $rejectedValue, message: $message)';
  }
}
