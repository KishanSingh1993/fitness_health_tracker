import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_event.dart';
import 'app_state.dart';
import '../repositories/workout_repository.dart';
import '../repositories/food_repository.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final WorkoutRepository workoutRepository;
  final FoodRepository foodRepository;

  AppBloc(this.workoutRepository, this.foodRepository) : super(AppInitial()) {
    on<LoadWorkouts>(_onLoadWorkouts);
    on<LoadFoods>(_onLoadFoods);
  }

  void _onLoadWorkouts(LoadWorkouts event, Emitter<AppState> emit) async {
    try {
      final workouts = await workoutRepository.getWorkouts();
      emit(WorkoutsLoaded(workouts));
    } catch (_) {
      // Handle the error appropriately, e.g., emit an error state
    }
  }

  void _onLoadFoods(LoadFoods event, Emitter<AppState> emit) async {
    try {
      final foods = await foodRepository.getFoods();
      emit(FoodsLoaded(foods));
    } catch (_) {
      // Handle the error appropriately, e.g., emit an error state
    }
  }
}
