import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/form_provider.dart';
import 'screens/form_designer_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FormProvider(),
      child: MaterialApp(
        title: 'Formular Designer',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const FormDesignerScreen(),
      ),
    );
  }
}
