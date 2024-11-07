import 'package:flutter/material.dart';
import 'package:meals/model/category.dart';

class CategoryGridItem extends StatelessWidget{

  CategoryGridItem({super.key, required this.category, required this.onSelectCategory});
  final Category category;
  final void Function() onSelectCategory;

  build (BuildContext context){
    return InkWell(
      onTap: onSelectCategory,
      
      child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  colors: [category.color.withOpacity(0.4),
                    category.color.withOpacity(0.7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
              )
          ),
          child: Center(
            child:
                Text(category.title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),),
            )

          ),


      );
  }
}