import 'package:flutter/material.dart';
import 'package:recipe/common/presentations/components/food_title_component.dart';
import 'package:recipe/common/presentations/components/meal_details_component.dart';
import 'package:recipe/faetures/searchbyingredients/presentation/bloc/searchbyingredients_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/faetures/searchbyingredients/presentation/widgets/recipe_detail.dart';

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
                return GestureDetector(
                  onTap: () {
                    final clickedId = state.recipe[index].id;
                    final clickedIdTitle = state.recipe[index].title;
                    //print('wau$clickedId');
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return BlocProvider.value(
                        value: BlocProvider.of<RecipeBloc>(context),
                        child: RecipeDetails(
                            id: clickedId, rTitle: clickedIdTitle),
                      );
                    }));
                  },
                  child: SizedBox(
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
