class ApiConstants {
  static const String apiBaseUrl = "https://test.kafiil.com/";

  static const String login = "api/test/user/login";
  static const String register = "api/test/user/register";
  static const String appDependencies = "api/test/dependencies";
  static const String whoAmI = "api/test/user/who-am-i";
  static const String services = "api/test/service";
  static const String popularServices = "api/test/service/popular";
  static const String countries = "api/test/country";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
