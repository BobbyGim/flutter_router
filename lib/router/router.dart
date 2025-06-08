import 'package:flutter_router/screen/1_basic_screen.dart';
import 'package:flutter_router/screen/2_named_screen.dart';
import 'package:flutter_router/screen/3_push_screen.dart';
import 'package:flutter_router/screen/4_pop_base_screen.dart';
import 'package:flutter_router/screen/5_pop_return_screen.dart';
import 'package:flutter_router/screen/6_path_param_screen.dart';
import 'package:flutter_router/screen/root_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => RootScreen(),
      routes: [
        GoRoute(
          path: "basic",
          name: "basic",
          builder: (context, state) => BasicScreen(),
        ),
        GoRoute(
          path: "named",
          name: "named",
          builder: (context, state) => NamedScreen(),
        ),
        GoRoute(
          path: "push",
          name: "push",
          builder: (context, state) => PushScreen(),
        ),
        GoRoute(
          path: "pop",
          name: "pop",
          builder: (context, state) => PopBaseScreen(),
          routes: [
            GoRoute(
              path: "return",
              name: "return",
              builder: (context, state) => PopReturnScreen(),
            ),
          ],
        ),
        GoRoute(
          path: "path_param/:id",
          builder: (context, state) {
            return PathParamScreen();
          },
          routes: [
            GoRoute(
              path: ":name",
              builder: (context, state) {
                return PathParamScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: "query_param",
          builder: (context, state) {
            return PathParamScreen();
          },
        ),
      ],
    ),
  ],
);
