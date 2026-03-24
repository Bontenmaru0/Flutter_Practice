import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import 'screens/blog/home.pr.dart';

void main() {
  runApp(const MainApp());
}

final router = GoRouter(
  routes: [GoRoute(path: '/', builder: (context, state) => HomeScreen())],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.white,),
        scaffoldBackgroundColor: Colors.white,
      ),
      scrollBehavior: ScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.unknown
        }
      ),
    );
  }
}
