import 'package:clean_architecture_flutter/core/network/api_client.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance; // sl = service locator

void setup() {
  sl.registerSingleton<ApiClient>(ApiClient());
}
