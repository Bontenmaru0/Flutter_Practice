import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_practice/models/counter/counter.model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'screens/blog/home.pr.dart';
import 'package:flutter_practice/screens/practice_1/counter.pr.dart';

void main() {
  runApp(const MainApp());
}

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(
      path: '/counter',
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => CounterModel(),
        child: CounterWidget(),
      ),
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
      ),
      scrollBehavior: ScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.unknown,
        },
      ),
    );
  }
}
