import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screl_mechine_test/features/home/view/home.dart';
import 'package:screl_mechine_test/features/home/view_model/get_all_user_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GetAllUserViewModel(),)
      ],
      child: 
        MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(),
        ),
      
    );
  }
}


