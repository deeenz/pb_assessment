class PokemonDetailsModel {
  final int? id;
  final String? name;
  final int? baseExperience;
  final int? height;
  final bool? isDefault;
  final int? order;
  final int? weight;
  final List<Abilities>? abilities;
  final List<Forms>? forms;
  final String? locationAreaEncounters;
  final List<Moves>? moves;
  final Species? species;
  final Sprites? sprites;
  final Cries? cries;
  final List<Stats>? stats;
  final List<Types>? types;
  final List<PastTypes>? pastTypes;

  PokemonDetailsModel({
    this.id,
    this.name,
    this.baseExperience,
    this.height,
    this.isDefault,
    this.order,
    this.weight,
    this.abilities,
    this.forms,
    this.locationAreaEncounters,
    this.moves,
    this.species,
    this.sprites,
    this.cries,
    this.stats,
    this.types,
    this.pastTypes,
  });

  PokemonDetailsModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        baseExperience = json['base_experience'] as int?,
        height = json['height'] as int?,
        isDefault = json['is_default'] as bool?,
        order = json['order'] as int?,
        weight = json['weight'] as int?,
        abilities = (json['abilities'] as List?)
            ?.map((dynamic e) => Abilities.fromJson(e as Map<String, dynamic>))
            .toList(),
        forms = (json['forms'] as List?)
            ?.map((dynamic e) => Forms.fromJson(e as Map<String, dynamic>))
            .toList(),
        locationAreaEncounters = json['location_area_encounters'] as String?,
        moves = (json['moves'] as List?)
            ?.map((dynamic e) => Moves.fromJson(e as Map<String, dynamic>))
            .toList(),
        species = (json['species'] as Map<String, dynamic>?) != null
            ? Species.fromJson(json['species'] as Map<String, dynamic>)
            : null,
        sprites = (json['sprites'] as Map<String, dynamic>?) != null
            ? Sprites.fromJson(json['sprites'] as Map<String, dynamic>)
            : null,
        cries = (json['cries'] as Map<String, dynamic>?) != null
            ? Cries.fromJson(json['cries'] as Map<String, dynamic>)
            : null,
        stats = (json['stats'] as List?)
            ?.map((dynamic e) => Stats.fromJson(e as Map<String, dynamic>))
            .toList(),
        types = (json['types'] as List?)
            ?.map((dynamic e) => Types.fromJson(e as Map<String, dynamic>))
            .toList(),
        pastTypes = (json['past_types'] as List?)
            ?.map((dynamic e) => PastTypes.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'base_experience': baseExperience,
        'height': height,
        'is_default': isDefault,
        'order': order,
        'weight': weight,
        'abilities': abilities?.map((e) => e.toJson()).toList(),
        'forms': forms?.map((e) => e.toJson()).toList(),
        'location_area_encounters': locationAreaEncounters,
        'moves': moves?.map((e) => e.toJson()).toList(),
        'species': species?.toJson(),
        'sprites': sprites?.toJson(),
        'cries': cries?.toJson(),
        'stats': stats?.map((e) => e.toJson()).toList(),
        'types': types?.map((e) => e.toJson()).toList(),
        'past_types': pastTypes?.map((e) => e.toJson()).toList()
      };
}

class Abilities {
  final bool? isHidden;
  final int? slot;
  final Ability? ability;

  Abilities({
    this.isHidden,
    this.slot,
    this.ability,
  });

  Abilities.fromJson(Map<String, dynamic> json)
      : isHidden = json['is_hidden'] as bool?,
        slot = json['slot'] as int?,
        ability = (json['ability'] as Map<String, dynamic>?) != null
            ? Ability.fromJson(json['ability'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'is_hidden': isHidden, 'slot': slot, 'ability': ability?.toJson()};
}

class Ability {
  final String? name;
  final String? url;

  Ability({
    this.name,
    this.url,
  });

