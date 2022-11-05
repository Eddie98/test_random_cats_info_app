import 'package:flutter/widgets.dart';

import 'ui/pages/history/history.dart';
import 'ui/pages/home/home.dart';

class Routes {
  static const String homeLink = '/';
  static const String historyLink = '/history';

  static Route<T> fadeThrough<T>(
    WidgetBuilder page, {
    RouteSettings? settings,
    int duration = 300,
  }) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => page(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return fadeThrough((context) {
      if (settings.name == homeLink) {
        return const HomePage();
      }
      if (settings.name == historyLink) {
        return const HistoryPage();
      }
      return const HomePage();
    }, settings: settings);
  }
}
