import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/provider/mealProvider.dart';
enum Filters {
  glutenFree,
  lactoseFree,
  vegetarianFree,
  veganFree
}

class filterNotifier extends StateNotifier<Map<Filters, bool>>{
  filterNotifier() : super({
    Filters.glutenFree: false,
    Filters.lactoseFree: false,
    Filters.vegetarianFree: false,
    Filters.veganFree: false,
  });

  void setFilter(Filters filter, bool isActive){
    state = {
      ...state,
      filter: isActive
    };
  }
  void setFilters(Map<Filters,bool> currentFilters){
    state = currentFilters;
  }
}

final filterProvider = StateNotifierProvider<filterNotifier, Map<Filters, bool>>((ref){
  return filterNotifier();
});

final filteredMealsProvider = Provider((ref) {
  final currentFilters = ref.watch(filterProvider);
  final Meals = ref.watch(mealsProvider);
  return Meals.where((meal) {
    if (currentFilters[Filters.glutenFree]! && !meal.isGlutenFree){
      return false;
    }
    if (currentFilters[Filters.lactoseFree]! && !meal.isLactoseFree){
      return false;
    }
    if (currentFilters[Filters.veganFree]! && !meal.isVegan){
      return false;
    }
    if (currentFilters[Filters.vegetarianFree]! && !meal.isVegetarian){
      return false;
    }
    return true;
  }).toList();
});
