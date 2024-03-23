// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:pokebook/home/model/pokemon_details.dart' as _i7;
import 'package:pokebook/home/widgets/pokebook_list.dart' as _i3;
import 'package:pokebook/home/widgets/pokemon_details.dart' as _i2;
import 'package:pokebook/home/widgets/root.dart' as _i1;
import 'package:pokebook/root/splash_screen.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    PokemonDetails.name: (routeData) {
      final args = routeData.argsAs<PokemonDetailsArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.PokemonDetails(
          key: args.key,
          pokemonDetails: args.pokemonDetails,
        ),
      );
    },
    PokemonListRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PokemonListPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PokemonDetails]
class PokemonDetails extends _i5.PageRouteInfo<PokemonDetailsArgs> {
  PokemonDetails({
    _i6.Key? key,
    required _i7.PokemonDetailsModel pokemonDetails,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          PokemonDetails.name,
          args: PokemonDetailsArgs(
            key: key,
            pokemonDetails: pokemonDetails,
          ),
          initialChildren: children,
        );

  static const String name = 'PokemonDetails';

  static const _i5.PageInfo<PokemonDetailsArgs> page =
      _i5.PageInfo<PokemonDetailsArgs>(name);
}

class PokemonDetailsArgs {
  const PokemonDetailsArgs({
    this.key,
    required this.pokemonDetails,
  });

  final _i6.Key? key;

  final _i7.PokemonDetailsModel pokemonDetails;

  @override
  String toString() {
    return 'PokemonDetailsArgs{key: $key, pokemonDetails: $pokemonDetails}';
  }
}

/// generated route for
/// [_i3.PokemonListPage]
class PokemonListRoute extends _i5.PageRouteInfo<void> {
  const PokemonListRoute({List<_i5.PageRouteInfo>? children})
      : super(
          PokemonListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PokemonListRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
