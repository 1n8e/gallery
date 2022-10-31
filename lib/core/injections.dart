import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_project/bloc/asset_cubit/asset_cubit.dart';
import 'package:test_project/model/asset_model.dart';
import 'package:test_project/repository/assets_repository.dart';
import 'package:test_project/data/base_url.dart';
import 'package:test_project/data/data_source.dart';

final getIt = GetIt.instance;

void setupInjections() {
  getIt.registerFactory(
    () => Dio(
      BaseOptions(
        baseUrl: BASE_URL,

      ),
    ),
  );

  getIt.registerLazySingleton(() => BASE_URL);

  getIt.registerFactory(
    () => AssetModel(
      username: getIt(),
      description: getIt(),
      title: getIt(),
      thumb: getIt(),
      full: getIt(),
    ),
  );

  getIt.registerFactory(() => DataSource(getIt(), getIt()));

  getIt.registerFactory(() => AssetsRepository(getIt(), getIt()));

  getIt.registerLazySingleton(() => AssetCubit(getIt()));

}
