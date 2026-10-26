import 'package:flutter/material.dart';
import '../theme.dart';
import 'dashboard_screen.dart';
import 'programs_screen.dart';
import 'announcements_screen.dart';
import 'feedback_screen.dart';
import 'profile_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({
    super.key,
    required this.name,
    required this.email,
    required this.onSignOut,
    required this.onUpdateName,
  });

  final String name;
  final String email;
  final VoidCallback onSignOut;
  final ValueChanged<String> onUpdateName;

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      DashboardScreen(name: widget.name, onNavigate: (i) => setState(() => _index = i)),
      const ProgramsScreen(),
      const AnnouncementsScreen(),
      const FeedbackScreen(),
      ProfileScreen(name: widget.name, email: widget.email, onSignOut: widget.onSignOut, onUpdateName: widget.onUpdateName),
    ];
    final titles = ['Dashboard', 'Programs', 'Announcements', 'Feedback', 'My profile'];
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 34, height: 34,
              decoration: BoxDecoration(color: paleBlue, borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.hub_rounded, color: blue, size: 20),
            ),
            const SizedBox(width: 10),
            Text(titles[_index], style: const TextStyle(fontWeight: FontWeight.w800)),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Notifications',
            onPressed: () => setState(() => _index = 2),
            icon: const Badge(smallSize: 8, child: Icon(Icons.notifications_none_rounded)),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: IndexedStack(index: _index, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.space_dashboard_outlined), selectedIcon: Icon(Icons.space_dashboard_rounded), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.explore_outlined), selectedIcon: Icon(Icons.explore_rounded), label: 'Programs'),
          NavigationDestination(icon: Icon(Icons.campaign_outlined), selectedIcon: Icon(Icons.campaign_rounded), label: 'Updates'),
          NavigationDestination(icon: Icon(Icons.rate_review_outlined), selectedIcon: Icon(Icons.rate_review_rounded), label: 'Feedback'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
