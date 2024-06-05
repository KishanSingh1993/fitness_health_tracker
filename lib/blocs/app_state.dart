import 'package:equatable/equatable.dart';
import '../models/workout.dart';
import '../models/food.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {}
class WorkoutsLoaded extends AppState {
  final List<Workout> workouts;

  WorkoutsLoaded(this.workouts);

  @override
  List<Object> get props => [workouts];
}

class FoodsLoaded extends AppState {
  final List<Food> foods;

  FoodsLoaded(this.foods);

  @override
  List<Object> get props => [foods];
}
// Add more states as needed
