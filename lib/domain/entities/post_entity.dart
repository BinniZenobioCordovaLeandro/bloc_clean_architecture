import 'dart:convert';

class PostEntity {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostEntity({this.userId, this.id, this.title, this.body});

  @override
  String toString() {
    return 'PostEntity(userId: $userId, id: $id, title: $title, body: $body)';
  }

  factory PostEntity.fromMap(Map<String, dynamic> data) => PostEntity(
        userId: data['userId'] as int?,
        id: data['id'] as int?,
        title: data['title'] as String?,
        body: data['body'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PostEntity].
  factory PostEntity.fromJson(String data) {
    return PostEntity.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PostEntity] to a JSON string.
  String toJson() => json.encode(toMap());

  PostEntity copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostEntity(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
