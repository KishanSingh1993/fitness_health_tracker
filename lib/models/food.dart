class Food {
  final int id;
  final String name;
  final int calories;

  Food({required this.id, required this.name, required this.calories});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'calories': calories,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      id: map['id'],
      name: map['name'],
      calories: map['calories'],
    );
  }
}
