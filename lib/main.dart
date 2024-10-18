import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:registro_app/screens/edit_user_screen.dart';
import 'firebase_options.dart';

//Screens
import 'package:registro_app/screens/add_users_screen.dart';
import 'package:registro_app/screens/users_list_screen.dart';

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
    return MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => const UsersListView(),
          '/add': (context) => const AddUserWidget(),
          '/edit': (context) => const EditUserScreen(),
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      );
  }
}


