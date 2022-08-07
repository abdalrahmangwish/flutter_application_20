import 'package:flutter_application_20/modules/home_screen/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';

import 'modules/searsh_screen/cubit/searsh_cubit.dart';

final sl = GetIt.instance;
void init() {
  sl.registerLazySingleton(() => HomeCubit());
  sl.registerLazySingleton(() => SearshCubit());
}
// SearshCubit