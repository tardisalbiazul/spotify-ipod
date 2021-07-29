import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/services.dart';

// Instance of Shared Preferences Service (will be overriden on startup)
final sharedPreferencesServiceProvider =
    Provider<SharedPreferencesService>((ref) => throw UnimplementedError());
