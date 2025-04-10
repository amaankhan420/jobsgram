import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../model/job_model.dart';
import '../data/storage/job_storage.dart';

class JobDetailScreen extends StatelessWidget {
  final JobModel job;

  const JobDetailScreen({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(job.position ?? 'Job Details')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              job.position ?? 'No Position',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              job.company ?? 'Unknown Company',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Divider(height: 24),

            _buildDetailRow('Location', job.location),
            _buildDetailRow(
              'Salary',
              _formatSalary(job.salary_min, job.salary_max),
            ),
            _buildDetailRow('Posted on', _formatDate(job.date)),

            const SizedBox(height: 10),
            if (job.url != null && job.url!.isNotEmpty)
              ElevatedButton(
                onPressed: () async {
                  try {
                    final Uri jobUri = Uri.parse(job.url!);
                    final launched = await launchUrl(
                      jobUri,
                      mode: LaunchMode.externalApplication,
                    );
                    if (!launched) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Could not launch job URL'),
                        ),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Something went wrong')),
                    );
                  }
                },
                child: const Text("Apply Now"),
              ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () async {
                await JobStorage.saveJob(job);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Job saved!')));
              },
              child: const Text("Save Job"),
            ),

            const SizedBox(height: 16),
            const Text(
              "Job Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Html(data: job.description ?? 'No description provided'),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    return value != null && value.isNotEmpty
        ? Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$label: ",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(child: Text(value)),
            ],
          ),
        )
        : const SizedBox();
  }

  String _formatSalary(int? min, int? max) {
    if (min == 0 && max == 0) return "Not disclosed";
    if (min != null && max != null) return "\$$min - \$$max";
    return "Not available";
  }

  String _formatDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return "Unknown";
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('dd MMM yyyy').format(date);
    } catch (e) {
      return "Invalid date";
    }
  }
}
