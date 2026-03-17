import 'package:flutter/material.dart';
import 'package:palmx/features/calendar/calendar_page.dart';
import 'package:palmx/features/home/home_page.dart';
import 'package:palmx/features/operation/operation_log/operation_log_form_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
  }

  void _onNavTap(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: _onPageChanged,
            children: const [HomePage(), CalendarPage()],
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(child: _buildCustomNavBar()),
          ),
          if (_currentIndex == 0) _buildFloatingActionButton(),
        ],
      ),
    );
  }

  Widget _buildCustomNavBar() {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _navItem(Icons.home_outlined, "HOME", 0),
          _navItem(Icons.calendar_month_outlined, "CALENDAR", 1),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    bool isActive = _currentIndex == index;
    return GestureDetector(
      onTap: () => _onNavTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFFFE5D9) : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isActive ? Colors.orange[900] : Colors.grey,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.orange[900] : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Positioned(
      bottom: 100,
      right: 30,
      child: FloatingActionButton(
        backgroundColor: Colors.orange[800],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OperationLogFormPage()),
          );
        },
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}
