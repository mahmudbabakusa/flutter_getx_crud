// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, unnecessary_null_comparison

import 'dart:convert';

List<ItemModel> itemModelFromJson(String str) =>
    List<ItemModel>.from(json.decode(str).map((x) => ItemModel.fromJson(x)));

String itemModelToJson(List<ItemModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemModel {
  ItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.itemImage,
    required this.userId,
  });

  String id;
  String name;
  String description;
  String itemImage;
  String userId;

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        itemImage: json["item_image"] == null ? null : json["item_image"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "item_image": itemImage == null ? null : itemImage,
        "user_id": userId,
      };
}
