import 'package:flutter/widgets.dart';
import 'package:flutter_router/screen/10_transition_screen_1.dart';
import 'package:flutter_router/screen/10_transition_screen_2.dart';
import 'package:flutter_router/screen/1_basic_screen.dart';
import 'package:flutter_router/screen/2_named_screen.dart';
import 'package:flutter_router/screen/3_push_screen.dart';
import 'package:flutter_router/screen/4_pop_base_screen.dart';
import 'package:flutter_router/screen/5_pop_return_screen.dart';
import 'package:flutter_router/screen/6_path_param_screen.dart';
import 'package:flutter_router/screen/8_nested_child_screen.dart';
import 'package:flutter_router/screen/8_nested_screen.dart';
import 'package:flutter_router/screen/9_login_screen.dart';
import 'package:flutter_router/screen/9_private_screen.dart';
import 'package:flutter_router/screen/root_screen.dart';
import 'package:go_router/go_router.dart';

bool authState = false;

final router = GoRouter(
  redirect: (context, state) {
    if (state.fullPath == "/login/private" && !authState) {
      return "/login";
    }
    return null;
  },
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
        GoRoute(
          path: "login",
          builder: (context, state) => LoginScreen(),
          routes: [
            GoRoute(
              path: "private",
              builder: (context, state) {
                return PrivateScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: "login2",
          builder: (context, state) => LoginScreen(),
          routes: [
            GoRoute(
              path: "private",
              builder: (context, state) {
                return PrivateScreen();
              },
              redirect: (context, state) {
                if (!authState) {
                  return "/login2";
                }
                return null;
              },
            ),
          ],
        ),
        ShellRoute(
          routes: [
            GoRoute(
              path: "nested/a",
              builder: (context, state) =>
                  NestedChildScreen(routedName: "nested/a"),
            ),
            GoRoute(
              path: "nested/b",
              builder: (context, state) =>
                  NestedChildScreen(routedName: "nested/b"),
            ),
            GoRoute(
              path: "nested/c",
              builder: (context, state) =>
                  NestedChildScreen(routedName: "nested/c"),
            ),
          ],
          builder: (context, state, child) {
            return NestedScreen(child: child);
          },
        ),
        GoRoute(
          path: "transition",
          builder: (context, state) {
            return TransitionScreenOne();
          },
          routes: [
            GoRoute(
              path: "detail",
              builder: (context, state) {
                return TransitionScreenTwo();
              },
              pageBuilder: (_, state) {
                return CustomTransitionPage(
                  child: TransitionScreenTwo(),
                  transitionDuration: const Duration(milliseconds: 1000),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
