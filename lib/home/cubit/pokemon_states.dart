import 'package:pokebook/home/model/pokemon_details.dart';
import 'package:pokebook/home/model/pokemon_model.dart';

class PokeMonDataState {}

class InitialState extends PokeMonDataState {}

class GetPokemonDetailsLoading extends PokeMonDataState {}

class GetPokemonDetailsError extends PokeMonDataState {
  final String message;
  GetPokemonDetailsError({required this.message});
}

class GetPokemonDetailsSuccess extends PokeMonDataState {
  final PokemonDetailsModel pokemonDetailsModel;
  GetPokemonDetailsSuccess({required this.pokemonDetailsModel});
}

class GetPokemonsLoading extends PokeMonDataState {}

class GetPokemonsError extends PokeMonDataState {
  final String message;
  GetPokemonsError({required this.message});
}

class GetPokemonsSuccess extends PokeMonDataState {
  final List<MiniPokemonModel> pokemons;
  GetPokemonsSuccess({required this.pokemons});
}
