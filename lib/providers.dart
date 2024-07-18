import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'weather_response.dart';

part 'providers.g.dart';

@riverpod
Future<WeatherResponse> weather(WeatherRef ref) async {
  final location = ref.watch(locationProvider);

  if (!validLocations.contains(location)) {
    throw 'Invalid location: $location';
  }

  final dio = ref.read(dioProvider);
  final response = await dio.get<Map<String, dynamic>>(
    '/v1/rest/datastore/F-C0032-001',
    queryParameters: {
      'locationName': location,
    },
  );

  return WeatherResponse.fromJson(response.data!);
}

@riverpod
class Location extends _$Location {
  @override
  String build() => validLocations.first;

  void setLocation(String location) => state = location;
}

@riverpod
Dio dio(DioRef ref) {
  const key = String.fromEnvironment('WEATHER_KEY');
  if (key.isEmpty) {
    throw 'API key is not set, please run "flutter run --dart-define WEATHER_KEY={YOUR_API_KEY}"';
  }
  return Dio(BaseOptions(
    baseUrl: 'https://opendata.cwa.gov.tw/api',
    queryParameters: { 'Authorization': key },
  ));
}

const validLocations = [
  "宜蘭縣",
  "花蓮縣",
  "臺東縣",
  "澎湖縣",
  "金門縣",
  "連江縣",
  "臺北市",
  "新北市",
  "桃園市",
  "臺中市",
  "臺南市",
  "高雄市",
  "基隆市",
  "新竹縣",
  "新竹市",
  "苗栗縣",
  "彰化縣",
  "南投縣",
  "雲林縣",
  "嘉義縣",
  "嘉義市",
  "屏東縣",
];