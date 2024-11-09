import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/filterProvider.dart';

class FilterScreen extends ConsumerWidget{
  FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final activeFilters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters")
      ),
      body: Column(
        children: [
          SwitchListTile(value: activeFilters[Filters.glutenFree]!,
            onChanged: (isChecked){
             ref.read(filterProvider.notifier).setFilter(Filters.glutenFree, isChecked);
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
          SwitchListTile(value: activeFilters[Filters.lactoseFree]!,
            onChanged: (isChecked){
              ref.read(filterProvider.notifier).setFilter(Filters.lactoseFree, isChecked);
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
          SwitchListTile(value: activeFilters[Filters.vegetarianFree]!,
            onChanged: (isChecked){
              ref.read(filterProvider.notifier).setFilter(Filters.vegetarianFree, isChecked);
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
          SwitchListTile(value: activeFilters[Filters.veganFree]!,
            onChanged: (isChecked){
              ref.read(filterProvider.notifier).setFilter(Filters.veganFree, isChecked);
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
      ));
  }

}