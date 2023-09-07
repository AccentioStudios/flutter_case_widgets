// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Book _$$_BookFromJson(Map<String, dynamic> json) => _$_Book(
      id: json['id'] as int,
      name: json['name'] as String,
      authorName: json['authorName'] as String,
      releaseDate: json['releaseDate'] as String,
      htmlContent: json['htmlContent'] as String,
    );

Map<String, dynamic> _$$_BookToJson(_$_Book instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'authorName': instance.authorName,
      'releaseDate': instance.releaseDate,
      'htmlContent': instance.htmlContent,
    };
