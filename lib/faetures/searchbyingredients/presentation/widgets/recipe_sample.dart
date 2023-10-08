import 'package:flutter/material.dart';
import 'package:recipe/faetures/searchbyingredients/presentation/bloc/searchbyingredients_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/faetures/searchbyingredients/presentation/widgets/recipe_category.dart';

class RecipeSample extends StatelessWidget {
  const RecipeSample({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(builder: (context, state) {
      if (state is RecipeInitial) {
        return const Text('Search an ingredient to get a recipe');
      }
      if (state is RecipeLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is RecipeLoaded) {
        return const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: RecipeCategoryWidget(),
        );
      }

      if (state is RecipeError) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.error,
                  size: 40,
                  color: Colors.red,
                ),
                Text(state.message)
              ],
            ));
      }
      return const SizedBox.shrink();
    });
  }
}
