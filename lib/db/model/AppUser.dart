class AppUser {
  String? id;
  String? name;
  String? phone;
  String? email;

  AppUser({this.id, this.email, this.name, this.phone});

  AppUser.fromMap(Map<String, dynamic> ?map) {
    id = map?["id"];
    name = map?["name"];
    phone = map?["phone"];
    email = map?["email"];
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "name": name, "phone": phone, "email": email};
  }


}
