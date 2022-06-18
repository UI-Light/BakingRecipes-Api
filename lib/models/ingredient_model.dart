class Ingredient {
  final num quantity;
  final String measurement;
  final String ingredientName;

  Ingredient(
      {required this.quantity,
      required this.measurement,
      required this.ingredientName});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
        quantity: json['quantity'],
        measurement: json['measure'],
        ingredientName: json['ingredient']);
  }
}
