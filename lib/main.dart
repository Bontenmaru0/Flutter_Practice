import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_practice/models/practice_1/counter.model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'screens/blog/home.pr.dart';
import 'screens/practice_1/counter.pr.dart';
import 'screens/practice_2/counter.pr.dart';

void main() {
  runApp(const MainApp());
}

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(
      path: '/counter_cnp',
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => CounterModel(),
        child: CounterCNPScreen(),
      ),
    ),
    GoRoute(path: '/counter_vn', builder: (context, state) => CounterVNScreen(),),
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
