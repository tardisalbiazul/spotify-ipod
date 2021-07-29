import 'package:spotify_ipod/services/services.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import '../../global/global.dart';

class SpotifyConnectService {
  SpotifyConnectService(this._sharedPreferencesService);
  SharedPreferencesService _sharedPreferencesService;

  Future<bool> connectToSpotifyAndroid() async {
    try {
      bool x = await SpotifySdk.connectToSpotifyRemote(
          clientId: spotifyAppClientId, redirectUrl: spotifyCallBackUri);
      return x;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<bool> conntectToSpotify() async {
    try {
      String? token = await getSpotifyToken();
      bool x;
      if (token != null) {
        x = await SpotifySdk.connectToSpotifyRemote(
          clientId: spotifyAppClientId,
          redirectUrl: spotifyCallBackUri,
          accessToken: token,
        );
        await _sharedPreferencesService.registerSpotifyToken(
            spotifyToken: token);
      } else {
        x = false;
      }

      return x;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<String?> getSpotifyToken() async {
    try {
      String authenticationToken = await SpotifySdk.getAuthenticationToken(
        clientId: spotifyAppClientId,
        redirectUrl: spotifyCallBackUri,
        scope:
            "user-library-read,app-remote-control,user-modify-playback-state,playlist-read-private,user-read-recently-played,user-read-playback-state,user-top-read,app-remote-control,playlist-modify-public,user-modify-playback-state",
      );
      return authenticationToken;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
