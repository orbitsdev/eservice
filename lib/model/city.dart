
class City {
  
    String? id;
    String? name;
    String? regionCode;
    String? provinceCode;
    String? href;
  City({
    this.id,
    this.name,
    this.regionCode,
    this.provinceCode,
    this.href,
  });
    


    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        regionCode: json["region_code"],
        provinceCode: json["province_code"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "region_code": regionCode,
        "province_code": provinceCode,
        "href": href,
    };
}
