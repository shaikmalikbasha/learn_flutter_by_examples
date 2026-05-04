import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:ui';

const String kRandomJokeBaseURL = 'https://official-joke-api.appspot.com';

class JokeApp extends StatelessWidget {
  const JokeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      home: const ImpressiveJokeScreen(),
    );
  }
}

class ImpressiveJokeScreen extends StatefulWidget {
  const ImpressiveJokeScreen({super.key});

  @override
  State<ImpressiveJokeScreen> createState() => _ImpressiveJokeScreenState();
}

class _ImpressiveJokeScreenState extends State<ImpressiveJokeScreen> {
  String setup = "Want to hear a joke?";
  String punchline = "Press the button below!";
  bool isLoading = false;

  Future<void> getRandomJoke() async {
    setState(() => isLoading = true);
    try {
      final response = await http.get(
        Uri.parse('$kRandomJokeBaseURL/random_joke'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          setup = data['setup'];
          punchline = data['punchline'];
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        setup = "Ouch!";
        punchline = "Check your internet connection.";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Colorful Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF6A11CB),
                  Color(0xFF2575FC),
                  Color(0xFFFF0072),
                ],
              ),
            ),
          ),

          // 2. Content with Glassmorphism
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      // color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.emoji_emotions_outlined,
                          size: 50,
                          color: Colors.white70,
                        ),
                        const SizedBox(height: 20),

                        // Animated Switcher makes text changes look smooth
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: Column(
                            key: ValueKey<String>(setup),
                            children: [
                              Text(
                                setup,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                punchline,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  // color: Colors.white.withOpacity(0.8),
                                  color: Colors.white.withValues(alpha: 0.8),
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 40),

                        // 3. The "Impressive" Button
                        GestureDetector(
                          onTap: isLoading ? null : getRandomJoke,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: const LinearGradient(
                                colors: [Color(0xFFFF0072), Color(0xFFFFBD33)],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFFFF0072,
                                  ).withValues(alpha: 0.4),
                                  blurRadius: 15,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: isLoading
                                ? const SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text(
                                    "NEXT JOKE",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Header Overlay
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Text(
              "HAHA CAPSULE",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Colors.white.withValues(alpha: 0.5),
                letterSpacing: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
