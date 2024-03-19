import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hancode_test/firebase_options.dart';
import 'package:hancode_test/view/auth/login_page.dart';
import 'package:hancode_test/viewmodel/counter_provider.dart';
import 'package:hancode_test/viewmodel/loading.dart';
import 'package:hancode_test/viewmodel/servide_selection_model.dart';
import 'package:hancode_test/viewmodel/timer.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ServiceSelectionModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TimerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Loading(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hancod',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginPage(),
      ),
    );
  }
}
