import 'all_services.dart';

class ServiceType {
  final List<AllServices> payload;
  final bool status;
  final int code;
  final String? messages;

  ServiceType({
    required this.payload,
    required this.status,
    required this.code,
    this.messages,
  });

  factory ServiceType.fromJson(Map<String, dynamic> json) {
    var payloadList = (json['payload'] as List)
        .map((item) => AllServices.fromJson(item))
        .toList();

    return ServiceType(
      payload: payloadList,
      status: json['status'],
      code: json['code'],
      messages: json['messages'],
    );
  }
}
