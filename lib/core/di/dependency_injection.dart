import 'package:dio/dio.dart';
import 'package:doctor_system/core/networking/api_service.dart';
import 'package:doctor_system/core/networking/dio_factory.dart';
import 'package:doctor_system/features/login/data/repos/login_repo.dart';
import 'package:doctor_system/features/login/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //Dio & ApiSercvice
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //LoginRepo
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
}
