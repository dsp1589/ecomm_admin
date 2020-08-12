import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable(nullable:false)
class Product {
  final String definitionUrl;
  final String name;


  Product(this.definitionUrl, this.name);

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
