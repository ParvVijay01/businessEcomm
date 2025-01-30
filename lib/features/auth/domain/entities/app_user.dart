class AppUser {
  final String uid;
  final String email;
  final String name;
  final String phoneNumber;

  AppUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  //convert app user -> json
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }

  // convert json -> app user
  factory AppUser.fromJson(Map<String, dynamic> jsonUser) {
    return AppUser(
      uid: jsonUser['uid'],
      name: jsonUser['name'],
      email: jsonUser['email'],
      phoneNumber: jsonUser['phoneNumber'],
    );
  }
}
