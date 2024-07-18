// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weatherHash() => r'1eb86721600d986a2c2dc9c2e64b646e506d0e99';

/// See also [weather].
@ProviderFor(weather)
final weatherProvider = AutoDisposeFutureProvider<WeatherResponse>.internal(
  weather,
  name: r'weatherProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$weatherHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WeatherRef = AutoDisposeFutureProviderRef<WeatherResponse>;
String _$dioHash() => r'dc5badc07112b06e98d4eb2729142fca71de5b14';

/// See also [dio].
@ProviderFor(dio)
final dioProvider = AutoDisposeProvider<Dio>.internal(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DioRef = AutoDisposeProviderRef<Dio>;
String _$locationHash() => r'af5e32b962e307f3b23c45add134dec1e76045ce';

/// See also [Location].
@ProviderFor(Location)
final locationProvider = AutoDisposeNotifierProvider<Location, String>.internal(
  Location.new,
  name: r'locationProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$locationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Location = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
