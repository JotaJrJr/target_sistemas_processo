class UserModel {
  String? user;
  String? email;
  String? password;
  final bool isLogged;

  UserModel({
    this.user,
    this.email,
    this.password,
    this.isLogged = true,
  });
}
