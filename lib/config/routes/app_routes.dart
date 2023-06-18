import 'package:flutter/material.dart';
import 'package:valorant_app/data/models/character_model.dart';

// import 'package:valorant_app/injection_container.dart' as di;
import 'package:valorant_app/view/screens/agents_screen.dart';
import 'package:valorant_app/view/screens/home_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String agentRoute = '/agentRoute';
}

class AppRoute {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.agentRoute:
        return MaterialPageRoute(
          builder: (context) => AgentsScreen(characterModel: routeSettings.arguments as CharacterModel),
        );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(
            'undefined Page :{',
          ),
        ),
      ),
    );
  }
}
