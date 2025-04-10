import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_event.freezed.dart';

@freezed
class JobEvent with _$JobEvent {
  const factory JobEvent.fetchJobs() = FetchJobs;
}

