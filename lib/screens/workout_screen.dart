import 'package:flutter/material.dart';
import '../widgets/workout_list.dart';

class WorkoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Workouts'),
        Expanded(child: WorkoutList()),
      ],
    );
  }
}
