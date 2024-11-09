import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/categoryNames.dart';
final mealsProvider = Provider((ref){
  return dummyMeals;
});