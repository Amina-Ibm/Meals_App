import 'package:flutter/material.dart';
import 'package:meals/Screens/mealDetail.dart';
import 'package:meals/Widget/mealItem.dart';
import 'package:meals/data/categoryNames.dart';
import 'package:meals/model/category.dart';
import 'package:meals/model/meal.dart';
class MealsScreen extends StatelessWidget{
  MealsScreen({super.key, this.title, required this.meals});
  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context,Meal meal){
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => MealDetail(meal: meal)));
  }
  Widget build(BuildContext context){
    Widget content = ListView.builder(
      
        itemCount: meals.length,
        itemBuilder: (ctx, index) =>
          mealItem(meal: meals[index],
            onSelectMeal: (meal){
            selectMeal(context, meal);
          },),

    );
    if (meals.isEmpty){
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Uh No... Nothing Here",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer
              ),
            ),
            SizedBox(height: 15,),
            Text('Why not try a different category',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer))
          ],
        ),
      );
    }
    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content
    );
  }
}