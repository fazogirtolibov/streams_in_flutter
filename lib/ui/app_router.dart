import 'package:flutter/material.dart';
import 'package:stream_flutter/ui/first_page.dart';
import 'package:stream_flutter/ui/home_page.dart';
import 'package:stream_flutter/ui/second_page.dart';
import 'package:stream_flutter/ui/third_page.dart';

abstract class RoutName {
  static const home = 'home';
  static const first = 'first';
  static const second = 'second';
  static const third = 'third';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutName.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case RoutName.first:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => FirstPage(
            number: args['number'],
          ),
        );

      case RoutName.second:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => SecondPage(
            number: args['number'],
          ),
        );

      case RoutName.third:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ThirdPage(
            number: args['number'],
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
