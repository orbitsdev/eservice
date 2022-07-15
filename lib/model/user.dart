class User {

String? firstname;
String? lastname;
String? birthdate;
String? region;
String? province;
String? city;
String? barangay;
String? phonenumber;
String? uid;

User({
    this.firstname,
    this.lastname,
    this.birthdate,
    this.region,
    this.province,
    this.city,
    this.barangay,
    this.phonenumber,
    this.uid,
});

factory User.fromJason(Map<String, dynamic> json){
  return User(
     firstname: json["firstname"],
     lastname: json["lastname"],
     birthdate: json["birthdate"],
     region: json["region"],
     province: json["province"],
     city: json["city"],
     barangay: json["barangay"],
     phonenumber: json["phonenumber"],
     uid: json["uid"]
  );
}

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "birthdate": birthdate,
        "region": region,
        "province": province,
        "city": city,
        "barangay": barangay,
        "phonenumber": phonenumber,
        "uid": uid
    };
}


