import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/model/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavouriteMealsNotifier() : super([]);

  bool toggleFavouriteMealStatus(Meal meal){
    final mealisFav = state.contains(meal);
    if(mealisFav){
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }

}

final favouriteMealsProvider = StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref) {
  return FavouriteMealsNotifier();

});
