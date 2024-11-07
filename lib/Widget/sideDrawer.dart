import 'package:flutter/material.dart';

class sideDrawer extends StatelessWidget{
  const sideDrawer({super.key, required this.onSelectScreen});
  final void Function(String keyword) onSelectScreen;

  Widget build(BuildContext context){
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(

              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.onPrimary,
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.7)
                    ] )
              ),
              child: Row(
                children: [
                  Icon(Icons.fastfood, size: 40,),
                  SizedBox(width: 10,),
                  Text("Cooking Time!",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary
                    ),)
                ],
              )
          ),
          ListTile(
            leading: Icon(Icons.set_meal),
            title: Text('Meals',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary
                )
            ),
            onTap: (){onSelectScreen("meals");},
          ),
          ListTile(
            leading: Icon(Icons.filter_alt),
            title: Text('Filters',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary
                )
            ),
            onTap: (){onSelectScreen("filters");},
          ),

        ],
      ),
    );
  }

}