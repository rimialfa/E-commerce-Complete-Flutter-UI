// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      id: json['id'] as int? ?? -1,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      image: json['featured_image'] as String? ?? '',
      isFavourite: json['isFavourite'] as bool? ?? false,
      country: json['country'] as String? ?? '',
      totalSales: json['total_sales'] as int? ?? 0,
      remainingSales: json['remaining_sales'] as int? ?? 0,
      percentage: json['percentage'].toDouble() ?? 0.0,
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'featured_image': instance.image,
      'isFavourite': instance.isFavourite,
      'country': instance.country,
    };
