import 'package:get_storage/get_storage.dart';

class ALocalStorage {
  // Singleton instance
  static final ALocalStorage _instance = ALocalStorage._internal();

  // Singleton factory constructor
  factory ALocalStorage() {
    return _instance;
  }

  // Private constructor
  ALocalStorage._internal() {
    _initStorage();
  }

  // Storage instance
  final GetStorage _storage = GetStorage();

  // Initialize storage
  Future<void> _initStorage() async {
    await GetStorage.init();
  }

  /// Save any type of data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  /// Read data of specific type
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  /// Read data with default value if null
  T readDataOrDefault<T>(String key, T defaultValue) {
    return _storage.read<T>(key) ?? defaultValue;
  }

  /// Check if key exists
  bool hasData(String key) {
    return _storage.hasData(key);
  }

  /// Remove data for specific key
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  /// Clear all data
  Future<void> clearAll() async {
    await _storage.erase();
  }

  /// Save a list
  Future<void> saveList<T>(String key, List<T> items) async {
    await _storage.write(key, items);
  }

  /// Read a list
  List<T>? readList<T>(String key) {
    return _storage.read<List<T>>(key);
  }

  /// Save a map
  Future<void> saveMap<K, V>(String key, Map<K, V> map) async {
    await _storage.write(key, map);
  }

  /// Read a map
  Map<K, V>? readMap<K, V>(String key) {
    return _storage.read<Map<K, V>>(key);
  }

  /// Listen to value changes for a key
  void listenKey(String key, Function(dynamic) callback) {
    _storage.listenKey(key, callback);
  }

  /// Remove listener for a key
  void removeKeyListener(String key) {
    // GetStorage doesn't provide direct listener removal
    // This is a workaround - listeners are automatically removed when widget disposes
    // Alternatively, you can store the listener and call it with null to "remove"
    _storage.listenKey(key, (value) {});
  }

  /// Get all stored keys
  List<String> getAllKeys() {
    return _storage.getKeys().toList();
  }

  /// Get storage size (approximate)
  /// Note: GetStorage doesn't provide actual size, this is an estimate
  int getStorageSize() {
    final keys = _storage.getKeys();
    int size = 0;
    for (final key in keys) {
      final value = _storage.read(key);
      if (value is String) {
        size += value.length;
      } else if (value != null) size += value.toString().length;
    }
    return size;
  }
}