class User {
  final String id;
  final String email;
  final String password;
  final String token;

  User({this.id, this.email, this.password, this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["email"] = email;
    map["password"] = password;

    return map;
  }
}