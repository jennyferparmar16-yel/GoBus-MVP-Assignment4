class AppConfig {
  static const bool isProduction = false;

  static String get apiUrl {
    return isProduction
        ? "https://api.gobus.com"
        : "https://dev-api.gobus.com";
  }
}