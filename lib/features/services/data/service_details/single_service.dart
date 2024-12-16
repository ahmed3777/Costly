import 'servic_detail.dart';

class SingleService {
  ServiceDetail? payload;
  bool? status;
  int? code;
  dynamic messages;

  SingleService({this.payload, this.status, this.code, this.messages});

  factory SingleService.fromJson(Map<String, dynamic> json) {
    return SingleService(
      payload: json['payload'] == null
          ? null
          : ServiceDetail.fromJson(json['payload'] as Map<String, dynamic>),
      status: json['status'] as bool?,
      code: json['code'] as int?,
      messages: json['messages'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'payload': payload?.toJson(),
        'status': status,
        'code': code,
        'messages': messages,
      };
}
