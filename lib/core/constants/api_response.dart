class ResponseCode {
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int unauthorised = 401; // failure, user is not authorised
  static const int forbidden = 403; //  failure, API rejected request
  static const int internalServerError = 500; // failure, crash in server side
  static const int notFound = 404; // failure, not found
  static const int invalidData = 422; // failure, not found

  // local status code
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int locationDenied = -7;
  static const int defaultError = -8;
  static const int connectionError = -9;
}

class ResponseMessage {
  static const String success = "Success"; // success with data
  static const String noContent = "Success with not content"; // success with no data (no content)
  static const String badRequest = "Some thing went wrong. try again later"; // failure, API rejected request
  static const String unauthorised = "User unauthorized, try again later"; // failure, user is not authorised
  static const String forbidden = "Forbidden request. try again later"; //  failure, API rejected request
  static const String internalServerError = "Some thing went wrong, try again later"; // failure, crash in server side
  static const String notFound = "Url not found, try again later"; // failure, crash in server side

  // local status code
  static const String connectTimeout = "Time out, try again late";
  static const String cancel = "Some thing went wrong, try again later";
  static const String receiveTimeout = "Receive Time out, try again later";
  static const String sendTimeout = "Send Time out, try again later";
  static const String cacheError = "Cache error, try again later";
  static const String noInternetConnection = "Please check your internet connection";
  static const String defaultError = "Server Error, try again later";
  static const String connectionError = "Network Connection Error, Please try again later";
}
