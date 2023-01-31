
import 'package:fluro/fluro.dart';
import 'package:vertical_landing_page/src/router/handlers.dart';

class AppRouter {

  static final router = FluroRouter();

  static void configureRoutes(){
    router.define(
      '/:page', 
      handler: homeHandler
    );
    
    router.notFoundHandler = homeHandler;
  }
}