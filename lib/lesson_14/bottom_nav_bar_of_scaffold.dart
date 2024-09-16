import 'package:flutter/material.dart';

class BottomNavBarSection extends StatelessWidget {
  final PageController pageview2Controller;

  const BottomNavBarSection({
    super.key,
    required this.pageview2Controller,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        pageview2Controller.jumpToPage(index);
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
      ],
    );
  }
}
