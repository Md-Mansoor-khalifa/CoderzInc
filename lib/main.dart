import 'package:coderz_inc/AddEvent.dart';
import 'package:coderz_inc/AdminDashboardScreen.dart';

import 'package:coderz_inc/dbHelper/mongodb.dart';
import 'package:coderz_inc/provider/user_provider.dart';
import 'package:coderz_inc/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/LoginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserData(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider.of<UserProvider>(context).user.token.isEmpty
          ? const LoginScreen()
          : Provider.of<UserProvider>(context).user.role == "user"
              ? AddEvent()
              : AdminDashboardScreen(),
    );
  }
}
