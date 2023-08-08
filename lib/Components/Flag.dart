class Flag {
  final String message;
  final DateTime dateTime;
  final String rideCode;

  Flag(this.message, this.dateTime, this.rideCode);

  Flag.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        dateTime = json['dateTime'],
        rideCode = json['rideCode'];

  Map<String, dynamic> toJson() =>
      {'message': message, 'dateTime': dateTime, 'rideCode': rideCode};
}
