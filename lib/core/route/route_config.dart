import 'package:go_router/go_router.dart';
import 'package:interview_task/src/feature/view/home_screen.dart';
import 'package:interview_task/src/feature/view/user_details_screen.dart';

import '../../src/feature/model/user_model.dart';
import 'build_page_with_transition.dart';
import 'route_name.dart';

class RouteConfig {
   static GoRouter goRouter = GoRouter(
    initialLocation: RouteName.homeScreen,

    routes: [
      GoRoute(
        name: RouteName.homeScreen,
        path: RouteName.homeScreen,
        pageBuilder: (context, state) {
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: HomeScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.userDetailsScreen,
        name: RouteName.userDetailsScreen,
        pageBuilder: (context, state) {
          final user = state.extra;
          return buildPageWithTransition(
            context: context,
            state: state,
            transitionType: PageTransitionType.slideRightToLeft,
            child: UserDetailsScreen(user: user as User),
          );
        },
      ),
    ],
  );
}
