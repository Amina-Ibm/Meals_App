import 'package:flutter/material.dart';

enum Filters {
  glutenFree,
  lactoseFree,
  vegetarianFree,
  veganFree
}

class FilterScreen extends StatefulWidget{
  FilterScreen({super.key, required this.currentFilters});
  Map<Filters, bool> currentFilters;
  State<FilterScreen> createState(){
    return _FilterScreenState();
  }

}
class _FilterScreenState extends State<FilterScreen>{
  var _glutenCheck = false;
  var _lactoseCheck = false;
  var _vegetarianCheck = false;
  var _veganCheck = false;

  @override
  void initState(){
    super.initState();
    _glutenCheck = widget.currentFilters[Filters.glutenFree]!;
    _veganCheck = widget.currentFilters[Filters.veganFree]!;
    _lactoseCheck = widget.currentFilters[Filters.lactoseFree]!;
    _vegetarianCheck = widget.currentFilters[Filters.vegetarianFree]!;
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters")
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, result){
          if (didPop)
            return;
          // You can handle the result here if needed
          Navigator.of(context).pop({
            Filters.glutenFree: _glutenCheck,
            Filters.lactoseFree: _lactoseCheck,
            Filters.vegetarianFree: _vegetarianCheck,
            Filters.veganFree: _veganCheck,
          });
        },

          child: Column(
        children: [
          SwitchListTile(value: _glutenCheck,
            onChanged: (isChecked){
              setState(() {
                _glutenCheck = isChecked;
              });

            },
            title: Text("Gluten-Free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer
              ),),
            subtitle: Text("Only includes gluten-free meals",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer
              ),),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          ),
          SwitchListTile(value: _lactoseCheck,
            onChanged: (isChecked){
              setState(() {
                _lactoseCheck = isChecked;
              });

            },
            title: Text("Lactose-Free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer
              ),),
            subtitle: Text("Only includes lactose-free meals",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer
              ),),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          ),
          SwitchListTile(value: _vegetarianCheck,
            onChanged: (isChecked){
              setState(() {
                _vegetarianCheck = isChecked;
              });

            },
            title: Text("Vegetarian-Free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer
              ),),
            subtitle: Text("Only includes vegetarian-free meals",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer
              ),),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          ),
          SwitchListTile(value: _veganCheck,
            onChanged: (isChecked){
              setState(() {
                _veganCheck = isChecked;
              });

            },
            title: Text("Vegan-Free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer
              ),),
            subtitle: Text("Only includes vegan-free meals",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer
              ),),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          )
        ],
      ))
    );
  }

}