import 'package:go_router/go_router.dart';
import 'package:go_router_basics/pages/about.dart';
import 'package:go_router_basics/pages/contact.dart';
import 'package:go_router_basics/pages/home.dart';
import 'package:go_router_basics/pages/profile.dart';

class MyAppRouter {
  static GoRouter returnRouter() {
    GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: "/",
          builder: (context, state) {
            return Home();
          },
        ),
        GoRoute(
          path: "/about",
          builder: (context, state) {
            return About();
          },
        ),
        GoRoute(
          path: "/profile",
          builder: (context, state) {
            return Profile();
          },
        ),
        GoRoute(
          path: "/contactus",
          builder: (context, state) {
            return ContactUs();
          },
        ),
      ],
    );
    return router;
  }
}