  Ability.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class Forms {
  final String? name;
  final String? url;

  Forms({
    this.name,
    this.url,
  });

  Forms.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class Moves {
  final Move? move;
  final List<VersionGroupDetails>? versionGroupDetails;

  Moves({
    this.move,
    this.versionGroupDetails,
  });

  Moves.fromJson(Map<String, dynamic> json)
      : move = (json['move'] as Map<String, dynamic>?) != null
            ? Move.fromJson(json['move'] as Map<String, dynamic>)
            : null,
        versionGroupDetails = (json['version_group_details'] as List?)
            ?.map((dynamic e) =>
                VersionGroupDetails.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'move': move?.toJson(),
        'version_group_details':
            versionGroupDetails?.map((e) => e.toJson()).toList()
      };
}

class Move {
  final String? name;
  final String? url;

  Move({
    this.name,
    this.url,
  });

  Move.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class VersionGroupDetails {
  final int? levelLearnedAt;
  final VersionGroup? versionGroup;
  final MoveLearnMethod? moveLearnMethod;

  VersionGroupDetails({
    this.levelLearnedAt,
    this.versionGroup,
    this.moveLearnMethod,
  });

  VersionGroupDetails.fromJson(Map<String, dynamic> json)
      : levelLearnedAt = json['level_learned_at'] as int?,
        versionGroup = (json['version_group'] as Map<String, dynamic>?) != null
            ? VersionGroup.fromJson(
                json['version_group'] as Map<String, dynamic>)
            : null,
        moveLearnMethod =
            (json['move_learn_method'] as Map<String, dynamic>?) != null
                ? MoveLearnMethod.fromJson(
                    json['move_learn_method'] as Map<String, dynamic>)
                : null;

  Map<String, dynamic> toJson() => {
        'level_learned_at': levelLearnedAt,
        'version_group': versionGroup?.toJson(),
        'move_learn_method': moveLearnMethod?.toJson()
      };
}

class VersionGroup {
  final String? name;
  final String? url;

  VersionGroup({
    this.name,
    this.url,
  });

  VersionGroup.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class MoveLearnMethod {
  final String? name;
  final String? url;

  MoveLearnMethod({
    this.name,
    this.url,
  });

  MoveLearnMethod.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class Species {
  final String? name;
  final String? url;

  Species({
    this.name,
    this.url,
  });

  Species.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class Sprites {
  final String? backDefault;
  final dynamic backFemale;
  final String? backShiny;
  final dynamic backShinyFemale;
  final String? frontDefault;
  final dynamic frontFemale;
  final String? frontShiny;
  final dynamic frontShinyFemale;
  final Other? other;

  Sprites(
      {this.backDefault,
      this.backFemale,
      this.backShiny,
      this.backShinyFemale,
      this.frontDefault,
      this.frontFemale,
      this.frontShiny,
      this.frontShinyFemale,
      this.other});

  Sprites.fromJson(Map<String, dynamic> json)
      : backDefault = json['back_default'] as String?,
        backFemale = json['back_female'],
        backShiny = json['back_shiny'] as String?,
        backShinyFemale = json['back_shiny_female'],
        frontDefault = json['front_default'] as String?,
        frontFemale = json['front_female'],
        frontShiny = json['front_shiny'] as String?,
        other = (json['other'] as Map<String, dynamic>?) != null
            ? Other.fromJson(json['other'] as Map<String, dynamic>)
            : null,
        frontShinyFemale = json['front_shiny_female'];

  Map<String, dynamic> toJson() => {
        'back_default': backDefault,
        'back_female': backFemale,
        'back_shiny': backShiny,
        'back_shiny_female': backShinyFemale,
        'front_default': frontDefault,
        'front_female': frontFemale,
        'front_shiny': frontShiny,
        'front_shiny_female': frontShinyFemale,
        'other': other?.toJson()
      };
}

class OfficialArtwork {
  final String? frontDefault;
  final String? frontShiny;

  OfficialArtwork({
    this.frontDefault,
    this.frontShiny,
  });

  OfficialArtwork.fromJson(Map<String, dynamic> json)
      : frontDefault = json['front_default'] as String?,
        frontShiny = json['front_shiny'] as String?;

  Map<String, dynamic> toJson() =>
      {'front_default': frontDefault, 'front_shiny': frontShiny};
}

class Showdown {
  final String? backDefault;
  final dynamic backFemale;
  final String? backShiny;
  final dynamic backShinyFemale;
  final String? frontDefault;
  final dynamic frontFemale;
  final String? frontShiny;
  final dynamic frontShinyFemale;

  Showdown({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  Showdown.fromJson(Map<String, dynamic> json)
      : backDefault = json['back_default'] as String?,
        backFemale = json['back_female'],
        backShiny = json['back_shiny'] as String?,
        backShinyFemale = json['back_shiny_female'],
        frontDefault = json['front_default'] as String?,
        frontFemale = json['front_female'],
        frontShiny = json['front_shiny'] as String?,
        frontShinyFemale = json['front_shiny_female'];

  Map<String, dynamic> toJson() => {
        'back_default': backDefault,
        'back_female': backFemale,
        'back_shiny': backShiny,
        'back_shiny_female': backShinyFemale,
        'front_default': frontDefault,
        'front_female': frontFemale,
        'front_shiny': frontShiny,
        'front_shiny_female': frontShinyFemale
      };
}

class Icons {
  final String? frontDefault;
  final dynamic frontFemale;

  Icons({
    this.frontDefault,
    this.frontFemale,
  });

  Icons.fromJson(Map<String, dynamic> json)
      : frontDefault = json['front_default'] as String?,
        frontFemale = json['front_female'];

  Map<String, dynamic> toJson() =>
      {'front_default': frontDefault, 'front_female': frontFemale};
}

class Cries {
  final String? latest;
  final String? legacy;

  Cries({
    this.latest,
    this.legacy,
  });

  Cries.fromJson(Map<String, dynamic> json)
      : latest = json['latest'] as String?,
        legacy = json['legacy'] as String?;

  Map<String, dynamic> toJson() => {'latest': latest, 'legacy': legacy};
}

class Stats {
  final int? baseStat;
  final int? effort;
  final Stat? stat;

  Stats({
    this.baseStat,
    this.effort,
    this.stat,
  });

  Stats.fromJson(Map<String, dynamic> json)
      : baseStat = json['base_stat'] as int?,
        effort = json['effort'] as int?,
        stat = (json['stat'] as Map<String, dynamic>?) != null
            ? Stat.fromJson(json['stat'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'base_stat': baseStat, 'effort': effort, 'stat': stat?.toJson()};
}

class Stat {
  final String? name;
  final String? url;

  Stat({
    this.name,
    this.url,
  });

  Stat.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class Types {
  final int? slot;
  final Type? type;

  Types({
    this.slot,
    this.type,
  });

  Types.fromJson(Map<String, dynamic> json)
      : slot = json['slot'] as int?,
        type = (json['type'] as Map<String, dynamic>?) != null
            ? Type.fromJson(json['type'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'slot': slot, 'type': type?.toJson()};
}

class Type {
  final String? name;
  final String? url;

  Type({
    this.name,
    this.url,
  });

  Type.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class PastTypes {
  final Generation? generation;
  final List<Types>? types;

  PastTypes({
    this.generation,
    this.types,
  });

  PastTypes.fromJson(Map<String, dynamic> json)
      : generation = (json['generation'] as Map<String, dynamic>?) != null
            ? Generation.fromJson(json['generation'] as Map<String, dynamic>)
            : null,
        types = (json['types'] as List?)
            ?.map((dynamic e) => Types.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'generation': generation?.toJson(),
        'types': types?.map((e) => e.toJson()).toList()
      };
}

class Generation {
  final String? name;
  final String? url;

  Generation({
    this.name,
    this.url,
  });

  Generation.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class Other {
  final DreamWorld? dreamWorld;

  Other({
    this.dreamWorld,
  });

  Other.fromJson(Map<String, dynamic> json)
      : dreamWorld = (json['dream_world'] as Map<String, dynamic>?) != null
            ? DreamWorld.fromJson(json['dream_world'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'dream_world': dreamWorld?.toJson(),
      };
}

class DreamWorld {
  final String? frontDefault;
  final dynamic frontFemale;

  DreamWorld({
    this.frontDefault,
    this.frontFemale,
  });

  DreamWorld.fromJson(Map<String, dynamic> json)
      : frontDefault = json['front_default'] as String?,
        frontFemale = json['front_female'];

  Map<String, dynamic> toJson() =>
      {'front_default': frontDefault, 'front_female': frontFemale};
}

class Home {
  final String? frontDefault;
  final dynamic frontFemale;
  final String? frontShiny;
  final dynamic frontShinyFemale;

  Home({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  Home.fromJson(Map<String, dynamic> json)
      : frontDefault = json['front_default'] as String?,
        frontFemale = json['front_female'],
        frontShiny = json['front_shiny'] as String?,
        frontShinyFemale = json['front_shiny_female'];

  Map<String, dynamic> toJson() => {
        'front_default': frontDefault,
        'front_female': frontFemale,
        'front_shiny': frontShiny,
        'front_shiny_female': frontShinyFemale
      };
}
