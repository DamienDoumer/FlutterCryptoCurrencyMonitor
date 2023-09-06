
import 'package:get_it/get_it.dart';

import 'infrastructure_services/coin_geko_api_client.dart';
import 'infrastructure_services/shared/base_coin_geko_api_client.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerFactory<BaseCoinGekoAPIClient>(() => CoinGekoAPIClient());
}