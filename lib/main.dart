import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/app_bloc.dart';
import 'repositories/workout_repository.dart';
import 'repositories/food_repository.dart';
import 'screens/home_screen.dart';

void main() {
  final WorkoutRepository workoutRepository = WorkoutRepository();
  final FoodRepository foodRepository = FoodRepository();

  runApp(MyApp(workoutRepository: workoutRepository, foodRepository: foodRepository));
}

class MyApp extends StatelessWidget {
  final WorkoutRepository workoutRepository;
  final FoodRepository foodRepository;

  MyApp({required this.workoutRepository, required this.foodRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness and Health Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => AppBloc(workoutRepository, foodRepository),
        child: HomeScreen(),
      ),
    );
  }
}
