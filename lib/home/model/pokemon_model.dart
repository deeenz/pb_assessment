class MiniPokemonModel {
  final String? name;
  final String? url;

  MiniPokemonModel({
    this.name,
    this.url,
  });

  MiniPokemonModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}
