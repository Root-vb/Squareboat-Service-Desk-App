import 'package:get_storage/get_storage.dart';
import 'package:starter/app/data/models/dto/user.dart';
import 'package:starter/app/data/models/response/app_config_response.dart';

class Storage {
  Storage._privateConstructor();

  static final _box = GetStorage();

  static AppConfig getAppConfig() =>
      AppConfig.fromJson(_box.read(StorageKeys.APP_CONFIG));

  static void setAppConfig(AppConfig appConfig) =>
      _box.write(StorageKeys.APP_CONFIG, appConfig.toJson());

  static User getUser() => User.fromJson(_box.read(StorageKeys.USER));

  static void setUser(User? user) =>
      _box.write(StorageKeys.USER, user?.toJson());

  static bool isUserExists() => _box.read(StorageKeys.USER) != null;

  static String getToken() => _box.read(StorageKeys.TOKEN);
  static void setToken(String token) => _box.write(StorageKeys.TOKEN, token);
}

class StorageKeys {
  StorageKeys._privateConstructor();

  static const APP_CONFIG = 'app_config';
  static const USER = 'user';
  static const TOKEN = 'token';
}
