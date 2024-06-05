class Workout {
  final int id;
  final String name;
  final int duration;
  final int caloriesBurned;

  Workout({required this.id, required this.name, required this.duration, required this.caloriesBurned});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'duration': duration,
      'caloriesBurned': caloriesBurned,
    };
  }

  factory Workout.fromMap(Map<String, dynamic> map) {
    return Workout(
      id: map['id'],
      name: map['name'],
      duration: map['duration'],
      caloriesBurned: map['caloriesBurned'],
    );
  }
}
