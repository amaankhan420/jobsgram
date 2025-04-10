// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JobState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobState()';
}


}

/// @nodoc
class $JobStateCopyWith<$Res>  {
$JobStateCopyWith(JobState _, $Res Function(JobState) __);
}


/// @nodoc


class JobStateInitial implements JobState {
  const JobStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobState.initial()';
}


}




/// @nodoc


class JobStateLoading implements JobState {
  const JobStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JobState.loading()';
}


}




/// @nodoc


class JobStateLoaded implements JobState {
  const JobStateLoaded(final  List<JobModel> jobs): _jobs = jobs;
  

 final  List<JobModel> _jobs;
 List<JobModel> get jobs {
  if (_jobs is EqualUnmodifiableListView) return _jobs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_jobs);
}


/// Create a copy of JobState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobStateLoadedCopyWith<JobStateLoaded> get copyWith => _$JobStateLoadedCopyWithImpl<JobStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobStateLoaded&&const DeepCollectionEquality().equals(other._jobs, _jobs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_jobs));

@override
String toString() {
  return 'JobState.loaded(jobs: $jobs)';
}


}

/// @nodoc
abstract mixin class $JobStateLoadedCopyWith<$Res> implements $JobStateCopyWith<$Res> {
  factory $JobStateLoadedCopyWith(JobStateLoaded value, $Res Function(JobStateLoaded) _then) = _$JobStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<JobModel> jobs
});




}
/// @nodoc
class _$JobStateLoadedCopyWithImpl<$Res>
    implements $JobStateLoadedCopyWith<$Res> {
  _$JobStateLoadedCopyWithImpl(this._self, this._then);

  final JobStateLoaded _self;
  final $Res Function(JobStateLoaded) _then;

/// Create a copy of JobState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? jobs = null,}) {
  return _then(JobStateLoaded(
null == jobs ? _self._jobs : jobs // ignore: cast_nullable_to_non_nullable
as List<JobModel>,
  ));
}


}

/// @nodoc


class JobStateError implements JobState {
  const JobStateError(this.message);
  

 final  String message;

/// Create a copy of JobState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobStateErrorCopyWith<JobStateError> get copyWith => _$JobStateErrorCopyWithImpl<JobStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'JobState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $JobStateErrorCopyWith<$Res> implements $JobStateCopyWith<$Res> {
  factory $JobStateErrorCopyWith(JobStateError value, $Res Function(JobStateError) _then) = _$JobStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$JobStateErrorCopyWithImpl<$Res>
    implements $JobStateErrorCopyWith<$Res> {
  _$JobStateErrorCopyWithImpl(this._self, this._then);

  final JobStateError _self;
  final $Res Function(JobStateError) _then;

/// Create a copy of JobState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(JobStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
