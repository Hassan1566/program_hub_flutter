# Program Hub — Flutter

A responsive Flutter demo app inspired by the supplied feature list.

## Included
- Demo login and profile creation (local, in-memory only)
- Home dashboard with upcoming programs and announcements
- Searchable and filterable program catalogue
- Program detail pages with eligibility, dates, location, and application status
- Feedback/survey form with validation and local confirmation
- Notifications and announcement list
- Profile editing and sign out
- Realistic sample/mock program data

## Run locally
1. Install Flutter and verify setup with `flutter doctor`.
2. Extract this project.
3. Run `flutter pub get`.
4. Run `flutter run`.

## Demo account
The login screen accepts any non-empty email and password. This is **demo-only authentication**; it does not securely create accounts or store credentials. Connect Firebase Authentication or a backend before production use.

## Mock data
All programs and announcements are stored in `lib/data/mock_data.dart`. No external API or database is required.

## Suggested next steps
- Replace demo auth with Firebase Authentication.
- Persist profiles, feedback and applications in Firestore or a REST API.
- Add automated tests and CI.
