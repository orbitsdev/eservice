
class Province {
  String id;
  String name;
  String regionCode;
  String href;

  Province({
    required this.id,
    required this.name,
    required this.regionCode,
    required this.href,
  });

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        id: json["id"],
        name: json["name"],
        regionCode: json["region_code"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "region_code": regionCode,
        "href": href,
      };
}
