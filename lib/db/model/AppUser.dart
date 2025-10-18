class AppUser {
  String? id;
  String? name;
  String? phone;
  String? email;
  List<String>? favorites;

  AppUser({
    this.id,
    this.email,
    this.name,
    this.phone,
    this.favorites = const [],
  });

AppUser.fromMap(Map<String, dynamic>? map)
      : this(
          id: map?["id"],
          name: map?["name"],
          phone: map?["phone"],
          email: map?["email"],
          favorites: map?["favorites"] == null
              ? []
              : (map?["favorites"] as List<dynamic>)
                  .map((e) => e.toString())
                  .toList(),
        );

  Map<String, dynamic> toMap() {
    return {"id": id, "name": name, "phone": phone, "email": email,"favorites": favorites ?? [],};
  }
}
