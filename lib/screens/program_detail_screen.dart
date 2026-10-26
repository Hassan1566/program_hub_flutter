import 'package:flutter/material.dart';
import '../models/program.dart';
import '../theme.dart';

class ProgramDetailScreen extends StatefulWidget {
  const ProgramDetailScreen({super.key, required this.program});
  final Program program;
  @override
  State<ProgramDetailScreen> createState() => _ProgramDetailScreenState();
}

class _ProgramDetailScreenState extends State<ProgramDetailScreen> {
  bool _applied = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.program;
    final color = Color(p.colorValue);
    return Scaffold(
      appBar: AppBar(title: const Text('Program details')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 28),
        children: [
          Container(
            padding: const EdgeInsets.all(23),
            decoration: BoxDecoration(color: color.withValues(alpha: .10), borderRadius: BorderRadius.circular(22)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(width: 54, height: 54, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)), child: Icon(Icons.auto_awesome_outlined, color: color, size: 28)),
              const SizedBox(height: 20),
              Text(p.category.toUpperCase(), style: TextStyle(color: color, letterSpacing: 1.2, fontSize: 11, fontWeight: FontWeight.w900)),
              const SizedBox(height: 7),
              Text(p.title, style: const TextStyle(color: navy, fontSize: 27, fontWeight: FontWeight.w900, height: 1.15)),
              const SizedBox(height: 8),
              Text(p.organization, style: const TextStyle(color: muted)),
            ]),
          ),
          const SizedBox(height: 18),
          Row(children: [
            Expanded(child: _DetailFact(icon: Icons.calendar_today_outlined, label: 'Starts', value: p.startDate)),
            const SizedBox(width: 10),
            Expanded(child: _DetailFact(icon: Icons.timer_outlined, label: 'Duration', value: p.duration)),
          ]),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(child: _DetailFact(icon: Icons.location_on_outlined, label: 'Location', value: p.location)),
            const SizedBox(width: 10),
            Expanded(child: _DetailFact(icon: Icons.laptop_chromebook_outlined, label: 'Format', value: p.mode)),
          ]),
          const SizedBox(height: 24),
          const Text('About this program', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900, color: navy)),
          const SizedBox(height: 8),
          Text(p.description, style: const TextStyle(color: muted, height: 1.65)),
          const SizedBox(height: 22),
          const Text('Eligibility', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900, color: navy)),
          const SizedBox(height: 9),
          ...p.eligibility.map((e) => Padding(
            padding: const EdgeInsets.only(bottom: 9),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [const Icon(Icons.check_circle_outline, color: green, size: 19), const SizedBox(width: 9), Expanded(child: Text(e, style: const TextStyle(color: muted, height: 1.4)))]),
          )),
          const SizedBox(height: 16),
          Card(child: Padding(padding: const EdgeInsets.all(16), child: Row(children: [
            const Icon(Icons.event_busy_outlined, color: orange),
            const SizedBox(width: 11),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Application deadline', style: TextStyle(color: muted, fontSize: 12)),
              const SizedBox(height: 4),
              Text(p.deadline, style: const TextStyle(color: navy, fontWeight: FontWeight.w800)),
            ])),
            Text(p.status, style: TextStyle(color: p.status == 'Closed' ? muted : green, fontWeight: FontWeight.w800, fontSize: 12)),
          ]))),
          const SizedBox(height: 18),
          FilledButton.icon(
            onPressed: p.status == 'Closed' || _applied ? null : () => setState(() => _applied = true),
            icon: Icon(_applied ? Icons.check_circle_outline : Icons.send_outlined),
            label: Text(_applied ? 'Interest recorded (demo)' : (p.status == 'Closed' ? 'Applications closed' : 'Register interest')),
          ),
          const SizedBox(height: 8),
          const Text('Demo only: this records a temporary on-screen state and does not submit a real application.', textAlign: TextAlign.center, style: TextStyle(color: muted, fontSize: 11.5)),
        ],
      ),
    );
  }
}

class _DetailFact extends StatelessWidget {
  const _DetailFact({required this.icon, required this.label, required this.value});
  final IconData icon;
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) => Card(child: Padding(
    padding: const EdgeInsets.all(13),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Icon(icon, color: blue, size: 19),
      const SizedBox(height: 10),
      Text(label, style: const TextStyle(color: muted, fontSize: 11)),
      const SizedBox(height: 4),
      Text(value, style: const TextStyle(color: navy, fontWeight: FontWeight.w800, fontSize: 12.5), maxLines: 2, overflow: TextOverflow.ellipsis),
    ]),
  ));
}
