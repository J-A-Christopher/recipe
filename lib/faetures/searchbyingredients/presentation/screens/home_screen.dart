import 'package:flutter/material.dart';
import 'package:recipe/common/presentations/components/screen_title_component.dart';
import 'package:recipe/common/presentations/components/subsection_component.dart';
import 'package:recipe/faetures/randomrecipes/presentation/widgets/random_recipes_widget.dart';
import 'package:recipe/faetures/searchbyingredients/presentation/bloc/searchbyingredients_bloc.dart';
import 'package:recipe/faetures/searchbyingredients/presentation/widgets/categories_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/faetures/searchbyingredients/presentation/widgets/recipe_sample.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
        child: ListView(
          children: [
            const ScreenTitle(title: 'What would you like \n to cook today ?'),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(10),
                  hintText: 'Search for recipes by typing ingredients',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        context.read<RecipeBloc>().add(RecipeRequestedEvent());
                      },
                      child: const Icon(Icons.tune))),
            ),
            const SizedBox(
              height: 15,
            ),
            const SubSection(heading: 'Categories'),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: CategoriesWidget(),
            ),
            const SizedBox(
              height: 15,
            ),
            const SubSection(heading: 'Recipes...'),
            const RecipeSample(),
            const SubSection(heading: 'Random Recipes'),
            const RandomRecipesWidget()
          ],
        ),
      ),
    );
  }
}
