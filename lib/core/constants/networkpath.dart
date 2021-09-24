class NetworkPath {
  static var shared = NetworkPath();
  final String SENDMAIL = "/auth/sendmail";
  final String REGISTER = "/register";
  final String CHECKIFREGISTRATED = "/checkregistration";
  final String LOGIN = "/login";
  final String CHECKIACCEXIST = "/checkaccount";
  final String GETUSERBYTOKEN = "/getuser";
}
