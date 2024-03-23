import 'package:dio/dio.dart';
import 'package:pokebook/shared/network/network_request.dart';

class PokemonDataService {
  final HttpService httpService;

  PokemonDataService({required this.httpService});

  Future<Response> getPokemonDetails(String nameOrId) {
    return httpService.getRequest(nameOrId);
  }

  Future<Response> getPokemons() {
    // get 500 pokemons
    return httpService.getRequest("", queryParameters: {"limit": 500});
  }
}
