import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/firebase_options.dart';
import 'package:flutter_application_2/provider/localdb_provider.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_application_2/router/go_router.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
  AppRouter.init();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocalDbProvider()),
      ],
      child: MaterialApp.router(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        builder: BotToastInit(),
      ),
    );
  }
}
