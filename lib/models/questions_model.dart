import 'package:equatable/equatable.dart';

class Questions extends Equatable {
  final String? type;
  final Schema? schema;

  const Questions({
    this.type,
    this.schema,
  });

  factory Questions.fromJson(Map<String, dynamic> json) {
    return Questions(
      type: json['type'],
      schema: Schema.fromJson(json['schema']),
    );
  }

  static List<Questions>? toList(List<dynamic> jsonList) {
    List<Questions> list = [];
    for (var json in jsonList) {
      final question = Questions.fromJson(json);
      print("Question ${question}");
      list.add(question);
    }
    return list;
  }

  @override
  List<Object?> get props => [type, schema];
}

class Schema extends Equatable {
  final String name;
  final String label;
  final List<Option>? options;
  final List<Questions>? fields;

  const Schema({
    required this.name,
    required this.label,
    required this.options,
    required this.fields,
  });

  factory Schema.fromJson(Map<String, dynamic> json) {
    return Schema(
        name: json["name"],
        label: json["label"],
        options: Option.toList(json["options"] ?? []),
        fields: Questions.toList(json['fields'] ?? []));
  }

  @override
  List<Object?> get props => [
        name,
        label,
        options,
      ];
}

class Option extends Equatable {
  final String key;
  final String value;

  const Option({
    required this.key,
    required this.value,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      key: json["key"],
      value: json["value"],
    );
  }

  static List<Option> toList(List<dynamic> jsonList) {
    List<Option> list = [];
    for (var json in jsonList) {
      final option = Option.fromJson(json);
      list.add(option);
    }
    return list;
  }

  @override
  List<Object?> get props => [key, value];
}
