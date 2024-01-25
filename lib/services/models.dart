import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Project {
  late final int id;
  final String name;
  final String description;
  final int price;
  final String image;
  final bool isFavourite;
  final String country;
  final int totalSales;
  final int remainingSales;
  final double percentage;

  Project({
    this.id = -1,
    this.name = '',
    this.description = '',
    this.price = 0,
    this.image = '',
    this.isFavourite = false,
    this.country = '',
    this.totalSales = 0,
    this.remainingSales = 0,
    this.percentage = 0,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}

class CartItem {
  final Project project;
  final int amount;
  final int qty;

  CartItem({required this.project, this.amount = 1, this.qty = 1});
}
