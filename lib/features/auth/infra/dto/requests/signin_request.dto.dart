class SignInRequestDTO {
  final String login;
  final String password;

  SignInRequestDTO({
    required this.login,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'password': password,
    };
  }
}
