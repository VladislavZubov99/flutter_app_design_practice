import 'package:flutter/material.dart';
import 'package:app/application/ui/navigation/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const mainScreen = '/';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();

  static final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.mainScreen: (_) => _screenFactory.makeMainScreen(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case MainNavigationRouteNames.userDetails:
      //   final arguments = settings.arguments;
      //   final userId = arguments is int ? arguments : 0;
      //   return MaterialPageRoute(builder: (context) => UserDetailsScreen(userId: userId));
      default:
        const widget = Text('Page not found: 404');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }

  static void resetNavigation(NavigatorState state) {
    state.pushNamedAndRemoveUntil(
      MainNavigationRouteNames.mainScreen,
      (route) => false,
    );
  }
}
