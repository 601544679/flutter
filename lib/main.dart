import 'package:flutter/material.dart';
import 'bodyView.dart';
import 'detailPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = {
    '/detail': (context, {arguments}) => detailPage(orderNumber: arguments,departure: arguments,driverName: arguments)
  };

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: bodyView(),
      // ignore: missing_return
      onGenerateRoute: (RouteSettings settings) {
        final String name = settings.name;
        final Function pageContentBuilder = this.routes[name];
        if (pageContentBuilder != null) {
          if (settings.arguments != null) {
            final Route route = MaterialPageRoute(
                builder: (context) =>
                    pageContentBuilder(context, arguments: settings.arguments));
            return route;
          } else {
            final Route route = MaterialPageRoute(
                builder: (context) => pageContentBuilder(context));
            return route;
          }
        }
      },
    );
  }
}
