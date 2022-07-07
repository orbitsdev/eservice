
class Region {
  String? id;
  String? name;
  String? href;

  Region({
    this.id,
    this.name,
    this.href,
  });



  factory Region.fromJson(Map<String, dynamic> json) => Region(
        id: json["id"],
        name: json["name"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "href": href,
      };
}
