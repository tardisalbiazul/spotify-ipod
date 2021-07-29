import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/services.dart';
import './providers.dart';

// Provider of Spotify Connect Service
final spotifyConnectServiceProvider = Provider<SpotifyConnectService>(
  (ref) => SpotifyConnectService(ref.watch(sharedPreferencesServiceProvider)),
);
