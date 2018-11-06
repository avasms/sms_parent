
class Message {
  int id;
  String title;
  String messageText;
  String sendDate;
  String senderName;
  String senderId;
  String receiverId;
  String receiverName;

  Message({
    this.id,
    this.title,
    this.messageText,
    this.sendDate,
    this.senderName,
    this.senderId,
    this.receiverId,
    this.receiverName
  });
 
 Message.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        messageText = json['messageText'],
        sendDate = json['sendDate'],
        senderName = json['senderName'],
        senderId = json['senderId'] as String,
        receiverId = json['receiverId'] as String,
        receiverName = json['receiverName'] as String
        ;
        

  Map<String, dynamic> toJson() =>
    {
      'id': id,
      'title': title,
      'messageText': messageText,
      'sendDate': sendDate,
      'senderName': senderName,
      'senderId': senderId,
      'receiverId': receiverId,
      'receiverName': receiverName,
    };
}



