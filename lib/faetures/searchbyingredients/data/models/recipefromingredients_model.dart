import 'package:equatable/equatable.dart';
import '../../domain/entities/recipefromingredients_entities.dart';

class IngredientRecipe extends RecipeEntitiy with EquatableMixin {
  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? image;
  @override
  final String? imageType;
  @override
  final int? usedIngredientCount;
  @override
  final int? missedIngredientCount;
  @override
  final List<MissedIngredients>? missedIngredients;
  @override
  final List<UsedIngredients>? usedIngredients;
  @override
  final List<UnusedIngredients>? unusedIngredients;
  @override
  final int? likes;

  IngredientRecipe({
    this.id,
    this.title,
    this.image,
    this.imageType,
    this.usedIngredientCount,
    this.missedIngredientCount,
    this.missedIngredients,
    this.usedIngredients,
    this.unusedIngredients,
    this.likes,
  });

  IngredientRecipe.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        image = json['image'] as String?,
        imageType = json['imageType'] as String?,
        usedIngredientCount = json['usedIngredientCount'] as int?,
        missedIngredientCount = json['missedIngredientCount'] as int?,
        missedIngredients = (json['missedIngredients'] as List?)
            ?.map((dynamic e) =>
                MissedIngredients.fromJson(e as Map<String, dynamic>))
            .toList(),
        usedIngredients = (json['usedIngredients'] as List?)
            ?.map((dynamic e) =>
                UsedIngredients.fromJson(e as Map<String, dynamic>))
            .toList(),
        unusedIngredients = (json['unusedIngredients'] as List?)
            ?.map((dynamic e) =>
                UnusedIngredients.fromJson(e as Map<String, dynamic>))
            .toList(),
        likes = json['likes'] as int?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'imageType': imageType,
        'usedIngredientCount': usedIngredientCount,
        'missedIngredientCount': missedIngredientCount,
        'missedIngredients': missedIngredients?.map((e) => e.toJson()).toList(),
        'usedIngredients': usedIngredients?.map((e) => e.toJson()).toList(),
        'unusedIngredients': unusedIngredients?.map((e) => e.toJson()).toList(),
        'likes': likes
      };
}

class MissedIngredients {
  final int? id;
  final double? amount;
  final String? unit;
  final String? unitLong;
  final String? unitShort;
  final String? aisle;
  final String? name;
  final String? original;
  final String? originalName;
  final List<dynamic>? meta;
  final String? extendedName;
  final String? image;

  MissedIngredients({
    this.id,
    this.amount,
    this.unit,
    this.unitLong,
    this.unitShort,
    this.aisle,
    this.name,
    this.original,
    this.originalName,
    this.meta,
    this.extendedName,
    this.image,
  });

  MissedIngredients.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        amount = json['amount'] as double?,
        unit = json['unit'] as String?,
        unitLong = json['unitLong'] as String?,
        unitShort = json['unitShort'] as String?,
        aisle = json['aisle'] as String?,
        name = json['name'] as String?,
        original = json['original'] as String?,
        originalName = json['originalName'] as String?,
        meta = json['meta'] as List?,
        extendedName = json['extendedName'] as String?,
        image = json['image'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'amount': amount,
        'unit': unit,
        'unitLong': unitLong,
        'unitShort': unitShort,
        'aisle': aisle,
        'name': name,
        'original': original,
        'originalName': originalName,
        'meta': meta,
        'extendedName': extendedName,
        'image': image
      };
}

class UsedIngredients {
  final int? id;
  final double? amount;
  final String? unit;
  final String? unitLong;
  final String? unitShort;
  final String? aisle;
  final String? name;
  final String? original;
  final String? originalName;
  final List<dynamic>? meta;
  final String? extendedName;
  final String? image;

  UsedIngredients({
    this.id,
    this.amount,
    this.unit,
    this.unitLong,
    this.unitShort,
    this.aisle,
    this.name,
    this.original,
    this.originalName,
    this.meta,
    this.extendedName,
    this.image,
  });

  UsedIngredients.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        amount = json['amount'] as double?,
        unit = json['unit'] as String?,
        unitLong = json['unitLong'] as String?,
        unitShort = json['unitShort'] as String?,
        aisle = json['aisle'] as String?,
        name = json['name'] as String?,
        original = json['original'] as String?,
        originalName = json['originalName'] as String?,
        meta = json['meta'] as List?,
        extendedName = json['extendedName'] as String?,
        image = json['image'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'amount': amount,
        'unit': unit,
        'unitLong': unitLong,
        'unitShort': unitShort,
        'aisle': aisle,
        'name': name,
        'original': original,
        'originalName': originalName,
        'meta': meta,
        'extendedName': extendedName,
        'image': image
      };
}

class UnusedIngredients {
  final int? id;
  final double? amount;
  final String? unit;
  final String? unitLong;
  final String? unitShort;
  final String? aisle;
  final String? name;
  final String? original;
  final String? originalName;
  final List<dynamic>? meta;
  final String? image;

  UnusedIngredients({
    this.id,
    this.amount,
    this.unit,
    this.unitLong,
    this.unitShort,
    this.aisle,
    this.name,
    this.original,
    this.originalName,
    this.meta,
    this.image,
  });

  UnusedIngredients.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        amount = json['amount'] as double?,
        unit = json['unit'] as String?,
        unitLong = json['unitLong'] as String?,
        unitShort = json['unitShort'] as String?,
        aisle = json['aisle'] as String?,
        name = json['name'] as String?,
        original = json['original'] as String?,
        originalName = json['originalName'] as String?,
        meta = json['meta'] as List?,
        image = json['image'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'amount': amount,
        'unit': unit,
        'unitLong': unitLong,
        'unitShort': unitShort,
        'aisle': aisle,
        'name': name,
        'original': original,
        'originalName': originalName,
        'meta': meta,
        'image': image
      };
}
