import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../theme.dart';
import '../widgets/section_heading.dart';

class AnnouncementsScreen extends StatelessWidget {
  const AnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 28),
      children: [
        const SectionHeading(title: 'Announcements & notifications', subtitle: 'Important updates to help you stay informed.'),
        const SizedBox(height: 18),
        Container(
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(color: paleBlue, borderRadius: BorderRadius.circular(16)),
          child: const Row(children: [
            Icon(Icons.notifications_active_outlined, color: blue, size: 25),
            SizedBox(width: 12),
            Expanded(child: Text('You are all caught up with the latest sample updates.', style: TextStyle(color: navy, height: 1.4, fontWeight: FontWeight.w600))),
          ]),
        ),
        const SizedBox(height: 12),
        ...mockAnnouncements.map((a) => Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(17),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(width: 43, height: 43, decoration: BoxDecoration(color: paleBlue, borderRadius: BorderRadius.circular(13)), child: Icon(_icon(a.type), color: blue)),
              const SizedBox(width: 13),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Expanded(child: Text(a.title, style: const TextStyle(fontWeight: FontWeight.w800, color: navy, height: 1.3))),
                  Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(20)), child: Text(a.type, style: const TextStyle(color: muted, fontSize: 10, fontWeight: FontWeight.w700))),
                ]),
                const SizedBox(height: 7),
                Text(a.message, style: const TextStyle(color: muted, height: 1.5, fontSize: 13)),
                const SizedBox(height: 10),
                Text(a.date, style: const TextStyle(color: muted, fontSize: 11)),
              ])),
            ]),
          ),
        )),
      ],
    );
  }

  IconData _icon(String type) => switch (type) {
    'Survey' => Icons.rate_review_outlined,
    'Reminder' => Icons.checklist_rounded,
    _ => Icons.campaign_outlined,
  };
}
