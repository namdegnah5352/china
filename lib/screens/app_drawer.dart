//System
import 'package:flutter/material.dart';
import '../calls/question_calls.dart' as calls;
import '../config/app_colors.dart';
import '../data/question.dart';

class AppDrawer extends StatelessWidget {
  final List<Question> questions;
  const AppDrawer(this.questions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: simplyWhite,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/images/questions.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Text('Menu'),
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            leading: const Icon(Icons.search),
            title: const Text('Search'),
            onTap: () async {
              Navigator.pop(context);
              await calls.loadSearchPage(context, questions);
            },
          ),
          const Divider(thickness: 1.0),
          ListTile(
            leading: const Icon(Icons.hotel_class),
            title: const Text('Special'),
            onTap: () async {
              Navigator.pop(context);
              await calls.loadSpecialPage(context, questions);
            },
          ),
          const Divider(thickness: 1.0),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () async {
              Navigator.pop(context);
              await calls.loadSettinsPage(context);
            },
          ),
          const Divider(thickness: 1.0),
          ListTile(
            leading: const Icon(Icons.password),
            title: const Text('Test'),
            onTap: () async {
              Navigator.pop(context);
              // await calls.loadPasswords();
            },
          ),
          const Divider(thickness: 1.0),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () async {
              Navigator.pop(context);
              // await calls.search();
            },
          ),
        ],
      ),
    );
  }
}
