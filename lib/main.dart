import 'package:amazon/features/show_news/presentation/screens/home_screen.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return MaterialApp(
            title: 'News App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'JetBrainsMonoNerd',
              useMaterial3: true,
              colorScheme: darkDynamic ?? ColorScheme.fromSeed(
                seedColor: Colors.blue,
                brightness: Brightness.light,
              ),
            ),
            darkTheme: ThemeData(
              fontFamily: 'JetBrainsMonoNerd',
              useMaterial3: true,
              colorScheme: darkDynamic ?? ColorScheme.fromSeed(
                seedColor: Colors.blue,
                brightness: Brightness.dark,
              ),
            ),
            themeMode: ThemeMode.system,
            home: const HomeScreen(),
        );
      },
    );
  }
}
