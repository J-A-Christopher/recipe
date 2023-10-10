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
    TextEditingController inputController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
        child: ListView(
          children: [
            const ScreenTitle(title: 'What would you like \n to cook today ?'),
            const SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'Enter three comma separated ingredients..',
                  suffixIcon: GestureDetector(
                      onTap: () {
                        String input = inputController.text.trim();
                        if (input.isEmpty) {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Ok'))
                                  ],
                                  content: const Text('Enter valid data'),
                                  title: const Text('Input Error..'),
                                );
                              });
                        } else {
                          List<String> values = input.split(',');
                          bool allValid =
                              values.every((value) => value.trim().length >= 4);

                          if (values.length != 3 || !allValid) {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Ok'))
                                    ],
                                    content: const Text(
                                        'Problem with input. Enter only three values and each of them should have more than or equal to 4 characters.'),
                                    title: const Text('Input Error..'),
                                  );
                                });
                          } else {
                            if (allValid) {
                              context.read<RecipeBloc>().add(
                                  RecipeRequestedEvent(ingredients: values));
                            }
                            inputController.clear();
                          }
                        }
                      },
                      child: const Icon(Icons.tune))),
              controller: inputController,
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
