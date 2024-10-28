class RouteNames {
  static const String splash = "splash";
  static const String login = "login";
  static const String home = "";
  static const String detail = "detail";
  static const String register = "register";
  static const String profile = "profile";
  static const String counter = "counter";
}

extension GorouterPath on String {
  String path() => '/$this';
}
