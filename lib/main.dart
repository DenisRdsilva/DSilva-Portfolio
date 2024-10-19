import 'package:flutter/material.dart';

import 'views/error_view.dart';
import 'views/home_view.dart';

void main() {
  runApp(const Portfol());
}

class Portfol extends StatelessWidget {
  const Portfol({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DSilvaPortfolio",
      home: const HomePage(),
      theme: ThemeData(
          colorScheme: colorTheme),
      onGenerateRoute: (settings) {
        if (settings.name == null) {
          return null;
        }

        final routeName = settings.name!;

        WidgetBuilder builder;
        switch (routeName) {
          default:
            builder = (context) => const ErrorPage();
        }

        return MaterialPageRoute(builder: builder, settings: settings);
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (_) => const ErrorPage()),
    );
  }
}

ColorScheme colorTheme = ColorScheme(
    brightness: Brightness.light,
    primary: Colors.white,
    onPrimary: Colors.black,
    secondary: Color.fromARGB(255, 39, 28, 110),
    onSecondary: Color.fromARGB(255, 39, 28, 110),
    error: Colors.red,
    onError: Colors.red,
    surface: Colors.white,
    onSurface: Colors.white);
