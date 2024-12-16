class MainResponseModel<T> {
  final List<T> payload;
  final bool status;
  final int code;
  final String? messages;
  MainResponseModel(
      {required this.payload,
      required this.status,
      required this.code,
      this.messages});
  // Factory constructor to create a MainResponseModel from JSON
  factory MainResponseModel.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    var list = json['payload'] as List;
    List<T> payloadList = list.map((i) => fromJsonT(i)).toList();

    return MainResponseModel(
      payload: payloadList,
      status: json['status'],
      code: json['code'],
      messages: json['messages'],
    );
  }

  // Method to convert MainResponseModel to JSON
  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    return {
      'payload': payload.map((item) => toJsonT(item)).toList(),
      'status': status,
      'code': code,
      'messages': messages,
    };
  }
}
