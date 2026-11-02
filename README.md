# Program Hub — Flutter

A Flutter app for discovering learning programs, events, and opportunities. Includes demo login/profile creation, dashboard, searchable program catalogue, program details, feedback/surveys, and announcements.

## Project overview
Program Hub helps users:
- Create a profile and sign in to the demo experience.
- Discover programs using search and category/status filters.
- Review descriptions, dates, eligibility, locations, and deadlines.
- Register interest in a program (demo interaction).
- Read announcements and submit platform feedback.

**Current scope:** sample/mock data and temporary in-memory interactions only. No backend or persistent authentication/data storage is connected.

## Features
- Login and profile creation
- Dashboard with featured programs and announcements
- Program listing, search, category/status filters
- Program details and eligibility
- Feedback form with validation and confirmation
- Announcements and notifications
- Profile editing and sign-out
- Material 3 responsive UI

## Setup and run
### Requirements
- Flutter SDK with Dart 3.3+
- Android Studio/VS Code (or another Flutter IDE)
- Emulator/device, iOS simulator (macOS), or web browser

Check installation:
```bash
flutter doctor
```

Clone and launch:
```bash
git clone https://github.com/Hassan1566/program_hub_flutter.git
cd program_hub_flutter
flutter pub get
flutter test
flutter run
```

### Demo sign-in
The login accepts an email containing `@` and `.`, plus a password of at least four characters. Registration also asks for a name.

> **Security:** This is demo-only authentication. Credentials are not sent to a server or securely stored. Connect Firebase Authentication or a secure backend before production.

## Mock data
Edit `lib/data/mock_data.dart` to add/update programs and announcements. Each sample program has a title, organization, category, location, dates, duration, description, eligibility, status, and delivery mode.

## Screenshots
Capture the app while running and add PNGs in `screenshots/`. Recommended:
- `screenshots/login.png`
- `screenshots/dashboard.png`
- `screenshots/programs.png`
- `screenshots/program-details.png`
- `screenshots/feedback.png`
- `screenshots/announcements.png`

Embed captures here after adding them, e.g. `![Dashboard](screenshots/dashboard.png)`.

## Structure
```
lib/
  data/mock_data.dart
  models/
  screens/
  widgets/
  app.dart
  main.dart
  theme.dart
test/
  widget_test.dart
```

## Changelog
See [CHANGELOG.md](CHANGELOG.md).

## Contributing
1. Fork the repository and create a feature branch.
2. Make focused changes and add/update tests.
3. Run `flutter test` and verify with `flutter run`.
4. Open a pull request with a clear description.

Keep UI changes consistent with Material 3 and update documentation for user-facing changes.

## License
No license has been selected yet; all rights reserved by default until one is added.
