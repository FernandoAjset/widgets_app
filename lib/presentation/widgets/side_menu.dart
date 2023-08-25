import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final List<MenuItem> menuItems;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu(
      {super.key, required this.menuItems, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    final padding = EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 10);

    return NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });

          final menuItem = widget.menuItems[value];
          context.push(menuItem.link);
          widget.scaffoldKey.currentState!.closeDrawer();
        },
        children: [
          Padding(
            padding: padding,
            child: const Text('Main'),
          ),
          ...widget.menuItems
              .sublist(0, 3)
              .map((menuItem) => NavigationDrawerDestination(
                  icon: Icon(menuItem.icon), label: Text(menuItem.title)))
              .toList(),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: Text('More options'),
          ),
          ...widget.menuItems
              .sublist(3, 8)
              .map((menuItem) => NavigationDrawerDestination(
                  icon: Icon(menuItem.icon), label: Text(menuItem.title)))
              .toList(),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: Text('Widgets with providers'),
          ),
          ...widget.menuItems
              .sublist(8)
              .map((menuItem) => NavigationDrawerDestination(
                  icon: Icon(menuItem.icon), label: Text(menuItem.title)))
              .toList(),
        ]);
  }
}
