import 'package:get/get.dart';
import 'package:starter/app/modules/dashboard/dashboard_binding.dart';
import 'package:starter/app/modules/dashboard/dashboard_view.dart';
import 'package:starter/app/modules/partcipants/bindings/partcipants_binding.dart';
import 'package:starter/app/modules/partcipants/views/partcipants_view.dart';
import 'package:starter/app/modules/profile/profile_binding.dart';
import 'package:starter/app/modules/profile/profile_view.dart';
import 'package:starter/app/modules/users/bindings/users_binding.dart';
import 'package:starter/app/modules/users/views/users_view.dart';

import '../modules/auth/login/bindings/auth_login_binding.dart';
import '../modules/auth/login/views/auth_login_view.dart';

import '../modules/create_ticket/bindings/create_ticket_binding.dart';
import '../modules/create_ticket/views/create_ticket_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/showcomments/bindings/showcomments_binding.dart';
import '../modules/showcomments/views/showcomments_view.dart';
import '../modules/showupdate/bindings/showupdate_binding.dart';
import '../modules/showupdate/views/showupdate_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/ticket/bindings/ticket_binding.dart';
import '../modules/ticket/views/ticket_view.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.AUTH_LOGIN,
      page: () => AuthLoginView(),
      binding: AuthLoginBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.CREATE_TICKET,
      page: () => CreateTicketView(),
      binding: CreateTicketBinding(),
    ),
    GetPage(
      name: Routes.TICKET,
      page: () => TicketView(),
      binding: TicketBinding(),
    ),
    GetPage(
      name: Routes.PARTICIPANTS,
      page: () => PartcipantsView(),
      binding: PartcipantsBinding(),
    ),
    GetPage(
      name: Routes.SHOWUPDATE,
      page: () => ShowupdateView(),
      binding: ShowupdateBinding(),
    ),
    GetPage(
      name: Routes.SHOWCOMMENTS,
      page: () => ShowcommentsView(),
      binding: ShowcommentsBinding(),
    ),
    GetPage(
      name: Routes.USERS,
      page: () => UsersView(),
      binding: UsersBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
