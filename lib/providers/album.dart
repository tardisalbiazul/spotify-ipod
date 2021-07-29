import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/controllers.dart';
import '../models/models.dart';
import '/providers/providers.dart';
import '../services/services.dart';

// Provider of Spotify Albums Request
final spotifyAlbumServiceProvider = Provider<AlbumRequestService>(
  (ref) => AlbumRequestService(
    ref.watch(dioProvider),
    ref.watch(sharedPreferencesServiceProvider),
  ),
);

// StateNotifier Provider of Current Offset
final currentOffsetProvider =
    StateNotifierProvider<CurrentOffsetController, int>(
  (ref) => CurrentOffsetController(),
);

// Future Provider of Spotify Albums
final albumRequestFutureProvider = FutureProvider<AlbumRequest>(
  (ref) async {
    int currentOffset = ref.watch(currentOffsetProvider);
    return await ref
        .watch(spotifyAlbumServiceProvider)
        .getAlbumRequest(limit: 10, offset: currentOffset, market: 'US');
  },
);
