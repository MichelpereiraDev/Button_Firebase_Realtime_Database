import 'package:button_iot/firebase_options.dart';
import 'package:button_iot/page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Interruptor',
      theme: ThemeData(
       
        primarySwatch: Colors.grey,
      ),
      home: const PageApp()
    );
  }
  
}

