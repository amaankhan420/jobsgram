import 'package:json_annotation/json_annotation.dart';

part 'job_model.g.dart';

@JsonSerializable()
class JobModel {
  final String? id;
  final String? company;
  final String? position;
  final String? location;
  final String? url;
  final String? description;
  final String? date;
  final int? salary_min;
  final int? salary_max;

  JobModel({
    this.id,
    this.company,
    this.position,
    this.location,
    this.url,
    this.description,
    this.date,
    this.salary_min,
    this.salary_max,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);

  Map<String, dynamic> toJson() => _$JobModelToJson(this);
}
