import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});
  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Row(
            children: [
              Icon(
                Icons.fastfood,
                size: 50,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 20),
              Text('Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      )),
            ],
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.restaurant,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          title: Text(
            'Meals',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          onTap: () {
            onSelectScreen('meals');
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: Text('Filters',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  )),
          onTap: () {
            onSelectScreen('filters');
          },
        )
      ]),
    );
  }
}
