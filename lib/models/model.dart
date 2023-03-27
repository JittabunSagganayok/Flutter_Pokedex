import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class PokeModel {
  String name;
  String img;
  String num;
  PokeModel(this.name, this.img, this.num);
  factory PokeModel.fromJson(Map<String, dynamic> json) =>
      _$PokeModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokeModelToJson(this);
}

@JsonSerializable()
class PokeResponse {
  List<PokeModel> pokemon;

  PokeResponse(this.pokemon);
  factory PokeResponse.fromJson(Map<String, dynamic> json) =>
      _$PokeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokeResponseToJson(this);
}
