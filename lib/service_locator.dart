import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'package:nyano_mobile_flutter/model/db/appdb.dart';
import 'package:nyano_mobile_flutter/model/vault.dart';
import 'package:nyano_mobile_flutter/network/account_service.dart';
import 'package:nyano_mobile_flutter/util/hapticutil.dart';
import 'package:nyano_mobile_flutter/util/biometrics.dart';
import 'package:nyano_mobile_flutter/util/sharedprefsutil.dart';

GetIt sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton<AccountService>(() => AccountService());
  sl.registerLazySingleton<DBHelper>(() => DBHelper());
  sl.registerLazySingleton<HapticUtil>(() => HapticUtil());
  sl.registerLazySingleton<BiometricUtil>(() => BiometricUtil());
  sl.registerLazySingleton<Vault>(() => Vault());
  sl.registerLazySingleton<SharedPrefsUtil>(() => SharedPrefsUtil());
  sl.registerLazySingleton<Logger>(() => Logger(printer: PrettyPrinter()));
}