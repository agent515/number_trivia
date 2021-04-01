import 'package:flutter/material.dart';
import 'package:number_trivia/features/number_trivia/presentation/pages/number_trivia_page.dart';
import 'initial_register.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: const Color(0xFF1F1B24),
        brightness: Brightness.light,
        backgroundColor: const Color(0xFF121212),
        scaffoldBackgroundColor: const Color(0xFF121212),
        accentColor: const Color(0xFFbb86fc),
        accentIconTheme: IconThemeData(color: Colors.white),
        dividerColor: Colors.white54,
      ),
      title: 'Number Trivia',
      home: NumberTriviaPage(),
    );
  }
}
