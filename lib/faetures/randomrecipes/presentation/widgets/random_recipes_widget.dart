import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/common/presentations/components/meal_details_component.dart';
import 'package:recipe/faetures/randomrecipes/presentation/bloc/random_recipes_bloc.dart';
import 'package:recipe/faetures/randomrecipes/presentation/widgets/random_scrollable_widget.dart';

class RandomRecipesWidget extends StatelessWidget {
  const RandomRecipesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomRecipesBloc, RandomRecipesState>(
        builder: (context, state) {
      if (state is RandomRecipesLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is RandomRecipesLoaded) {
        return const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: RandomScrollableWidget(),
        );
      }
      if (state is RandomRecipesInitial) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Tap on one of the categories to get recipes back',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
        );
      }
      if (state is RandomRecipesError) {
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
