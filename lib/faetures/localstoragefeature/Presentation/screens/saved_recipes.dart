import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/faetures/localstoragefeature/Presentation/bloc/localstorage_bloc.dart';

class SavdRecipes extends StatelessWidget {
  const SavdRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Saved Recipes',
          style: TextStyle(color: Colors.black),
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
      ),
      body: const Center(
        child: Text('Loading...'),
      ),
    );
  }
}
