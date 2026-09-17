import 'package:flutter/material.dart';
import '../main.dart';
 
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
 
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Run ONCE: wait 3s, then replace splash with login.
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NovaFlixApp.novaBlack,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('NOVAFLIX',
                style: TextStyle(
                    color: NovaFlixApp.novaRed,
                    fontSize: 44, fontWeight: FontWeight.bold,
                    letterSpacing: 2)),
            SizedBox(height: 12),
            Text('STREAM WITHOUT LIMITS',
                style: TextStyle(color: Color(0xFFB3B3B3),
                    fontSize: 13, letterSpacing: 3)),
            SizedBox(height: 40),
            SizedBox(width: 140,
              child: LinearProgressIndicator(
                  color: NovaFlixApp.novaRed,
                  backgroundColor: Color(0xFF333333))),
          ],
        ),
      ),
    );
  }
}
