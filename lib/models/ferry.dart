class Transport{
  int id;
  String name;
  String vehicleNo;
  String routeFare;
  String schoolName;
  String driverName;
  Transport({
    this.id,
    this.name,
    this.vehicleNo,
    this.routeFare,
    this.schoolName,
    this.driverName,

 });


 factory Transport.fromJson(Map<String, dynamic> json) {
    return Transport(
      id: json['id'] as int,
      name: json['name'] as String,
      vehicleNo: json['vehicleNo'] as String,
      routeFare: json['routeFare'] as String,
      schoolName: json['schoolName'] as String,
      driverName: json['driverName'] as String,
    );
  }
}

