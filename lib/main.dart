import 'package:flutter/material.dart';
import 'package:tsumitabe_app/views/routes/api_router.dart';
import 'package:tsumitabe_app/services/authentication.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Authentication().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'つみたべ',
      theme: ThemeData.dark(),
      onGenerateRoute: ApiRouter().generateRoute,
      initialRoute: '/',
    );
  }
}
