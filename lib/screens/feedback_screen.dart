import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/section_heading.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});
  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  final _comments = TextEditingController();
  String _topic = 'Programs and opportunities';
  String _rating = 'Good';
  bool _contact = false;
  bool _submitted = false;

  @override
  void dispose() {
    _comments.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_submitted) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(width: 76, height: 76, decoration: const BoxDecoration(color: Color(0xFFECFDF5), shape: BoxShape.circle), child: const Icon(Icons.check_circle_outline, color: green, size: 42)),
            const SizedBox(height: 18),
            const Text('Thank you for your feedback!', style: TextStyle(color: navy, fontSize: 23, fontWeight: FontWeight.w900), textAlign: TextAlign.center),
            const SizedBox(height: 8),
            const Text('Your demo response has been recorded on this screen. No data was sent to a server.', style: TextStyle(color: muted, height: 1.5), textAlign: TextAlign.center),
            const SizedBox(height: 20),
            OutlinedButton(onPressed: () => setState(() { _submitted = false; _comments.clear(); _rating = 'Good'; _topic = 'Programs and opportunities'; _contact = false; }), child: const Text('Submit another response')),
          ]),
        ),
      );
    }
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 28),
      children: [
        const SectionHeading(title: 'Feedback & surveys', subtitle: 'Help us make the platform more useful for everyone.'),
        const SizedBox(height: 18),
        Card(child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Share your experience', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900, color: navy)),
              const SizedBox(height: 7),
              const Text('This short survey should take less than two minutes.', style: TextStyle(color: muted, height: 1.4)),
              const SizedBox(height: 20),
              const Text('What is your feedback about?', style: TextStyle(fontWeight: FontWeight.w800, color: navy)),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _topic,
                items: const ['Programs and opportunities', 'Dashboard and navigation', 'Accessibility', 'Announcements', 'Other'].map((x) => DropdownMenuItem(value: x, child: Text(x))).toList(),
                onChanged: (v) => setState(() => _topic = v ?? _topic),
              ),
              const SizedBox(height: 18),
              const Text('Overall experience', style: TextStyle(fontWeight: FontWeight.w800, color: navy)),
              const SizedBox(height: 8),
              Wrap(spacing: 8, children: ['Excellent', 'Good', 'Okay', 'Needs work'].map((x) => ChoiceChip(label: Text(x), selected: _rating == x, onSelected: (_) => setState(() => _rating = x))).toList()),
              const SizedBox(height: 18),
              const Text('Comments or suggestions', style: TextStyle(fontWeight: FontWeight.w800, color: navy)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _comments,
                maxLines: 5,
                decoration: const InputDecoration(hintText: 'Tell us what went well or what could improve...'),
                validator: (v) => (v == null || v.trim().length < 8) ? 'Please enter at least 8 characters.' : null,
              ),
              const SizedBox(height: 12),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                value: _contact,
                onChanged: (v) => setState(() => _contact = v ?? false),
                title: const Text('I am happy to be contacted about this feedback', style: TextStyle(fontSize: 13, color: muted)),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const SizedBox(height: 12),
              SizedBox(width: double.infinity, child: FilledButton.icon(
                onPressed: () { if (_formKey.currentState!.validate()) setState(() => _submitted = true); },
                icon: const Icon(Icons.send_outlined),
                label: const Text('Submit feedback'),
              )),
            ]),
          ),
        )),
      ],
    );
  }
}
