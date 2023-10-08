import 'package:flutter/material.dart';
import 'package:recipe/common/presentations/components/meal_details_component.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> mealNames = [
      'Breakfast',
      'Lunch',
      'Dinner',
      'Dessert',
      'Drinks',
      'Junks'
    ];
    List<String> imageNames = [
      'breakfast',
      'lunch',
      'supper',
      'cakeslice',
      'coffee',
      'frenchfries',
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Wrap(
        spacing: 10,
        children: List.generate(mealNames.length, (index) {
          return Container(
            height: 80,
            width: 90,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/${imageNames[index]}.png',
                    height: 40,
                  ),
                ),
                MealDetails(details: mealNames[index])
              ],
            ),
          );
        }),
      ),
    );
  }
}
