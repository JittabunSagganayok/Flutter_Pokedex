// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokeModel _$PokeModelFromJson(Map<String, dynamic> json) => PokeModel(
      json['name'] as String,
      json['img'] as String,
      json['num'] as String,
    );

Map<String, dynamic> _$PokeModelToJson(PokeModel instance) => <String, dynamic>{
      'name': instance.name,
      'img': instance.img,
      'num': instance.num,
    };

PokeResponse _$PokeResponseFromJson(Map<String, dynamic> json) => PokeResponse(
      (json['pokemon'] as List<dynamic>)
          .map((e) => PokeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokeResponseToJson(PokeResponse instance) =>
    <String, dynamic>{
      'pokemon': instance.pokemon,
    };
