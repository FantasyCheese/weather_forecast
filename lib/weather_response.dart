import 'package:json_annotation/json_annotation.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  WeatherResponse({
    required this.success,
    required this.result,
    required this.records,
  });

  final String success;
  final Result result;
  final Records records;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) => _$WeatherResponseFromJson(json);
}

@JsonSerializable()
class Records {
  Records({
    required this.datasetDescription,
    required this.location,
  });

  final String datasetDescription;
  final List<Location> location;

  factory Records.fromJson(Map<String, dynamic> json) => _$RecordsFromJson(json);
}

@JsonSerializable()
class Location {
  Location({
    required this.locationName,
    required this.weatherElement,
  });

  final String locationName;
  final List<WeatherElement> weatherElement;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}

@JsonSerializable()
class WeatherElement {
  WeatherElement({
    required this.elementName,
    required this.time,
  });

  final String elementName;
  final List<Time> time;

  factory WeatherElement.fromJson(Map<String, dynamic> json) => _$WeatherElementFromJson(json);
}

@JsonSerializable()
class Time {
  Time({
    required this.startTime,
    required this.endTime,
    required this.parameter,
  });

  final DateTime startTime;
  final DateTime endTime;
  final Parameter parameter;

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);
}

@JsonSerializable()
class Parameter {
  Parameter({
    required this.parameterName,
    this.parameterValue,
    this.parameterUnit,
  });

  final String parameterName;
  final String? parameterValue;
  final String? parameterUnit;

  factory Parameter.fromJson(Map<String, dynamic> json) => _$ParameterFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Result {
  Result({
    required this.resourceId,
    required this.fields,
  });

  final String resourceId;
  final List<Field> fields;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@JsonSerializable()
class Field {
  Field({
    required this.id,
    required this.type,
  });

  final String id;
  final String type;

  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);
}
