import 'package:freezed_annotation/freezed_annotation.dart';
import '../../model/job_model.dart';

part 'job_state.freezed.dart';

@freezed
class JobState with _$JobState {
  const factory JobState.initial() = JobStateInitial;
  const factory JobState.loading() = JobStateLoading;
  const factory JobState.loaded(List<JobModel> jobs) = JobStateLoaded;
  const factory JobState.error(String message) = JobStateError;
}
