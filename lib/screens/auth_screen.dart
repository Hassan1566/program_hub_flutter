import 'package:flutter/material.dart';
import '../theme.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, required this.onContinue});
  final void Function(String name, String email) onContinue;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _register = false;
  bool _obscure = true;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(22),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 460),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(26),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          width: 62, height: 62,
                          decoration: BoxDecoration(color: paleBlue, borderRadius: BorderRadius.circular(18)),
                          child: const Icon(Icons.hub_rounded, color: blue, size: 32),
                        ),
                        const SizedBox(height: 22),
                        const Text('Program Hub', style: TextStyle(fontSize: 29, fontWeight: FontWeight.w900, color: navy)),
                        const SizedBox(height: 8),
                        Text(_register ? 'Create your profile to discover opportunities.' : 'Welcome back. Sign in to continue.', style: const TextStyle(color: muted, height: 1.45)),
                        const SizedBox(height: 26),
                        if (_register) ...[
                          const Text('Full name', style: TextStyle(fontWeight: FontWeight.w700)),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _name,
                            decoration: const InputDecoration(hintText: 'Your full name', prefixIcon: Icon(Icons.person_outline)),
                            validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter your name' : null,
                          ),
                          const SizedBox(height: 16),
                        ],
                        const Text('Email address', style: TextStyle(fontWeight: FontWeight.w700)),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(hintText: 'you@example.com', prefixIcon: Icon(Icons.mail_outline)),
                          validator: (v) => (v == null || !v.contains('@') || !v.contains('.')) ? 'Enter a valid email address' : null,
                        ),
                        const SizedBox(height: 16),
                        const Text('Password', style: TextStyle(fontWeight: FontWeight.w700)),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _password,
                          obscureText: _obscure,
                          decoration: InputDecoration(
                            hintText: 'Enter password',
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined), onPressed: () => setState(() => _obscure = !_obscure)),
                          ),
                          validator: (v) => (v == null || v.length < 4) ? 'Use at least 4 characters for this demo' : null,
                        ),
                        const SizedBox(height: 22),
                        FilledButton(
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) return;
                            final email = _email.text.trim();
                            final name = _register ? _name.text.trim() : (email.split('@').first);
                            widget.onContinue(name, email);
                          },
                          child: Text(_register ? 'Create account' : 'Sign in'),
                        ),
                        const SizedBox(height: 12),
                        TextButton(
                          onPressed: () => setState(() => _register = !_register),
                          child: Text(_register ? 'Already have an account? Sign in' : 'New here? Create a profile'),
                        ),
                        const SizedBox(height: 6),
                        const Text('Demo mode: credentials are not sent to a server or stored.', textAlign: TextAlign.center, style: TextStyle(color: muted, fontSize: 11.5)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
