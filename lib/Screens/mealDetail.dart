import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';

class MealDetail extends StatelessWidget{
  MealDetail({super.key, required this.meal, required this.onTapFavorite});
  final Meal meal;
  final void Function(Meal meal) onTapFavorite;


  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
          actions: [
            IconButton(onPressed: (){onTapFavorite(meal);}, icon: Icon(Icons.star_border_outlined))
          ]
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Image.network(meal.imageUrl),
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
