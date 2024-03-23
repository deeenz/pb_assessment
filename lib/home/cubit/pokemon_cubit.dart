import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokebook/configs/app_startup.dart';
import 'package:pokebook/generated/l10n.dart';
import 'package:pokebook/home/cubit/pokemon_states.dart';
import 'package:pokebook/home/model/pokemon_details.dart';
import 'package:pokebook/home/model/pokemon_model.dart';
import 'package:pokebook/home/services/pokemon_service.dart';
import 'package:pokebook/shared/network/network_request.dart';

class PokemonDataCubit extends Cubit<PokeMonDataState> {
  PokemonDataService apiService;
  PokemonDataCubit({required this.apiService}) : super(InitialState());

  Future<PokemonDetailsModel?> getDetails(String nameOrId,
      {bool rethrowError = false}) async {
    try {
      Response response = await apiService.getPokemonDetails(nameOrId);

      if (response.isSuccessful) {
        PokemonDetailsModel model = PokemonDetailsModel.fromJson(response.data);

        return model;
      }
    } catch (e) {
      if (rethrowError) {
        rethrow;
      }
    }
    return null;
  }

  void getPokemonDetails(String nameOrId) async {
    emit(GetPokemonDetailsLoading());

    try {
      Response response = await apiService.getPokemonDetails(nameOrId);

      if (response.isSuccessful) {
        PokemonDetailsModel model = PokemonDetailsModel.fromJson(response.data);
        emit(GetPokemonDetailsSuccess(pokemonDetailsModel: model));
      }
    } catch (e) {
      if (e is DioError) {
        emit(GetPokemonDetailsError(message: e.response.toString()));
        return null;
      }

      emit(
        GetPokemonDetailsError(message: S.current.anErrorOccurred),
      );
    }
    return null;
  }

  void getPokemons() async {
    emit(GetPokemonsLoading());
    try {
      Response response = await apiService.getPokemons();

      if (response.isSuccessful) {
        // store pokemons to getit for global access
        List<MiniPokemonModel> pokemons = (response.data['results'] as Iterable)
            .map((e) => MiniPokemonModel.fromJson(e))
            .toList();

        getIt.registerSingleton(pokemons);
        emit(GetPokemonsSuccess(pokemons: pokemons));
      }
    } catch (e) {
      if (e is DioError) {
        emit(GetPokemonsError(message: e.response.toString()));
        return;
      }

      emit(
        GetPokemonsError(message: S.current.anErrorOccurred),
      );
    }
  }
}
