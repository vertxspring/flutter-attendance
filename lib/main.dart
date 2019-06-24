import 'package:flutter/material.dart';

import 'scaffolds/admin_scaffold.dart';
import 'scaffolds/user_scaffold.dart';
import 'screens/admin_screens/dummy_admin1.dart';
import 'screens/admin_screens/dummy_admin2.dart';
import 'screens/loading_screen.dart';
import 'screens/login_screen.dart';
import 'services/login_service.dart';

LoginService loginService = LoginService();

Future main() async {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/admin': (context) =>
            AdminScaffold(body: DummyAdmin1(), title: 'Dummy Screen 1'),
        '/admin2': (context) =>
            AdminScaffold(body: DummyAdmin2(), title: 'Dummy Screen 2'),
        '/user': (context) =>
            UserScaffold(body: DummyAdmin1(), title: 'Dummy Screen 1'),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
