class Data {
  String? subject;
  String? message;
  String? tripId;
  String? dataFor;
  String? action;

  Data({
    this.subject,
    this.message,
    this.tripId,
    this.dataFor,
    this.action,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        subject: json['subject'] as String?,
        message: json['message'] as String?,
        tripId: json['trip_id'] as String?,
        dataFor: json['for'] as String?,
        action: json['action'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'subject': subject,
        'message': message,
        'trip_id': tripId,
        'for': dataFor,
        'action': action,
      };
}
