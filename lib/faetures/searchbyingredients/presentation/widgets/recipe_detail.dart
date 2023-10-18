import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/common/presentations/components/food_title_component.dart';
import 'package:recipe/common/presentations/components/subsection_component.dart';
import 'package:recipe/faetures/localstoragefeature/Presentation/bloc/localstorage_bloc.dart';
import 'package:recipe/faetures/localstoragefeature/Presentation/screens/saved_recipes.dart';
import 'package:recipe/faetures/searchbyingredients/presentation/bloc/searchbyingredients_bloc.dart';

class RecipeDetails extends StatelessWidget {
  final int? id;
  final String? rTitle;
  const RecipeDetails({super.key, required this.id, required this.rTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            '$rTitle',
            style: const TextStyle(color: Colors.black),
          ),
          elevation: 0,
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BlocProvider(
                            create: (context) => LocalstorageBloc(),
                            child: const SavdRecipes(),
                          )));
                },
                icon: const Icon(
                  Icons.save,
                  size: 30,
                  color: Colors.black,
                ))
          ],
        ),
        body: BlocBuilder<RecipeBloc, RecipeState>(builder: (context, state) {
          if (state is RecipeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is RecipeLoaded) {
            final clickedItem =
                state.recipe.firstWhere((recipeItem) => recipeItem.id == id);
            final mediQuerry = MediaQuery.of(context).size;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Image.network(
                    '${clickedItem.image}',
                    height: mediQuerry.height * .6,
                    fit: BoxFit.cover,
                  ),
                  Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: FoodTitle(
                                        foodTitle: '${clickedItem.title}')),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text('Likes: '),
                                      const Icon(
                                        Icons.favorite,
                                        color: Color(0xffffa500),
                                      ),
                                      Text('${clickedItem.likes}'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SubSection(heading: 'Ingredients'),
                            const SizedBox(
                              height: 10,
                            ),
                            const FoodTitle(foodTitle: 'Used Ingredients'),
                            Column(
                              children: List.generate(
                                  clickedItem.usedIngredients!.length, (index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: 60,
                                        height: 60,
                                        child: Image.network(
                                            '${clickedItem.usedIngredients?[index].image}'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                            '${clickedItem.usedIngredients?[index].originalName}'),
                                      ),
                                      //const Spacer(),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                            '${clickedItem.usedIngredients?[index].amount}'),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                            '${clickedItem.usedIngredients?[index].unit}'),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                            clickedItem.unusedIngredients!.isEmpty
                                ? const Text('')
                                : const FoodTitle(
                                    foodTitle: 'Unused Ingredients'),
                            Column(
                              children: List.generate(
                                  clickedItem.unusedIngredients!.length,
                                  (index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: 60,
                                        height: 60,
                                        child: Image.network(
                                            '${clickedItem.unusedIngredients?[index].image}'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                            '${clickedItem.unusedIngredients?[index].originalName}'),
                                      ),
                                      //const Spacer(),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                            '${clickedItem.unusedIngredients?[index].amount}'),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                            '${clickedItem.unusedIngredients?[index].unit}'),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        }));
  }
}
