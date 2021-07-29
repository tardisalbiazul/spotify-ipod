import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService(this.prefs);
  final SharedPreferences prefs;

  String? getSpotifyToken() => prefs.getString("spotifyToken");

  Future<String?> registerSpotifyToken({
    required String spotifyToken,
  }) async {
    try {
      prefs.setString("spotifyToken", spotifyToken);

      String? registeredSpotifyToken = prefs.getString("spotifyToken");

      return registeredSpotifyToken;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
