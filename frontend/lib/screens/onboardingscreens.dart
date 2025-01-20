import 'package:feel_sync/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  _OnboardingScreensState createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              _buildOnboardingPage(
                title: "Track your mood daily",
                description: "Discover patterns over time to better understand your emotions.",
                animation: Icons.favorite,
              ),
              _buildOnboardingPage(
                title: "Write how you feel",
                description: "Reflect on your journey with daily journal entries.",
                animation: Icons.edit,
              ),
              _buildOnboardingPage(
                title: "Get AI-powered suggestions",
                description: "Receive personalized recommendations to improve your mental health.",
                animation: Icons.lightbulb,
              ),
              _buildOnboardingPage(
                title: "Welcome to FeelSync!",
                description: "Let’s start your journey toward better emotional wellness.",
                animation: Icons.emoji_emotions,
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.blue,
                    dotColor: Colors.grey,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //primary: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                    Navigator.pushReplacementNamed(context, '/welcome');
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingPage({
    required String title,
    required String description,
    required IconData animation,
  }) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFB3E5FC), // Light blue
            Color(0xFFCE93D8), // Lavender
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            animation,
            color: Colors.white,
            size: 100.0,
          ),
          const SizedBox(height: 30.0),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
