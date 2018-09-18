class User {
  final String username;
  final String password;
  final String displayName;
  final String tokenId;

  User(this.username, this.password, this.displayName, this.tokenId);

  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'],
        displayName = json['displayName'],
        tokenId = json['tokenId'];

  Map<String, dynamic> toJson() =>
    {
      'usernaem': username,
      'password': password,
      'displayName': displayName,
      'tokenId': tokenId
    };
}