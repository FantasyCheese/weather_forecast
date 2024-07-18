import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'providers.dart';
import 'weather_response.dart';

void main() => runApp(const ProviderScope(child: App()));

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) => const MaterialApp(
    title: 'Weather Forecast',
    home: WeatherPage(),
  );
}

class WeatherPage extends ConsumerWidget {
  const WeatherPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) => scaffold(
    appBar,
    body(
      searchAnchor(
        searchBar(
          onSubmitted: ref.read(locationProvider.notifier).setLocation,
        ),
        suggestions(
          onTapSuggestion: ref.read(locationProvider.notifier).setLocation,
        ),
      ),
      searchResult(
        ref.watch(weatherProvider),
        loadingIndicator,
        errorBuilder,
        emptyWidget,
        weatherElementItem(
          timeItem,
        ),
      ),
    ),
  );

  Widget scaffold(AppBar appBar, Widget body) => Scaffold(
    appBar: appBar,
    body: body,
  );

  AppBar get appBar => AppBar(
    title: const Text('Weather Forecast'),
  );

  Widget body(Widget searchBar, Widget searchResult) => Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        searchBar,
        const SizedBox(height: 16.0),
        Expanded(child: searchResult),
      ],
    ),
  );

  Widget searchAnchor(
    SearchAnchorChildBuilder builder,
    SuggestionsBuilder suggestionsBuilder,
  ) => SearchAnchor(
    builder: builder,
    suggestionsBuilder: suggestionsBuilder,
  );

  SearchAnchorChildBuilder searchBar({required void Function(String) onSubmitted}) =>
    (BuildContext context, SearchController controller) => SearchBar(
      controller: controller,
      leading: const Icon(Icons.search),
      padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 16.0)),
      onTap: controller.openView,
      onSubmitted: onSubmitted,
    );

  SuggestionsBuilder suggestions({required void Function(String) onTapSuggestion}) => (
    BuildContext context,
    SearchController controller,
  ) => validLocations
    .where((e) => e.startsWith(controller.text))
    .map((e) => Builder(
      builder: (context) => ListTile(
        title: Text(e),
        onTap: () {
          onTapSuggestion(e);
          controller.closeView(e);
          FocusScope.of(context).unfocus();
        },
      ),
    ));

  Widget searchResult(
    AsyncValue<WeatherResponse> weather,
    Widget loadingIndicator,
    ErrorBuilder errorBuilder,
    Widget emptyWidget,
    WeatherElementBuilder weatherElementBuilder,
  ) => Center(
    child: weather.when(
      loading: () => loadingIndicator,
      error: errorBuilder,
      data: (data) => data.records.location.isEmpty
        ? emptyWidget
        : ListView(
          children: data.records.location[0].weatherElement.map(weatherElementBuilder).toList(),
        ),
    ),
  );

  Widget errorBuilder(error, __) => Text(
    error.toString(),
    style: const TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.bold,
      fontSize: 16.0,
    ),
  );

  Widget get loadingIndicator => const CircularProgressIndicator();

  Widget get emptyWidget => const Text('NO DATA');

  WeatherElementBuilder weatherElementItem(TimeBuilder timeBuilder) =>
    (weather) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(elementDisplayName[weather.elementName] ?? weather.elementName),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: weather.time.map(timeBuilder).map((e) => Expanded(child: e)).toList(),
          ),
        ],
      ),
    );

  Widget timeItem(Time time) => Text(
    'from: ${fmt(time.startTime)}\n'
    'to: ${fmt(time.endTime)}\n'
    'name: ${time.parameter.parameterName}\n'
    'value: ${time.parameter.parameterValue}\n'
    'unit: ${time.parameter.parameterUnit}'
  );

  String fmt(DateTime time) => DateFormat('M/d HH:mm').format(time);

  static const elementDisplayName = <String, String>{
    'Wx': '天氣狀況',
    'PoP': '降雨機率',
    'CI': '舒適度',
    'MinT': '最低溫度',
    'MaxT': '最高溫度',
  };
}

typedef ErrorBuilder = Widget Function(Object error, StackTrace? stackTrace);
typedef TimeBuilder = Widget Function(Time time);
typedef WeatherElementBuilder = Widget Function(WeatherElement element);
