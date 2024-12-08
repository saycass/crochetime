import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
    this.navigationShell, {
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 52,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: navigationShell.goBranch,
      indicatorColor: Theme.of(context).primaryColor,
      destinations: destinations
          .map(
            (destination) => NavigationDestination(
              icon: Icon(destination.icon),
              label: destination.label,
              selectedIcon: Icon(destination.icon, color: Colors.white),
            ),
          )
          .toList(),
    );
  }
}

class Destination {
  const Destination({
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;
}

const destinations = [
  Destination(label: 'Explorar', icon: Icons.search_outlined),
  Destination(label: 'Wishlist', icon: Icons.favorite_border_outlined),
  Destination(label: 'Home', icon: Icons.home_outlined),
  Destination(label: 'Workspace', icon: Icons.workspaces_outlined),
  Destination(label: 'Timer', icon: Icons.watch_outlined),
];
