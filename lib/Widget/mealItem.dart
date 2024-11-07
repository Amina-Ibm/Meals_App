import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:transparent_image/transparent_image.dart';

import 'itemLabel.dart';

class mealItem extends StatelessWidget{
  const mealItem({super.key, required this.meal, required this.onSelectMeal});
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      child: InkWell(
        onTap: (){
          onSelectMeal(meal);
        },
        child: Stack(
          children: [
            FadeInImage(placeholder: MemoryImage(kTransparentImage), image: NetworkImage(meal.imageUrl)),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: Colors.black54,
                  child: Column(
                    children: [
                      
                      Text(meal.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),

                      ),
                      SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ItemLabel(icon: Icons.timer_outlined, Label: '${meal.duration} min',),
                      SizedBox(width: 12,),
                      ItemLabel(icon: Icons.work, Label: meal.complexity.name,),
                      SizedBox(width: 12,),
                      ItemLabel(icon: Icons.attach_money_outlined, Label: meal.affordability.name,),
                    ],
                  )

                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}