import 'package:auto_route/auto_route.dart';
import 'package:pokebook/shared/navigation/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: PokemonDetails.page),
        AutoRoute(page: PokemonListRoute.page),
      ];
}
