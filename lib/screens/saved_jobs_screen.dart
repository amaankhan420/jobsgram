import 'package:flutter/material.dart';

import '../../model/job_model.dart';
import '../data/storage/job_storage.dart';
import 'job_detail_screen.dart';

class SavedJobsScreen extends StatefulWidget {
  const SavedJobsScreen({super.key});

  @override
  State<SavedJobsScreen> createState() => _SavedJobsScreenState();
}

class _SavedJobsScreenState extends State<SavedJobsScreen> {
  List<JobModel> savedJobs = [];

  @override
  void initState() {
    super.initState();
    _loadJobs();
  }

  Future<void> _loadJobs() async {
    final jobs = await JobStorage.getSavedJobs();
    setState(() => savedJobs = jobs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saved Jobs')),
      body:
          savedJobs.isEmpty
              ? const Center(child: Text("No saved jobs."))
              : ListView.builder(
                itemCount: savedJobs.length,
                itemBuilder: (context, index) {
                  final job = savedJobs[index];
                  return Dismissible(
                    key: Key(job.id ?? job.position ?? index.toString()),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) async {
                      await JobStorage.removeJob(job);
                      setState(() => savedJobs.removeAt(index));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${job.position} removed')),
                      );
                    },
                    child: ListTile(
                      title: Text(job.position ?? 'No Title'),
                      subtitle: Text(job.company ?? 'No Company'),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => JobDetailScreen(job: job),
                          ),
                        );
                        _loadJobs();
                      },
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          await JobStorage.removeJob(job);
                          _loadJobs();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${job.position} deleted')),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
