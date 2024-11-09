import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Screens/categoriesScreen.dart';
import 'package:meals/Screens/filtersScreen.dart';
import 'package:meals/Screens/mealsScreen.dart';
import 'package:meals/Widget/sideDrawer.dart';
//import 'package:meals/data/categoryNames.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/provider/mealProvider.dart';
import 'package:meals/provider/favouriteMealProvider.dart';
import 'package:meals/provider/filterProvider.dart';

class TabScreen extends ConsumerStatefulWidget{
  const TabScreen({super.key});

  ConsumerState<ConsumerStatefulWidget> createState(){
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen>{
  List<Meal> favoriteMeals = [];

  var currentPageIndex = 0;
  void selectPage(index){
    setState(() {
      currentPageIndex = index;
    });
  }
  void onSelect(String keyword) async {
    Navigator.of(context).pop();
    if (keyword == 'filters'){
      await Navigator.push<Map<Filters, bool>>(context, MaterialPageRoute(builder: (ctx) => FilterScreen()));
    }
  }
  Widget build(BuildContext context){
    final meals = ref.watch(mealsProvider);
    final favMeals = ref.watch(favouriteMealsProvider);
    final currentFilters = ref.watch(filterProvider);
    final filteredMeals = ref.watch(filteredMealsProvider);
    Widget currentScreen = CategoriesScreen(availableMeals: filteredMeals,);
    var currentPageTitle = "Categories";

      if(currentPageIndex==1) {
        currentScreen = MealsScreen(meals: favMeals);
        currentPageTitle = "Favorites";
      }

    return Scaffold(
      appBar: AppBar(
        title: Text(currentPageTitle),
      ),
      drawer: sideDrawer(onSelectScreen: onSelect,),
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.heart_broken), label: "Favourites")
          ]),
    );
  }
}