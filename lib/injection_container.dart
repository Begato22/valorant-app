import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:valorant_app/cubits/agent_cubit/agent_cubit.dart';
import 'package:valorant_app/data/repo/agents_repo.dart';

import 'core/api/api_consumer.dart';
import 'core/api/app_interceptors.dart';
import 'core/api/dio_consumer.dart';
import 'core/network/network_info.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // ******************* External *******************

  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );
  sl.registerLazySingleton(() => InternetConnectionChecker());

  // ******************* Core *******************

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(internetConnectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //********************************************************** */

  sl.registerLazySingleton<AgentsRepository>(() => AgentsRepositoryImpl(apiConsumer: sl()));
  sl.registerFactory(() => AgentCubit(agentsRepository: sl()));
}
