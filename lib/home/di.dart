import 'package:get_it/get_it.dart';
import 'package:pokebook/configs/app_configs.dart';
import 'package:pokebook/home/cubit/pokemon_cubit.dart';
import 'package:pokebook/home/services/pokemon_service.dart';
import 'package:pokebook/shared/network/network_request.dart';

setupHomeServices(GetIt ioc) {
  ioc.registerSingleton<PokemonDataCubit>(PokemonDataCubit(
    apiService: PokemonDataService(httpService: HttpService(baseUrl: "${AppURL.baseUrl}/pokemon/"))
  ));
}
