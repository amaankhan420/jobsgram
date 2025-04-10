import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/job_list/job_event.dart';
import '../../../model/job_model.dart';
import '../../bloc/job_list/job_bloc.dart';
import '../../bloc/job_list/job_state.dart';
import 'job_card.dart';

class JobListBody extends StatefulWidget {
  const JobListBody({super.key});

  @override
  State<JobListBody> createState() => _JobListBodyState();
}

class _JobListBodyState extends State<JobListBody> {
  final TextEditingController _searchController = TextEditingController();
  List<JobModel> _filteredJobs = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterJobs);
  }

  void _filterJobs() {
    final query = _searchController.text.toLowerCase().trim();
    final state = context.read<JobBloc>().state;

    List<JobModel> allJobs = [];
    if (state is JobStateLoaded) {
      allJobs = state.jobs;
    }

    setState(() {
      _filteredJobs =
          allJobs
              .where(
                (job) =>
                    (job.position?.toLowerCase() ?? '').contains(query) ||
                    (job.company?.toLowerCase() ?? '').contains(query),
              )
              .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search jobs/company...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<JobBloc, JobState>(
            builder: (context, state) {
              if (state is JobStateInitial) {
                return const Center(child: Text('Welcome'));
              } else if (state is JobStateLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is JobStateLoaded) {
                final jobs =
                    _searchController.text.isEmpty ? state.jobs : _filteredJobs;

                if (jobs.isEmpty) {
                  return const Center(child: Text("No jobs found"));
                }

                return ListView.builder(
                  itemCount: jobs.length,
                  itemBuilder: (context, index) => JobCard(job: jobs[index]),
                );
              } else if (state is JobStateError) {
                final message =
                    state.message.toLowerCase().contains("socket")
                        ? "Please check your internet connection."
                        : "Unable to retrieve data.";

                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(message, style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed:
                            () => context.read<JobBloc>().add(
                              const JobEvent.fetchJobs(),
                            ),
                        child: const Text("Retry"),
                      ),
                    ],
                  ),
                );
              }

              return const Center(child: Text("Unexpected error occurred"));
            },
          ),
        ),
      ],
    );
  }
}
