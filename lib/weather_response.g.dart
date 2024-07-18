// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'WeatherResponse',
      json,
      ($checkedConvert) {
        final val = WeatherResponse(
          success: $checkedConvert('success', (v) => v as String),
          result: $checkedConvert(
              'result', (v) => Result.fromJson(v as Map<String, dynamic>)),
          records: $checkedConvert(
              'records', (v) => Records.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Records _$RecordsFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Records',
      json,
      ($checkedConvert) {
        final val = Records(
          datasetDescription:
              $checkedConvert('datasetDescription', (v) => v as String),
          location: $checkedConvert(
              'location',
              (v) => (v as List<dynamic>)
                  .map((e) => Location.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Location _$LocationFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Location',
      json,
      ($checkedConvert) {
        final val = Location(
          locationName: $checkedConvert('locationName', (v) => v as String),
          weatherElement: $checkedConvert(
              'weatherElement',
              (v) => (v as List<dynamic>)
                  .map(
                      (e) => WeatherElement.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

WeatherElement _$WeatherElementFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'WeatherElement',
      json,
      ($checkedConvert) {
        final val = WeatherElement(
          elementName: $checkedConvert('elementName', (v) => v as String),
          time: $checkedConvert(
              'time',
              (v) => (v as List<dynamic>)
                  .map((e) => Time.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Time _$TimeFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Time',
      json,
      ($checkedConvert) {
        final val = Time(
          startTime:
              $checkedConvert('startTime', (v) => DateTime.parse(v as String)),
          endTime:
              $checkedConvert('endTime', (v) => DateTime.parse(v as String)),
          parameter: $checkedConvert('parameter',
              (v) => Parameter.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Parameter _$ParameterFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Parameter',
      json,
      ($checkedConvert) {
        final val = Parameter(
          parameterName: $checkedConvert('parameterName', (v) => v as String),
          parameterValue:
              $checkedConvert('parameterValue', (v) => v as String?),
          parameterUnit: $checkedConvert('parameterUnit', (v) => v as String?),
        );
        return val;
      },
    );

Result _$ResultFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Result',
      json,
      ($checkedConvert) {
        final val = Result(
          resourceId: $checkedConvert('resource_id', (v) => v as String),
          fields: $checkedConvert(
              'fields',
              (v) => (v as List<dynamic>)
                  .map((e) => Field.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'resourceId': 'resource_id'},
    );

Field _$FieldFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Field',
      json,
      ($checkedConvert) {
        final val = Field(
          id: $checkedConvert('id', (v) => v as String),
          type: $checkedConvert('type', (v) => v as String),
        );
        return val;
      },
    );
