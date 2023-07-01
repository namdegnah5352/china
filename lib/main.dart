import 'package:flutter/material.dart';
import 'data/read_config.dart';
import 'config/navigation/global_nav.dart';

late GlobalNav globalNav;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  globalNav = GlobalNav();
  await globalNav.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchView(),
    );
  }
}
