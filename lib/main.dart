import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/job_list/job_bloc.dart';
import 'bloc/job_list/job_event.dart';
import 'data/remote/job_api_service.dart';
import 'screens/job_list_screen.dart';
import 'theme/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final jobApiService = JobApiService();
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Job Listing Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.currentTheme,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: BlocProvider(
        create: (_) => JobBloc(jobApiService)..add(const JobEvent.fetchJobs()),
        child: const JobListScreen(),
      ),
    );
  }
}
