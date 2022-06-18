import 'package:scamp_assessment/models/ingredient_model.dart';
import 'package:scamp_assessment/models/step_model.dart';

class RecipeList {
  final List<Recipe> recipes;

  RecipeList({required this.recipes});

  factory RecipeList.fromJson(List<dynamic> json) {
    List<Recipe> recipes = json.map((i) => Recipe.fromJson(i)).toList();
    return RecipeList(recipes: recipes);
  }
}

class Recipe {
  final int id;
  final String recipeName;
  final List<Ingredient> ingredients;
  final List<Step> steps;
  final int servingSize;

  Recipe({
    required this.id,
    required this.recipeName,
    required this.ingredients,
    required this.steps,
    required this.servingSize,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    var listI = json['ingredients'] as List;
    var listS = json['steps'] as List;
    List<Ingredient> ingredientsList =
        listI.map((i) => Ingredient.fromJson(i)).toList();
    List<Step> stepsList = listS.map((i) => Step.fromJson(i)).toList();

    return Recipe(
      id: json['id'],
      recipeName: json['name'],
      ingredients: ingredientsList,
      steps: stepsList,
      servingSize: json['servings'],
    );
  }
}
