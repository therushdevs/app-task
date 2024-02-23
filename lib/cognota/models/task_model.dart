import 'dart:convert';

import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String title;
  final String description;
  final DateTime dateTime;

  const TaskModel({
    required this.title,
    required this.description,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'date_time': dateTime.millisecondsSinceEpoch.toString(),
    };
  }

  static List<TaskModel> fromJsonList(List<dynamic> jsonList) {
    final List<TaskModel> list = [];
    for (int i = 0; i < jsonList.length; i++) {
      final tempModel = TaskModel.fromson(jsonList[i]);
      list.add(tempModel);
    }
    return list;
  }

  factory TaskModel.fromson(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'],
      description: json['description'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(
        int.parse(json['date_time']),
      ),
    );
  }

  @override
  List<Object?> get props => [
        title,
        description,
        dateTime,
      ];
}
