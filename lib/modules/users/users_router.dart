import 'package:dw3_pizz_delivery_api/application/routers/IRouterConfigure.dart';
import 'package:shelf_router/src/router.dart';

import 'controller/user_controller.dart';

class UsersRouter implements IRouterConfigure {
  @override
  void configure(Router router) {
    router.mount('/user', UserController().router);
  }
}
