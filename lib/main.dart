import 'package:flutter/material.dart';
import 'models/movie.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/browse_screen.dart';
import 'screens/detail_screen.dart';
 
void main() => runApp(const NovaFlixApp());
 
class NovaFlixApp extends StatelessWidget {
  const NovaFlixApp({super.key});
 
  static const Color novaRed = Color(0xFFE50914);
  static const Color novaBlack = Color(0xFF141414);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NovaFlix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: novaBlack,
        primaryColor: novaRed,
        // ...input + button theming (see zip)...
      ),
 
      // 1) Simple named routes (no arguments):
      initialRoute: '/',
      routes: {
        '/':         (context) => const SplashScreen(),
        '/login':    (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/browse':   (context) => const BrowseScreen(),
      },
 
      // 2) onGenerateRoute handles routes that need a typed argument:
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final movie = settings.arguments as Movie;  // type-checked here
          return MaterialPageRoute(
            builder: (context) => DetailScreen(movie: movie),
            settings: settings,
          );
        }
        return null; // fall through for unknown routes
      },
    );
  }
}
