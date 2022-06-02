import 'package:fluro/fluro.dart';
import 'package:vertical_landing_page/ui/pages/home_page.dart';

//HomePage
final Handler homeHandler = Handler(
  handlerFunc: ((context, parameters) {
    final page = parameters['page']!.first;

    if (page != '/') {
      return const HomePage();
    }
    return null;

  }),
);
