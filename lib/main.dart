import 'package:eperimetry/provider/auth_provider.dart';
import 'package:eperimetry/screens/home_screen.dart';
import 'package:eperimetry/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final _defaultLightColorScheme = ColorScheme.fromSeed(seedColor: Colors.green, brightness: Brightness.light);
  static final _defaultDarkColorScheme = ColorScheme.fromSeed(seedColor: Colors.green, brightness: Brightness.dark);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: DynamicColorBuilder(
          builder: (lightColorScheme, darkColorScheme) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "ePerimetry",
              theme: ThemeData(
                  useMaterial3: true,
                  colorScheme: lightColorScheme ?? _defaultLightColorScheme,
              ),
              darkTheme: ThemeData(
                useMaterial3: true,
                colorScheme: darkColorScheme ?? _defaultDarkColorScheme,
              ),
              themeMode: ThemeMode.dark,
              home: const WelcomeScreen(),
            );
          }
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: true);

    if (ap.isSignedIn) {
      return const HomeScreen();
    }
    else {
      return const WelcomeScreen();
    }
  }
}
