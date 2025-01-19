import 'package:feel_sync/screens/journal.dart';
import 'package:feel_sync/screens/chattiing.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState((){
      _selectedIndex = index;
      switch(index){
      case(2):{
                // Handle login() {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JournalPage()),
            );
    };
    case(3):{
      Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatApp()),
            );


    };
      }
    }
    );
  
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue.shade700,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 14.0,
          unselectedFontSize: 12.0,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _selectedIndex == 0
                    ? Icon(Icons.home, key: ValueKey("home_active"), color: Colors.blue.shade700)
                    : Icon(Icons.home_outlined, key: ValueKey("home_inactive"), color: Colors.grey),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _selectedIndex == 1
                    ? Icon(Icons.bar_chart, key: ValueKey("insights_active"), color: Colors.blue.shade700)
                    : Icon(Icons.bar_chart_outlined, key: ValueKey("insights_inactive"), color: Colors.grey),
              ),
              label: 'Insights',
            ),
            BottomNavigationBarItem(
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _selectedIndex == 2
                    ? Icon(Icons.book, key: ValueKey("journal_active"), color: Colors.blue.shade700)
                    : Icon(Icons.book_outlined, key: ValueKey("journal_inactive"), color: Colors.grey),
                  
              ),
              label: 'Journal',
            ),
            BottomNavigationBarItem(
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _selectedIndex == 3
                    ? Icon(Icons.chat_bubble, key: ValueKey("chat_active"), color: Colors.blue.shade700)
                    : Icon(Icons.chat_bubble_outline_outlined, key: ValueKey("chat_inactive"), color: Colors.grey),
                    
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _selectedIndex == 4
                    ? Icon(Icons.person, key: ValueKey("profile_active"), color: Colors.blue.shade700)
                    : Icon(Icons.person_outline, key: ValueKey("profile_inactive"), color: Colors.grey),
                    
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
