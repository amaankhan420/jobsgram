import 'package:flutter/material.dart';
import '../../../model/job_model.dart';
import '../job_detail_screen.dart';

class JobCard extends StatelessWidget {
  final JobModel job;

  const JobCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 2,
      child: ListTile(
        title: Text(job.position ?? 'No title available'),
        subtitle: Text(job.company ?? 'Unknown company'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => JobDetailScreen(job: job)),
          );
        },
      ),
    );
  }
}
