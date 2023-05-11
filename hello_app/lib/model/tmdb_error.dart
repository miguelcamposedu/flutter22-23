
class TmdbErrorResponse {
  int? statusCode;
  String? statusMessage;
  bool? success;

  TmdbErrorResponse({this.statusCode, this.statusMessage, this.success});

  TmdbErrorResponse.fromJson(Map<String, dynamic> json) {
    if(json["status_code"] is int) {
      statusCode = json["status_code"];
    }
    if(json["status_message"] is String) {
      statusMessage = json["status_message"];
    }
    if(json["success"] is bool) {
      success = json["success"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status_code"] = statusCode;
    _data["status_message"] = statusMessage;
    _data["success"] = success;
    return _data;
  }
}