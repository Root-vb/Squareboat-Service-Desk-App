class URLs {
  URLs._privateConstructor();

  //Config APIs
  static const appConfig = "api/config";

  //User APIs
  static const sendOTP = "api/auth/send-otp";
  static const verifyOTP = "api/auth/verify-otp";
  static const login = "https://api.service-desk.squareboat.info/auth/login?";
  static const ticketUrl = "https://api.service-desk.squareboat.info/tickets?";
  static const paginatedTicketUrl =
      "https://api.service-desk.squareboat.info/tickets?pagination=true&page=";
  static const createGeneralTicket =
      "https://api.service-desk.squareboat.info/tickets?=";

  static const createDeploymentTicketUrl =
      "https://api.service-desk.squareboat.info/tickets?=";

  static const getCommentUrl =
      "https://api.service-desk.squareboat.info/tickets/";
  static const postCommentUrl =
      "https://api.service-desk.squareboat.info/tickets/";

  static const partcipantsUrl =
      "https://api.service-desk.squareboat.info/users/developers?id=1";

  static const updateTicketUrl =
      "https://api.service-desk.squareboat.info/tickets/";

  static const performAction =
      "https://api.service-desk.squareboat.info/tickets/";

  static const devopsUrl =
      "https://api.service-desk.squareboat.info/users/devops?id=1";

  static const myProfile =
      "https://api.service-desk.squareboat.info/users/my-profile";
}
