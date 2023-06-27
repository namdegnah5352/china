import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: (selectedIndex) {
        setState(() {
          navDrawerIndex = selectedIndex;
          // Destination.values[navDrawerIndex].function();
          Navigator.pop(context);
        });
      },
      selectedIndex: navDrawerIndex,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text(
            'Mail',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        ...Destination.values.map((destination) {
          return NavigationDrawerDestination(
            label: Text(destination.label),
            icon: destination.iconOutlined,
            selectedIcon: destination.icon,
          );
        }),
        const Divider(indent: 28, endIndent: 28),
      ],
    );
  }
}

enum Destination {
  home('Home', Icon(Icons.home_outlined), Icon(Icons.home)),
  user('not here', Icon(Icons.inbox_outlined), Icon(Icons.inbox)),
  accounts('Accounts', Icon(Icons.send_outlined), Icon(Icons.send)),
  users('Users', Icon(Icons.bookmark_border), Icon(Icons.bookmark)),
  transactions('Transactions', Icon(Icons.favorite_outline), Icon(Icons.favorite)),
  family('Family', Icon(Icons.delete_outline), Icon(Icons.delete)),
  school('School', Icon(Icons.bookmark_border), Icon(Icons.bookmark)),
  work('Settings', Icon(Icons.bookmark_border), Icon(Icons.bookmark));

  const Destination(this.label, this.iconOutlined, this.icon);
  final String label;
  final Widget iconOutlined;
  final Widget icon;
}
