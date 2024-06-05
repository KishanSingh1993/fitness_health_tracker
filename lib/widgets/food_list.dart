import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/app_bloc.dart';
import '../blocs/app_state.dart';
import '../models/food.dart';

class FoodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state is FoodsLoaded) {
          return ListView.builder(
            itemCount: state.foods.length,
            itemBuilder: (context, index) {
              final food = state.foods[index];
              return ListTile(
                title: Text(food.name),
                subtitle: Text('${food.calories} kcal'),
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
