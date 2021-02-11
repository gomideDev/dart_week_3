import 'package:dw3_pizz_delivery_api/application/routers/IRouterConfigure.dart';
import 'package:dw3_pizz_delivery_api/modules/users/users_router.dart';
import 'package:shelf_router/src/router.dart';

class RouterConfigure {
  final Router _router;
  final List<IRouterConfigure> routers = [UsersRouter()];

  RouterConfigure(this._router);

  void configure() {
    routers.forEach((r) => r.configure(_router));
  }
}
