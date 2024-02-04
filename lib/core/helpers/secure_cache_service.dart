import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureCacheService {
  static late FlutterSecureStorage secureStorage;

  static init() async {
    secureStorage = const FlutterSecureStorage();
  }

  static dynamic getData({
    required String key,
  }) {
    return secureStorage.read(key:key);
  }

  static Future saveData({
    required String key,
    required dynamic value,
  }) async {
    await secureStorage.write(key: key, value: value);
  }

  static Future removeField({
    required String key,
  }) async {
    return await secureStorage.delete(key: key);
  }

  static Future clearCache() async {
    return await secureStorage.deleteAll();
  }
}
