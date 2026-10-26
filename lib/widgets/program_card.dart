import 'package:flutter/material.dart';
import '../models/program.dart';
import '../theme.dart';

class ProgramCard extends StatelessWidget {
  const ProgramCard({super.key, required this.program, required this.onTap});

  final Program program;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = Color(program.colorValue);
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 43,
                    height: 43,
                    decoration: BoxDecoration(color: color.withValues(alpha: .12), borderRadius: BorderRadius.circular(13)),
                    child: Icon(_iconFor(program.category), color: color),
                  ),
                  const Spacer(),
                  _StatusPill(status: program.status),
                ],
              ),
              const SizedBox(height: 15),
              Text(program.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: navy)),
              const SizedBox(height: 5),
              Text(program.organization, style: const TextStyle(color: muted, fontSize: 12.5)),
              const SizedBox(height: 14),
              _InfoLine(icon: Icons.location_on_outlined, text: program.location),
              const SizedBox(height: 7),
              _InfoLine(icon: Icons.calendar_month_outlined, text: 'Starts ${program.startDate}'),
              const SizedBox(height: 13),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(20)),
                    child: Text(program.category, style: const TextStyle(fontSize: 11, color: navy, fontWeight: FontWeight.w700)),
                  ),
                  const Spacer(),
                  const Text('View details', style: TextStyle(color: blue, fontWeight: FontWeight.w700, fontSize: 12)),
                  const SizedBox(width: 3),
                  const Icon(Icons.arrow_forward, size: 14, color: blue),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _iconFor(String category) {
    switch (category) {
      case 'Technology': return Icons.terminal_rounded;
      case 'Data': return Icons.query_stats_rounded;
      case 'Community': return Icons.groups_2_outlined;
      case 'Leadership': return Icons.lightbulb_outline_rounded;
      default: return Icons.palette_outlined;
    }
  }
}

class _InfoLine extends StatelessWidget {
  const _InfoLine({required this.icon, required this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Icon(icon, size: 15, color: muted),
      const SizedBox(width: 6),
      Expanded(child: Text(text, style: const TextStyle(color: muted, fontSize: 12.5), maxLines: 1, overflow: TextOverflow.ellipsis)),
    ],
  );
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.status});
  final String status;
  @override
  Widget build(BuildContext context) {
    final closed = status == 'Closed';
    final soon = status == 'Closing soon';
    final color = closed ? muted : (soon ? const Color(0xFFB45309) : green);
    final bg = closed ? const Color(0xFFF1F5F9) : (soon ? const Color(0xFFFFF7ED) : const Color(0xFFECFDF5));
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(30)),
      child: Text(status, style: TextStyle(color: color, fontSize: 10.5, fontWeight: FontWeight.w800)),
    );
  }
}
