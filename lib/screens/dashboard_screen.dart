// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../theme.dart';
import '../widgets/program_card.dart';
import '../widgets/section_heading.dart';
import 'program_detail_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen(
      {super.key, required this.name, required this.onNavigate});
  final String name;
  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) {
    final firstName = name.trim().split(' ').first;
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 28),
      children: [
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Color(0xFF173E67), Color(0xFF2563A6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('YOUR NEXT OPPORTUNITY STARTS HERE',
                  style: TextStyle(
                      color: Color(0xFFCEE4FF),
                      fontSize: 10,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 12),
              Text('Good to see you, $firstName!',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w900)),
              const SizedBox(height: 8),
              const Text(
                  'Discover programs, build skills, and take your next step.',
                  style: TextStyle(color: Colors.white, height: 1.5)),
              const SizedBox(height: 18),
              FilledButton.icon(
                style: FilledButton.styleFrom(
                    backgroundColor: Colors.white, foregroundColor: navy),
                onPressed: () => onNavigate(1),
                icon: const Icon(Icons.search),
                label: const Text('Explore programs'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        Row(
          children: [
            Expanded(
                child: _MetricCard(
                    icon: Icons.event_available_outlined,
                    number: '5',
                    label: 'Open programs',
                    tint: paleBlue,
                    color: blue)),
            const SizedBox(width: 10),
            Expanded(
                child: _MetricCard(
                    icon: Icons.campaign_outlined,
                    number: '3',
                    label: 'New updates',
                    tint: const Color(0xFFECFDF5),
                    color: const Color(0xFF16835D))),
            const SizedBox(width: 10),
            Expanded(
                child: _MetricCard(
                    icon: Icons.assignment_outlined,
                    number: '1',
                    label: 'Survey',
                    tint: const Color(0xFFFFF7ED),
                    color: const Color(0xFFB45309))),
          ],
        ),
        const SizedBox(height: 26),
        SectionHeading(
            title: 'Featured programs',
            subtitle: 'Hand-picked opportunities to get you started',
            trailing: TextButton(
                onPressed: () => onNavigate(1), child: const Text('View all'))),
        const SizedBox(height: 12),
        ...mockPrograms.take(2).map((p) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ProgramCard(
                  program: p,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ProgramDetailScreen(program: p)))),
            )),
        const SizedBox(height: 12),
        SectionHeading(
            title: 'Latest announcement',
            trailing: TextButton(
                onPressed: () => onNavigate(2), child: const Text('See all'))),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(17),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                        color: paleBlue,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Icon(Icons.campaign_outlined, color: blue)),
                const SizedBox(width: 13),
                const Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text('Applications are open for November programs',
                          style: TextStyle(
                              fontWeight: FontWeight.w800, color: navy)),
                      SizedBox(height: 5),
                      Text(
                          'Explore new technology, data, design, and leadership opportunities.',
                          style: TextStyle(
                              color: muted, height: 1.45, fontSize: 13)),
                      SizedBox(height: 8),
                      Text('Oct 24, 2026  •  Programs',
                          style: TextStyle(color: muted, fontSize: 11)),
                    ])),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard(
      {required this.icon,
      required this.number,
      required this.label,
      required this.tint,
      required this.color});
  final IconData icon;
  final String number;
  final String label;
  final Color tint;
  final Color color;
  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: tint, borderRadius: BorderRadius.circular(10)),
                child: Icon(icon, color: color, size: 18)),
            const SizedBox(height: 10),
            Text(number,
                style: const TextStyle(
                    fontSize: 23, fontWeight: FontWeight.w900, color: navy)),
            Text(label,
                style: const TextStyle(fontSize: 10.5, color: muted),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          ]),
        ),
      );
}
