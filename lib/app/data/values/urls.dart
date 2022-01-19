class URLs {
  URLs._privateConstructor();

  //Config APIs
  static const appConfig = "api/config";

  //User APIs
  static const sendOTP = "api/auth/send-otp";
  static const verifyOTP = "api/auth/verify-otp";
  static const login = "https://api.service-desk.squareboat.info/auth/login?";
  static const ticketUrl = "https://api.service-desk.squareboat.info/tickets?=";
  static const paginatedTicketUrl =
      "https://api.service-desk.squareboat.info/tickets?pagination=true&page=";
  static const createGeneralTicket =
      "https://api.service-desk.squareboat.info/tickets?=";

  static const createDeploymentTicketUrl =
      "https://api.service-desk.squareboat.info/tickets?=";
}
