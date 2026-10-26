import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/program.dart';
import '../theme.dart';
import '../widgets/program_card.dart';
import '../widgets/section_heading.dart';
import 'program_detail_screen.dart';

class ProgramsScreen extends StatefulWidget {
  const ProgramsScreen({super.key});
  @override
  State<ProgramsScreen> createState() => _ProgramsScreenState();
}

class _ProgramsScreenState extends State<ProgramsScreen> {
  final _search = TextEditingController();
  String _category = 'All';
  String _status = 'All';
  final _categories = const ['All', 'Technology', 'Data', 'Community', 'Leadership', 'Design'];

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final results = mockPrograms.where((p) {
      final query = _search.text.toLowerCase();
      final matchesQuery = p.title.toLowerCase().contains(query) || p.organization.toLowerCase().contains(query) || p.location.toLowerCase().contains(query);
      final matchesCategory = _category == 'All' || p.category == _category;
      final matchesStatus = _status == 'All' || p.status == _status;
      return matchesQuery && matchesCategory && matchesStatus;
    }).toList();
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 28),
      children: [
        const SectionHeading(title: 'Find your next opportunity', subtitle: 'Browse programs and explore the details before applying.'),
        const SizedBox(height: 18),
        TextField(
          controller: _search,
          onChanged: (_) => setState(() {}),
          decoration: const InputDecoration(hintText: 'Search title, organization, location...', prefixIcon: Icon(Icons.search)),
        ),
        const SizedBox(height: 14),
        const Text('Category', style: TextStyle(fontWeight: FontWeight.w800, color: navy)),
        const SizedBox(height: 8),
        SizedBox(
          height: 42,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 7),
            itemBuilder: (context, i) {
              final item = _categories[i];
              return ChoiceChip(label: Text(item), selected: _category == item, onSelected: (_) => setState(() => _category = item));
            },
          ),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          value: _status,
          decoration: const InputDecoration(labelText: 'Application status'),
          items: const ['All', 'Open', 'Closing soon', 'Closed'].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
          onChanged: (v) => setState(() => _status = v ?? 'All'),
        ),
        const SizedBox(height: 18),
        SectionHeading(title: 'Programs (${results.length})', subtitle: 'Sample listings for demonstration'),
        const SizedBox(height: 12),
        if (results.isEmpty)
          const Padding(padding: EdgeInsets.all(28), child: Column(children: [Icon(Icons.search_off, size: 42, color: muted), SizedBox(height: 10), Text('No programs match your filters.', style: TextStyle(color: muted))]))
        else
          ...results.map((Program p) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ProgramCard(program: p, onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProgramDetailScreen(program: p)))),
          )),
      ],
    );
  }
}
