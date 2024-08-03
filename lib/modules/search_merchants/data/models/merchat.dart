import 'package:equatable/equatable.dart';

class Merchat extends Equatable {
  final String? id;
  final String? name;
  final String? category;

  const Merchat({
    this.id,
    this.name,
    this.category,
  });

  factory Merchat.fromJson(Map<String, dynamic> json) => Merchat(
        id: json["_id"],
        name: json["name"],
        category: json["category"],
      );

  static List<Merchat> fromJsonList(Map<String, dynamic> jsonList) {
    List data = jsonList['data'];
    return data.map((e) => Merchat.fromJson(e)).toList();
  }

  @override
  List<Object?> get props => [id, name, category];

}
