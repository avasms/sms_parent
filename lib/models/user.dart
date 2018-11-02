class User {
  final String username;
  final String password;
  final String displayName;
  final String tokenId;
  final String userId;
  final String parentId;
  

  User(this.username, this.password, this.displayName, this.tokenId,this.userId,this.parentId);

  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'],
        displayName = json['displayName'],
        tokenId = json['tokenId'],
        userId = json['userId'],
        parentId = json['parentId']
        ;

  Map<String, dynamic> toJson() =>
    {
      'usernaem': username,
      'password': password,
      'displayName': displayName,
      'tokenId': tokenId,
      'userId': userId,
      'parentId': parentId
    };
}