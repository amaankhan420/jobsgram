import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../model/job_model.dart';

class JobStorage {
  static const String _savedJobsKey = 'saved_jobs';

  static Future<void> saveJob(JobModel job) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> savedJobs = prefs.getStringList(_savedJobsKey) ?? [];

    final String jobJson = jsonEncode(job.toJson());

    if (!savedJobs.contains(jobJson)) {
      savedJobs.add(jobJson);
      await prefs.setStringList(_savedJobsKey, savedJobs);
    }
  }

  static Future<List<JobModel>> getSavedJobs() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> savedJobs = prefs.getStringList(_savedJobsKey) ?? [];

    return savedJobs
        .map((jsonStr) => JobModel.fromJson(jsonDecode(jsonStr)))
        .toList();
  }

  static Future<void> removeJob(JobModel job) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> savedJobs = prefs.getStringList(_savedJobsKey) ?? [];

    savedJobs.removeWhere((element) {
      final decoded = jsonDecode(element);
      return decoded['id'] == job.id;
    });

    await prefs.setStringList(_savedJobsKey, savedJobs);
  }

  static Future<void> clearAllJobs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_savedJobsKey);
  }
}
