import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/section_heading.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.name, required this.email, required this.onSignOut, required this.onUpdateName});
  final String name;
  final String email;
  final VoidCallback onSignOut;
  final ValueChanged<String> onUpdateName;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final TextEditingController _nameController = TextEditingController(text: widget.name);
  final _interests = <String>{'Technology'};
  final _options = const ['Technology', 'Data', 'Design', 'Leadership', 'Community'];

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 28),
      children: [
        const SectionHeading(title: 'Your profile', subtitle: 'Manage your personal details and interests.'),
        const SizedBox(height: 18),
        Card(child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            CircleAvatar(radius: 38, backgroundColor: paleBlue, child: Text(widget.name.isEmpty ? '?' : widget.name.trim()[0].toUpperCase(), style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: blue))),
            const SizedBox(height: 12),
            Text(widget.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: navy)),
            const SizedBox(height: 4),
            Text(widget.email, style: const TextStyle(color: muted)),
          ]),
        )),
        const SizedBox(height: 14),
        Card(child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Personal information', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900, color: navy)),
            const SizedBox(height: 14),
            const Text('Full name', style: TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 7),
            TextField(controller: _nameController, decoration: const InputDecoration(prefixIcon: Icon(Icons.person_outline))),
            const SizedBox(height: 12),
            const Text('Email address', style: TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 7),
            TextField(readOnly: true, controller: TextEditingController(text: widget.email), decoration: const InputDecoration(prefixIcon: Icon(Icons.mail_outline))),
            const SizedBox(height: 16),
            const Text('Interests', style: TextStyle(fontWeight: FontWeight.w800, color: navy)),
            const SizedBox(height: 8),
            Wrap(spacing: 8, runSpacing: 4, children: _options.map((x) => FilterChip(label: Text(x), selected: _interests.contains(x), onSelected: (selected) => setState(() { selected ? _interests.add(x) : _interests.remove(x); }))).toList()),
            const SizedBox(height: 18),
            SizedBox(width: double.infinity, child: FilledButton.icon(
              onPressed: () {
                if (_nameController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Name cannot be empty.')));
                  return;
                }
                widget.onUpdateName(_nameController.text.trim());
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile updated for this demo.')));
              },
              icon: const Icon(Icons.save_outlined),
              label: const Text('Save profile'),
            )),
          ]),
        )),
        const SizedBox(height: 12),
        OutlinedButton.icon(onPressed: widget.onSignOut, icon: const Icon(Icons.logout), label: const Text('Sign out')),
        const SizedBox(height: 8),
        const Text('Profile changes are temporary in this demo and reset when the app restarts.', textAlign: TextAlign.center, style: TextStyle(color: muted, fontSize: 11.5)),
      ],
    );
  }
}
