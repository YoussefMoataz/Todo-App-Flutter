import 'package:go_router/go_router.dart';
import 'package:todo_app_flutter/presentation/pages/HomePage.dart';
import 'package:todo_app_flutter/presentation/pages/add_page.dart';

class Routing {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: "/add",
        builder: (context, state) => AddPage(),
      ),
    ],
    initialLocation: "/",
    // initialLocation: "/add",
  );
}
