import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/remote/job_api_service.dart';
import 'job_event.dart';
import 'job_state.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  final JobApiService jobApiService;

  JobBloc(this.jobApiService) : super(const JobState.initial()) {
    on<JobEvent>((event, emit) async {
      if (event is FetchJobs) {
        emit(const JobState.loading());
        try {
          final jobs = await jobApiService.fetchJobs();
          emit(JobState.loaded(jobs));
        } catch (e) {
          emit(JobState.error(e.toString()));
        }
      }
    });
  }
}
