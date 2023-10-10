import 'package:flutter/material.dart';
import 'package:recipe/core/utils/app_global_bloc_observer.dart';
import 'package:recipe/faetures/randomrecipes/presentation/bloc/random_recipes_bloc.dart';
import 'package:recipe/faetures/searchbyingredients/presentation/bloc/searchbyingredients_bloc.dart';
import 'package:recipe/faetures/searchbyingredients/presentation/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppGlobalBlocObserver();
  await dotenv.load(fileName: ".env");

  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => RecipeBloc(),
          ),
          BlocProvider(
            create: (_) => RandomRecipesBloc(),
          ),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
