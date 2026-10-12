
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  double logoSize = 70;
  double opacity = 1;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  void startAnimation() async {
    for (int i = 0; i < 5; i++) {
      await Future.delayed(const Duration(seconds: 1));

      if (!mounted) return;

      setState(() {
        logoSize += 15;
        opacity -= 0.2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.flutter_dash,
              size: logoSize,
            ),
            const SizedBox(height: 20),
            AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(seconds: 1),
              child: const WelcomeMessage(),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text("GET STARTED"),
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Welcome to My App",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text("Learn, Build and Grow"),
      ],
    );
  }
}
