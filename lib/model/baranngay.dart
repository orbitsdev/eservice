

class Barangay {
   
    String? id;
    String? name;
    String? regionCode;
    String? provinceCode;
    String? cityCode;
    String? href;
    
  Barangay({
    this.id,
    this.name,
    this.regionCode,
    this.provinceCode,
    this.cityCode,
    this.href,
  });

    factory Barangay.fromJson(Map<String, dynamic> json) => Barangay(
        id: json["id"],
        name: json["name"],
        regionCode: json["region_code"],
        provinceCode: json["province_code"],
        cityCode: json["city_code"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "region_code": regionCode,
        "province_code": provinceCode,
        "city_code": cityCode,
        "href": href,
    };
    
}
