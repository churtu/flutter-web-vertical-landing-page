import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/src/providers/page_provider.dart';
import 'package:vertical_landing_page/src/ui/pages/home_page.dart';

final homeHandler = Handler(
  handlerFunc:(context, parameters) {
    final routeName = parameters['page']?.first;
    if(routeName != '/'){
      final pageProvider = Provider.of<PageProvider>(context!, listen: false);
      pageProvider.createPageController(routeName!);
      return const HomePage();
    }
    return null;
  },
);