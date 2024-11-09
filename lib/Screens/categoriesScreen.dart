import 'package:flutter/material.dart';
import 'package:meals/Screens/mealsScreen.dart';
import 'package:meals/Widget/categoryGridItem.dart';
import 'package:meals/data/categoryNames.dart';
import 'package:meals/model/meal.dart';
import '../model/category.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({super.key, required this.availableMeals});
  List<Meal> availableMeals;
  @override
  State<CategoriesScreen> createState() {
    return _CategoriesScreenState();
  }
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1

    );
    _animationController.forward();
  }
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
  void selectCategory(BuildContext context, Category category){

    final filteredMeals = widget.availableMeals.where((meals) => meals.categories.contains(category.id)).toList();
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => MealsScreen(title: category.title, meals: filteredMeals)));
  }

  Widget build(context){
    return AnimatedBuilder(
        animation: _animationController,
        child: Padding(
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
        ),
        builder: (context, child) => SlideTransition(
            position: Tween(
              begin: Offset(0, 0.5),
              end: Offset(0,0)
            ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInBack)),
          child: child,
        )
          );
  }
}