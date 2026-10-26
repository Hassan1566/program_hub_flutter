import 'package:flutter/material.dart';
import 'screens/auth_screen.dart';
import 'screens/main_shell.dart';
import 'theme.dart';

class ProgramHubApp extends StatefulWidget {
  const ProgramHubApp({super.key});

  @override
  State<ProgramHubApp> createState() => _ProgramHubAppState();
}

class _ProgramHubAppState extends State<ProgramHubApp> {
  String? _email;
  String _name = '';

  void _signIn(String name, String email) {
    setState(() {
      _name = name;
      _email = email;
    });
  }

  void _signOut() => setState(() {
        _email = null;
        _name = '';
      });

  void _updateProfile(String name) => setState(() => _name = name);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Program Hub',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: _email == null
          ? AuthScreen(onContinue: _signIn)
          : MainShell(
              name: _name,
              email: _email!,
              onSignOut: _signOut,
              onUpdateName: _updateProfile,
            ),
    );
  }
}
