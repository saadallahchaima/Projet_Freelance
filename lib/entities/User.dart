class User {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String numTel;
  final String userName;
  final DateTime dateNaissance;


  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.numTel,
    required this.userName,
    required this.dateNaissance,

  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'numTel': numTel,
      'userName': userName,
      'dateNaissance': dateNaissance.toIso8601String(),
    };
  }

  static Future<User> fromJson(decode) {
    return Future.value(User(
      firstName: decode['firstName'],
      lastName: decode['lastName'],
      email: decode['email'],
      password: decode['password'],
      numTel: decode['numTel'],
      userName: decode['userName'],
      dateNaissance: DateTime.parse(decode['dateNaissance']),
    ));
  }
}
