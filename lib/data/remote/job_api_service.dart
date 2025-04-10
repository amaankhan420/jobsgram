import 'dart:developer';
import 'package:dio/dio.dart';
import '../../model/job_model.dart';

class JobApiService {
  final Dio _dio = Dio();

  Future<List<JobModel>> fetchJobs() async {
    try {
      log("Fetching jobs from API...", name: "JobApiService");

      final response = await _dio.get("https://remoteok.io/api");

      log("Response status: ${response.statusCode}", name: "JobApiService");

      if (response.statusCode == 200) {
        final data = response.data;

        if (data is List && data.length > 1) {
          final jobData = data.skip(1).toList();

          log(
            "Successfully parsed ${jobData.length} jobs",
            name: "JobApiService",
          );

          return jobData
              .map((e) => JobModel.fromJson(e as Map<String, dynamic>))
              .toList();
        } else {
          log("Unexpected response format", name: "JobApiService");
          throw Exception('Unexpected response format');
        }
      } else {
        log(
          "Failed to fetch jobs: ${response.statusMessage}",
          name: "JobApiService",
        );
        throw Exception('Failed to fetch jobs');
      }
    } catch (e, stackTrace) {
      log(
        "Error fetching jobs: $e",
        name: "JobApiService",
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Error fetching jobs: $e');
    }
  }
}
