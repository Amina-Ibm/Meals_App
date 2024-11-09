import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/provider/favouriteMealProvider.dart';

class MealDetail extends ConsumerWidget{
  MealDetail({super.key, required this.meal});
  final Meal meal;


  Widget build(BuildContext context, WidgetRef ref){
    final favMeals = ref.watch(favouriteMealsProvider);
    bool mealIsFav = favMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
          actions: [
            IconButton(onPressed: (){
              final mealAdded = ref.read(favouriteMealsProvider.notifier).toggleFavouriteMealStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(mealAdded ? 'Meal added as favourite' : 'Meal removed from favourite')));
            },
                icon: AnimatedSwitcher(
                    duration: Duration(milliseconds: 400),
                  transitionBuilder: (child, animation) {
                      return RotationTransition(turns: animation, child: child,);
                  },
                  child: Icon(mealIsFav ? Icons.star : Icons.star_border_outlined, key: ValueKey(mealIsFav),),
                ) )
          ]
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Hero(tag: meal.id, child: Image.network(meal.imageUrl)),
              Text('Ingredients',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary
                ),),
              SizedBox(height: 10,),
              for(final ingredient in meal.ingredients)
                Text(ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer
                  ),
                ),
              SizedBox(height: 10,),
              Text('Steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary
                ),
              ),
              SizedBox(height: 10,),
              for (final step in meal.steps)
                Padding(
                  padding:
                EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 8),
                  child:  Text(step,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    textAlign: TextAlign.center,
                  )

                )
            ]
        ),
      )
    );
  }
}
