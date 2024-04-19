import 'package:go_router/go_router.dart';
import 'package:todo_app_flutter/presentation/pages/add_page.dart';
import 'package:todo_app_flutter/presentation/pages/edit_page.dart';
import 'package:todo_app_flutter/presentation/pages/home_page.dart';

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
      GoRoute(
        path: "/edit",
        builder: (context, state) => EditPage(
          id: state.extra as int,
        ),
      ),
    ],
    initialLocation: "/",
    // initialLocation: "/add",
  );
}
