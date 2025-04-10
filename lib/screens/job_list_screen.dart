import 'package:flutter/material.dart';
import 'package:job_application/screens/saved_jobs_screen.dart';
import 'package:job_application/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/job_list_body.dart';

class JobListScreen extends StatelessWidget {
  const JobListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        final isDark = themeProvider.currentTheme == ThemeMode.dark;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Find Your Dream Role'),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.bookmark_outline),
                tooltip: 'Saved Jobs',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SavedJobsScreen()),
                  );
                },
              ),
              IconButton(
                icon: Icon(isDark ? Icons.wb_sunny : Icons.nightlight_round),
                tooltip: isDark ? 'Light Mode' : 'Dark Mode',
                onPressed: () {
                  themeProvider.toggleTheme();
                },
              ),
            ],
          ),
          body: const JobListBody(),
        );
      },
    );
  }
}
