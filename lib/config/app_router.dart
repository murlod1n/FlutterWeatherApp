import 'package:auto_route/auto_route.dart';

import '../presentation/ui/pages/splash_page.dart';
import '../presentation/ui/pages/home_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: SplashRoute.page, initial: true)
  ];

}

final appRouter = AppRouter();