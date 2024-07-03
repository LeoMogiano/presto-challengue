class Merchat {
  String? id;
  String? name;
  String? category;

  Merchat({
    this.id,
    this.name,
    this.category,
  });

  factory Merchat.fromJson(Map<String, dynamic> json) => Merchat(
        id: json["_id"],
        name: json["name"],
        category: json["category"],
      );
}
