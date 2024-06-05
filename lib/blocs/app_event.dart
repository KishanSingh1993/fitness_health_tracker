import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class LoadWorkouts extends AppEvent {}
class LoadFoods extends AppEvent {}
// Add more events as needed
