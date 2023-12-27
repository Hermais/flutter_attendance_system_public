class AuthGet {
  final int userType;
  final int id;

  AuthGet({required this.userType, required this.id});

  factory AuthGet.fromJson(Map<String, dynamic> json) {
    return AuthGet(
      userType: json['userType'],
      id: json['id'],
    );
  }

}