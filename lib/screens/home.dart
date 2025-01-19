import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:feel_sync/components/navigation_bar.dart';
import 'package:feel_sync/components/mood_summary.dart';
//import 'package:feel_sync/components/mood_tracker.dart';
import 'package:feel_sync/components/suggestions_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  
  int _currentIndex=0;
   void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    }
    );
   }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 18) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  IconData _getGreetingIcon() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return Icons.wb_sunny;
    } else if (hour < 18) {
      return Icons.wb_cloudy;
    } else {
      return Icons.nights_stay;
    }
  }

  Color _getGreetingColor() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return Colors.orange.shade200;
    } else if (hour < 18) {
      return Colors.blue.shade300;
    } else {
      return const Color.fromARGB(255, 19, 25, 63);
    }
  }

  
    

  @override
  Widget build(BuildContext context) {
    final String greeting = _getGreeting();
    final IconData greetingIcon = _getGreetingIcon();
    final Color greetingColor = _getGreetingColor();

    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: greetingColor,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                                  child: Row(
                                    children: [
                    Icon(
                      greetingIcon,
                      size: 50.0,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 15.0),
                    Text(
                      "$greeting,Nidhi",
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                                    ],
                                  ),
                                ),
                  ),


                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const MoodTracker(),
                  ), // Calendar or chart for daily mood tracking
                  const SizedBox(height: 20),
                  //const SuggestionsPanel(), // AI-powered suggestions panel
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle adding a new mood entry
        },
        backgroundColor: const Color.fromARGB(255, 166, 32, 199),
        child: const Icon(Icons.crisis_alert_sharp, color: Colors.white),
      ),
      bottomNavigationBar: CustomNavigationBar(
        
      ),
      ); // Modular navigation bar
  }
  
}
