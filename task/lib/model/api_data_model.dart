import 'package:hive/hive.dart';

part 'api_data_model.g.dart';

@HiveType(typeId: 0)
class DataModel {
  @HiveField(0)
  int? userId;

  @HiveField(1)
  int? id;

  @HiveField(2)
  String? title;

  @HiveField(3)
  String? body;

  DataModel({this.userId, this.id, this.title, this.body});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  @override
  String toString() {
    return 'DataModel{userId: $userId, id: $id, title: $title, body: $body}';
  }
}
