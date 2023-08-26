import 'package:emeal_app/models/meal_prep.dart';
import 'package:emeal_app/views/home/components/meal-preps/meal_preps_list_item_view.dart';
import 'package:emeal_app/views/home/components/meal-tab/meal_tab_bar_view.dart';
import 'package:flutter/material.dart';

class MealPrepsListView extends StatelessWidget {
  final List<MealPrep> mealPreps;

  const MealPrepsListView({super.key, required this.mealPreps});

  @override
  Widget build(BuildContext context) {
    final currentState = context.findAncestorStateOfType<MealTabBarViewState>();

    return ListView(
      padding: const EdgeInsets.all(12.0),
      children: mealPreps.map((mealPrep) {
        final count = currentState?.mealPreps
                .where((item) => item.id == mealPrep.id)
                .length ??
            0;
        return SizedBox(
          height: 100,
          child: MealPrepListItemView(mealPrep: mealPrep, count: count),
        );
      }).toList(),
    );
  }
}
