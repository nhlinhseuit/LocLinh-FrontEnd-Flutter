import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

initializeDependencies() async {
  final dio = Dio();
  locator.registerSingleton<Dio>(dio);
}