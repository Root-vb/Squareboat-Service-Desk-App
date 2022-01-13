import 'package:get/get.dart';
import '../controllers/create_ticket_controller.dart';

class CreateTicketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CreateTicketController(),
    );
  }
}
