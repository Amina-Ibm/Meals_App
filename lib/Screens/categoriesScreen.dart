import 'package:flutter/material.dart';
import 'package:meals/Screens/mealsScreen.dart';
import 'package:meals/Widget/categoryGridItem.dart';
import 'package:meals/data/categoryNames.dart';
import 'package:meals/model/meal.dart';
import '../model/category.dart';

class CategoriesScreen extends StatelessWidget{
  CategoriesScreen({super.key, required this.onTapFavorite, required this.availableMeals});
  final void Function(Meal meal) onTapFavorite;
  List<Meal> availableMeals;

  void selectCategory(BuildContext context, Category category){

    final filteredMeals = availableMeals.where((meals) => meals.categories.contains(category.id)).toList();
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => MealsScreen(title: category.title, meals: filteredMeals, onTapFavorite: onTapFavorite,)));
  }

  Widget build(context){
    return
      Padding(
        padding: EdgeInsets.all(10),
        child: GridView(
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3/2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20
            ),
            children: [
              ...availableCategories.map((category) => CategoryGridItem(category: category, onSelectCategory: (){selectCategory(context, category);},)),
            ]
        ),
      )
    ;
  }

}