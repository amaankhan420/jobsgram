# 📱 Jobsgram

Jobsgram is a sleek and responsive Flutter job listing application that helps users discover, explore, and save their dream roles. Built with **Flutter**, **BLoC**, and **Freezed**, it follows a clean architecture and offers smooth theme toggling and persistent saved job data.

---

## ✨ Features

- 🔍 **Browse Jobs** — Fetches jobs via REST API using Dio.
- 📄 **View Details** — Tap on a job to see full job descriptions and apply links.
- 📌 **Save Jobs** — Bookmark interesting jobs to review later.
- 💡 **Theme Toggle** — Switch between dark and light mode manually.
- 💾 **Persistent Storage** — Saved jobs are stored locally using SharedPreferences.
- 🌐 **Launch Links** — Open job apply URLs in browser.
- 📜 **HTML Rendering** — Renders job descriptions cleanly using `flutter_html`.

---

## 🧱 Project Structure

lib/
├── bloc/
│   └── job_list/
│       ├── job_bloc.dart                # Handles business logic and state emission
│       ├── job_event.dart               # Defines user actions/events for the job bloc
│       ├── job_event.freezed.dart       # Freezed-generated union & copyWith code
│       ├── job_state.dart               # Represents various UI states (loading, loaded, error)
│       └── job_state.freezed.dart       # JSON serialization helpers (auto-generated)
│
├── data/
│   ├── remote/
│   │   └── job_api_service.dart         # Fetches job data from REST API using Dio
│   └── storage/
│       └── job_storage.dart             # Saves and retrieves jobs using shared_preferences
│
├── model/
│   ├── job_model.dart                   # Data class for job structure using Freezed
│   └── job_model.g.dart                 # Generated file for JSON (de)serialization
│
├── screens/
│   ├── job_list_screen.dart             # Main screen showing all job listings
│   ├── job_detail_screen.dart           # Displays detailed info about a selected job
│   └── saved_jobs_screen.dart           # Shows jobs that were saved/bookmarked
│
├── screens/widgets/
│   ├── job_card.dart                    # UI widget for displaying a single job preview
│   └── job_list_body.dart               # Wraps the full job list and its layout
│
├── theme/
│   └── theme_provider.dart              # Handles manual dark/light mode toggle
│
└── main.dart                            # Entry point; sets up theme, providers, and bloc

---

## 📦 Dependencies

**Core Packages:**
- [`flutter_bloc`](https://pub.dev/packages/flutter_bloc)
- [`provider`](https://pub.dev/packages/provider)
- [`dio`](https://pub.dev/packages/dio)
- [`shared_preferences`](https://pub.dev/packages/shared_preferences)

**Data Modeling:**
- [`freezed`](https://pub.dev/packages/freezed)
- [`json_serializable`](https://pub.dev/packages/json_serializable)
- [`freezed_annotation`](https://pub.dev/packages/freezed_annotation)
- [`json_annotation`](https://pub.dev/packages/json_annotation)

**UI & Utilities:**
- [`flutter_html`](https://pub.dev/packages/flutter_html)
- [`url_launcher`](https://pub.dev/packages/url_launcher)
- [`intl`](https://pub.dev/packages/intl)
- [`flutter_launcher_icons`](https://pub.dev/packages/flutter_launcher_icons)

**Dev Tools:**
- [`build_runner`](https://pub.dev/packages/build_runner)
- `flutter_test`

---

## 🚀 Getting Started

1. **Clone the repo**
   ```bash
   git clone https://github.com/amaankhan420/jobsgram.git
   cd jobsgram
