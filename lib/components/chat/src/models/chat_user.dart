import 'dart:convert';

class AnterosChatUserModel {
  String? id;
  String? username;
  String? fullname;
  String? avatar;

  AnterosChatUserModel({
    this.id,
    this.username,
    this.fullname,
    this.avatar,
  });

  AnterosChatUserModel copyWith({
    String? id,
    String? username,
    String? fullname,
    String? avatar,
  }) {
    return AnterosChatUserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      fullname: fullname ?? this.fullname,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'fullname': fullname,
      'avatar': avatar,
    };
  }

  factory AnterosChatUserModel.fromMap(Map<String, dynamic> map) {
    return AnterosChatUserModel(
      id: map['id'],
      username: map['username'],
      fullname: map['fullname'],
      avatar: map['avatar'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AnterosChatUserModel.fromJson(String source) =>
      AnterosChatUserModel.fromMap(json.decode(source));

  /// override the toString function
  @override
  String toString() {
    return 'AnterosChatUserModel(id: $id, username: $username, fullname: $fullname, avatar: $avatar)';
  }

  /// override the '==' operator
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AnterosChatUserModel &&
        other.id == id &&
        other.username == username &&
        other.fullname == fullname &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        fullname.hashCode ^
        avatar.hashCode;
  }
}
