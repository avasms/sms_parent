class User {
  final String username;
  final String password;
  final String displayName;
  final bool enable;

  User(this.username, this.password, this.displayName, this.enable);

  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'],
        displayName = json['displayName'],
        enable = json['enable'];

  Map<String, dynamic> toJson() =>
    {
      'usernaem': username,
      'password': password,
      'displayName': displayName,
      'enable': enable
    };
}