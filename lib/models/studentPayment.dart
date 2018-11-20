class StudentPayment{
  int id;String amount;
  String paymentDate;String payAmount;
  String status;String invoiceNo;
  String balance;String lastBalance;
  String studentId;String paymentMethodId;
  String classLevelId;String fromDate;
  String toDate;String className;
  String studentName;String payName;

  StudentPayment({
    this.id,this.amount,
    this.paymentDate,this.payAmount,
    this.status,this.invoiceNo,
    this.balance,this.lastBalance,
    this.studentId,this.paymentMethodId,
    this.classLevelId,this.fromDate,
    this.toDate,this.className,
    this.studentName,this.payName

  });

  factory StudentPayment.fromJson(Map<String,dynamic>json){
    return StudentPayment(

    );
  }
}