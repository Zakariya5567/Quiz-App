// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
    CategoriesModel({
        this.result,
        this.categories,
    });

    String result;
    List<Category> categories;

    factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        result: json["result"] == null ? null : json["result"],
        categories: json["categories"] == null ? null : List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "result": result == null ? null : result,
        "categories": categories == null ? null : List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class Category {
    Category({
        this.id,
        this.categoryname,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String categoryname;
    DateTime createdAt;
    DateTime updatedAt;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] == null ? null : json["id"],
        categoryname: json["categoryname"] == null ? null : json["categoryname"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "categoryname": categoryname == null ? null : categoryname,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}
