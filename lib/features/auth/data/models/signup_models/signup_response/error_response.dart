class ErrorResponse {
  final bool status;
  final int code;
  final Map<String, List<String>> messages;

  ErrorResponse(
      {required this.status, required this.code, required this.messages});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      status: json['status'],
      code: json['code'],
      messages: Map<String, List<String>>.from(json['messages']),
    );
  }
}
