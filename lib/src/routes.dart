import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/slot.dart';
import 'package:flutter_app/src/pages/splash.dart';
import 'package:flutter_app/src/widgets/cus_route.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => Splash(),
      '/Slot': (_) => Slot(),
    };
  }
  static Route onGenerateRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name.split('/');
    if (pathElements[0]!= '' || pathElements.length == 1) {
      return null;
    }
    switch (pathElements[1]) {
      case "ScoreBoard":
        return Cus_Route<bool>(
          builder: (BuildContext context) => null
        );
    }
  }
}