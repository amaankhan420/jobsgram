// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobModel _$JobModelFromJson(Map<String, dynamic> json) => JobModel(
  id: json['id'] as String?,
  company: json['company'] as String?,
  position: json['position'] as String?,
  location: json['location'] as String?,
  url: json['url'] as String?,
  description: json['description'] as String?,
  date: json['date'] as String?,
  salary_min: (json['salary_min'] as num?)?.toInt(),
  salary_max: (json['salary_max'] as num?)?.toInt(),
);

Map<String, dynamic> _$JobModelToJson(JobModel instance) => <String, dynamic>{
  'id': instance.id,
  'company': instance.company,
  'position': instance.position,
  'location': instance.location,
  'url': instance.url,
  'description': instance.description,
  'date': instance.date,
  'salary_min': instance.salary_min,
  'salary_max': instance.salary_max,
};
