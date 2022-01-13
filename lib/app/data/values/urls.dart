class URLs {
  URLs._privateConstructor();

  //Config APIs
  static const appConfig = "api/config";

  //User APIs
  static const sendOTP = "api/auth/send-otp";
  static const verifyOTP = "api/auth/verify-otp";
  static const login = "https://api.service-desk.squareboat.info/auth/login?";
  static const ticketUrl = "https://api.service-desk.squareboat.info/tickets?=";
}
