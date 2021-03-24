import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirestoreCacheManager<T> {
  static final _instance = FirestoreCacheManager._internal();

  static FirestoreCacheManager get instance => _instance;

  FirestoreCacheManager._internal();

  final Map<T, Duration> _cacheDurations = {};

  void setCacheTime(T ref, Duration duration) {
    if (_cacheDurations.containsKey(ref)) {
      _cacheDurations[ref] = duration;
    } else {
      _cacheDurations.putIfAbsent(ref, () => duration);
    }
  }

  void removeCacheTime(T ref, Duration duration) {
    _cacheDurations.remove(ref);
  }

  Duration? getCacheTimeFor(T ref) {
    if (_cacheDurations.containsKey(ref)) {
      return _cacheDurations[ref];
    }
  }

  Future<GetOptions> _firestoreGetOptionsFor(T ref, {bool forceServer = false}) async {
    final prefs = await SharedPreferences.getInstance();
    if (forceServer) {
      await prefs.setString('$ref', DateTime.now().toIso8601String());
      log('[SERVER] $ref retrieved from server set cacheDuration start at ${prefs.getString('$ref')}');
      return const GetOptions(source: Source.server);
    }
    final lastUpdateString = prefs.getString('$ref');
    if (lastUpdateString != null && _cacheDurations.containsKey(ref) && _inCacheTime(ref, DateTime.parse(lastUpdateString))) {
      log('[CACHE] $ref retrieved from cache.');
      return const GetOptions(source: Source.cache);
    }
    await prefs.setString('$ref', DateTime.now().toIso8601String());
    log('[SERVER AND CACHE] $ref retrieved from serverAndCache cache expired set new start at ${prefs.getString('$ref')}');
    return const GetOptions(source: Source.serverAndCache);
  }

  Future<QuerySnapshot> getDocs(T ref, {required Query query, bool forceServer = false}) async {
    final getOption = await _firestoreGetOptionsFor(ref, forceServer: forceServer);
    final result = await query.get(getOption);
    if (getOption.source == Source.cache && result.docs.isEmpty) {
      log('[SERVER AND CACHE] no cache data');
      return query.get(const GetOptions(source: Source.serverAndCache));
    }
    return result;
  }

  Future<DocumentSnapshot> getDoc(T ref, {required DocumentReference docRef, bool forceServer = false}) async {
    final getOption = await _firestoreGetOptionsFor(ref, forceServer: forceServer);
    final result = await docRef.get(getOption);
    if (getOption.source == Source.cache && (result.data()?.isEmpty ?? true)) {
      log('[SERVER AND CACHE] no cache data');
      return docRef.get(const GetOptions(source: Source.serverAndCache));
    }
    return result;
  }

  bool _inCacheTime(T ref, DateTime lastUpdate) {
    final cacheDuration = getCacheTimeFor(ref);
    return cacheDuration != null && lastUpdate.add(cacheDuration).isAfter(DateTime.now());
  }
}
