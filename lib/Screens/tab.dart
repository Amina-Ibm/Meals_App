import 'package:flutter/material.dart';
import 'package:meals/Screens/categoriesScreen.dart';
import 'package:meals/Screens/filtersScreen.dart';
import 'package:meals/Screens/mealsScreen.dart';
import 'package:meals/Widget/sideDrawer.dart';
import 'package:meals/data/categoryNames.dart';
import 'package:meals/model/meal.dart';

var kInititalFilters = {
  Filters.glutenFree: false,
  Filters.lactoseFree: false,
  Filters.vegetarianFree: false,
  Filters.veganFree: false

};
class TabScreen extends StatefulWidget{
  const TabScreen({super.key});

  State<StatefulWidget> createState(){
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen>{
  List<Meal> favoriteMeals = [];
  Map<Filters, bool> _selectedFilters = kInititalFilters;

  var currentPageIndex = 0;
  void selectPage(index){
    setState(() {
      currentPageIndex = index;
    });
  }
  void showInfoMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }
  void onTapFavorite(Meal meal){
    setState(() {
      if (favoriteMeals.contains(meal)){
        favoriteMeals.remove(meal);
        showInfoMessage("Removed from Favorites");

      } else {
        favoriteMeals.add(meal);
        showInfoMessage("Added to Favorites");
      }
    });
  }
  void onSelect(String keyword) async {
    Navigator.of(context).pop();
    if (keyword == 'filters'){
      final result = await Navigator.push<Map<Filters, bool>>(context, MaterialPageRoute(builder: (ctx) => FilterScreen(currentFilters: _selectedFilters,)));
      setState(() {
        _selectedFilters = result ?? kInititalFilters;
      });

    }

  }

  Widget build(BuildContext context){
    List<Meal> filteredMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filters.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if (_selectedFilters[Filters.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if (_selectedFilters[Filters.veganFree]! && !meal.isVegan){
        return false;
      }
      if (_selectedFilters[Filters.vegetarianFree]! && !meal.isVegetarian){
        return false;
      }
      return true;
    }).toList();
    Widget currentScreen = CategoriesScreen(onTapFavorite: onTapFavorite, availableMeals: filteredMeals,);
    var currentPageTitle = "Categories";

      if(currentPageIndex==1) {
        currentScreen = MealsScreen(meals: favoriteMeals, onTapFavorite: onTapFavorite,);
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
