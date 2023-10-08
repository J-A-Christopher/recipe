import 'package:flutter/material.dart';
import 'package:recipe/common/presentations/components/food_title_component.dart';
import 'package:recipe/common/presentations/components/meal_details_component.dart';
import 'package:recipe/faetures/searchbyingredients/presentation/bloc/searchbyingredients_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeCategoryWidget extends StatelessWidget {
  const RecipeCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        if (state is RecipeLoaded) {
          final recipe = state.recipe;
          final mediaQuery = MediaQuery.of(context).size;
          return Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Wrap(
              spacing: 10,
              children: List.generate(recipe.length, (index) {
                return SizedBox(
                  height: mediaQuery.height * 0.4,
                  width: mediaQuery.width * 0.35,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          '${recipe[index].image}',
                          fit: BoxFit.cover,
                          height: mediaQuery.height * 0.28,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: FoodTitle(foodTitle: '${recipe[index].title}'),
                      ),
                      MealDetails(
                          details:
                              'MissedIngCt: ${recipe[index].missedIngredientCount}'),
                      MealDetails(
                          details:
                              'UsedIngCt: ${recipe[index].usedIngredientCount}')
                    ],
                  ),
                );
              }),
            ),
          );
        }
        return const Center();
      },
    );
  }
}
