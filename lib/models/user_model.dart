class UserDataModel {
  UserDataModel({
    required this.username,
    required this.email,
  });
  late final String username;
  late final String email;

  UserDataModel.fromJson(Map<String, dynamic> json) {
    username = json['username'] ?? '';
    email = json['email'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
    };
  }
}

