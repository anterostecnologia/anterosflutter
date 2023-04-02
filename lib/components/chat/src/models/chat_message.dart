import 'dart:convert';

import 'package:anterosflutter/components/chat/src/enums/chat_message_type.dart';

class AnterosChatMessageModel {
  String? id;
  String? text;
  ChatMessageType? messageType;
  String? content;
  String? sender;
  String? recipient;
  bool? isSender;
  bool? isLoading;
  DateTime? createdAt;
  AnterosChatMessageModel({
    this.id,
    this.text,
    this.messageType,
    this.content,
    this.sender,
    this.recipient,
    this.isSender,
    this.isLoading,
    this.createdAt,
  });

  AnterosChatMessageModel copyWith({
    dynamic id,
    String? text,
    String? imageUrl,
    String? imagePath,
    String? audioUrl,
    String? audioPath,
    bool? isSender,
    bool? isLoading,
    DateTime? createdAt,
  }) {
    return AnterosChatMessageModel(
      id: id ?? this.id,
      text: text ?? this.text,
      messageType: messageType ?? this.messageType,
      content: content ?? this.content,
      sender: sender ?? this.sender,
      recipient: recipient ?? this.recipient,
      isSender: isSender ?? this.isSender,
      isLoading: isLoading ?? this.isLoading,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  /// convert the ChatMessage object to json
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'messageType': messageType,
      'content': content,
      'sender': sender,
      'recipient': recipient,
      'isSender': isSender,
      'isLoading': isLoading,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  /// create ChatMessage from json and
  /// retreve it from api
  factory AnterosChatMessageModel.fromMap(Map<String, dynamic> map) {
    return AnterosChatMessageModel(
      id: map['id'],
      text: map['text'],
      messageType: map['messageType'],
      content: map['content'],
      sender: map['sender'],
      recipient: map['recipient'],
      isSender: map['isSender'],
      isLoading: map['isLoading'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AnterosChatMessageModel.fromJson(String source) =>
      AnterosChatMessageModel.fromMap(json.decode(source));

  /// override the toString function
  @override
  String toString() {
    return 'AnterosChatMessage(id: $id, text: $text, messageType: $messageType, content: $content, sender: $sender, recipient: $recipient, isSender: $isSender, isLoading: $isLoading, createdAt: $createdAt)';
  }

  /// override the '==' operator
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AnterosChatMessageModel &&
        other.id == id &&
        other.text == text &&
        other.messageType == messageType &&
        other.content == content &&
        other.sender == sender &&
        other.recipient == recipient &&
        other.isSender == isSender &&
        other.isLoading == isLoading &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        text.hashCode ^
        messageType.hashCode ^
        content.hashCode ^
        sender.hashCode ^
        recipient.hashCode ^
        isSender.hashCode ^
        isLoading.hashCode ^
        createdAt.hashCode;
  }

  /// check message type to render the right widget
  ChatMessageType? getType() {
    return messageType;
  }

  String getTypeString() {
    if (messageType == ChatMessageType.TextMessage) {
      return "TEXT";
    } else if (messageType == ChatMessageType.AudioMessage) {
      return "AUDIO";
    } else if (messageType == ChatMessageType.ImageMessage) {
      return "IMAGE";
    }
    return "TEXT";
  }
}
