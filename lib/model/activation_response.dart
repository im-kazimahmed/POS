// models/activation_response.dart
class ActivationResponse {
  final bool success;
  final String message;

  ActivationResponse({required this.success, required this.message});

  factory ActivationResponse.fromJson(Map<String, dynamic> json) {
    return ActivationResponse(
      success: json['success'],
      message: json['message'],
    );
  }
}
