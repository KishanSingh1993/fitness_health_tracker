import 'package:flutter/material.dart';
import '../widgets/food_list.dart';

class FoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Food Intake'),
        Expanded(child: FoodList()),
      ],
    );
  }
}
