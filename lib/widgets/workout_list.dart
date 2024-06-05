import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/app_bloc.dart';
import '../blocs/app_state.dart';
import '../models/workout.dart';

class WorkoutList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state is WorkoutsLoaded) {
          return ListView.builder(
            itemCount: state.workouts.length,
            itemBuilder: (context, index) {
              final workout = state.workouts[index];
              return ListTile(
                title: Text(workout.name),
                subtitle: Text('${workout.duration} mins, ${workout.caloriesBurned} kcal'),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
