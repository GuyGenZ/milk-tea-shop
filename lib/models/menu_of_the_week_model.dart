import 'dart:convert';

import 'package:flutter/material.dart';

class MenuOfTheWeekModel {
  final String imagePath;
  final String shopname;
  final String name;
  final int price;
  final Color color;
  MenuOfTheWeekModel({
    this.imagePath,
    this.shopname,
    this.name,
    this.price,
    this.color,
  });

  MenuOfTheWeekModel copyWith({
    String imagePath,
    String shopname,
    String name,
    int price,
    Color color,
  }) {
    return MenuOfTheWeekModel(
      imagePath: imagePath ?? this.imagePath,
      shopname: shopname ?? this.shopname,
      name: name ?? this.name,
      price: price ?? this.price,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imagePath': imagePath,
      'shopname': shopname,
      'name': name,
      'price': price,
      'color': color.value,
    };
  }

  factory MenuOfTheWeekModel.fromMap(Map<String, dynamic> map) {
    return MenuOfTheWeekModel(
      imagePath: map['imagePath'],
      shopname: map['shopname'],
      name: map['name'],
      price: map['price'],
      color: Color(map['color']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuOfTheWeekModel.fromJson(String source) =>
      MenuOfTheWeekModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MenuOfTheWeekModel(imagePath: $imagePath, shopname: $shopname, name: $name, price: $price, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MenuOfTheWeekModel &&
        other.imagePath == imagePath &&
        other.shopname == shopname &&
        other.name == name &&
        other.price == price &&
        other.color == color;
  }

  @override
  int get hashCode {
    return imagePath.hashCode ^
        shopname.hashCode ^
        name.hashCode ^
        price.hashCode ^
        color.hashCode;
  }
}
