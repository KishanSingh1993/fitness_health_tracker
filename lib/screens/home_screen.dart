import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/app_bloc.dart';
import '../blocs/app_event.dart';
import '../blocs/app_state.dart';
import 'workout_screen.dart';
import 'food_screen.dart';
import 'goals_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitness and Health Tracker'),
      ),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state is AppInitial) {
            context.read<AppBloc>().add(LoadWorkouts());
            context.read<AppBloc>().add(LoadFoods());
            return const Center(child: CircularProgressIndicator());
          } else if (state is WorkoutsLoaded && state is FoodsLoaded) {
            return Column(
              children: [
                Expanded(child: WorkoutScreen()),
                Expanded(child: FoodScreen()),
                Expanded(child: GoalsScreen()),
              ],
            );
          } else {
            return const Center(child: Text('Something went wrong!'));
          }
        },
      ),
    );
  }
}
