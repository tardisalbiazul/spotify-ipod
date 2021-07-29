import 'package:dio/dio.dart';
import '../../services/services.dart';
import '../../models/models.dart';
import '../../global/global.dart';

class AlbumRequestService {
  AlbumRequestService(this._dio, this._sharedPreferencesService);
  final Dio _dio;
  final SharedPreferencesService _sharedPreferencesService;

  String createParams({required int limit, String? market, int? offset}) {
    String _market = market != null ? '&market=$market' : '';
    String _offset = offset != null ? '&offset=$offset' : '';
    return '?limit=$limit$_market$_offset';
  }

  Future<AlbumRequest> getAlbumRequest(
      {required int limit, String? market, int? offset}) async {
    try {
      String endPoint =
          '$domain/me/albums${createParams(limit: limit, market: market, offset: offset)}';

      String? _spotifyToken = _sharedPreferencesService.getSpotifyToken();

      if (_spotifyToken == null) {
        return AlbumRequestError(errorMessage: 'No access token');
      }

      Response response = await _dio.get(
        endPoint,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      return AlbumRequestSuccess.fromMap(response.data);
    } on DioError catch (e) {
      print(e);
      print(e.response?.statusCode);
      return AlbumRequestError(errorMessage: e.message);
    }
  }
}
