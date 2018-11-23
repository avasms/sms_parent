class StudentPayment{
  int id;double amount;
  String paymentDate;double payAmount;
  double balance;double lastBalance;
  String className;
  String studentName;String payName;

  StudentPayment({
    this.id,this.amount,
    this.paymentDate,this.payAmount,
    this.balance,this.lastBalance,
    this.className,
    this.studentName,this.payName,

  });

  factory StudentPayment.fromJson(Map<String,dynamic>json){
    return StudentPayment(
      id: json['id'] as int,
      amount: json['amount'] as double,
      payAmount: json['payAmount'] as double,
      paymentDate: json['paymentDate'] as String,
      balance: json['balance'] as double,
      lastBalance: json['lastBalance'] as double,
      className: json['className'] as String,
      studentName: json['studentName'] as String,
      payName: json['payName'] as String,

    );
  }
}