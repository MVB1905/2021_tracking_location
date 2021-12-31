class User {
  User({
    required this.data,
    required this.status,
  });

  List<Datum> data;
  int status;

  factory User.fromJson(Map<String, dynamic> json) => User(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    status: json["status"],
  );
}

class Datum {
  Datum({
    required this.uuid,
    required this.username,
    required this.password,
    required this.name,
    required this.role,
  });

  String uuid;
  String username;
  String password;
  String name;
  int role;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    uuid: json["uuid"],
    username: json["username"],
    password: json["password"],
    name: json["name"],
    role: json["role"],
  );
}
