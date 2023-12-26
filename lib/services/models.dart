import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Project {
  final int id;
  final String name;
  final String description;
  final int price;
  final String image;
  final bool isFavourite;

  Project({
    this.id = -1,
    this.name = '',
    this.description = '',
    this.price = 1,
    this.image = '',
    this.isFavourite = false,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
