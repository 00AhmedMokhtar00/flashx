part of 'flashx_api.dart';

class ServerRequester{
  static Future<Response> getData({required String url, String? id}) async=>
      id == null? await _getMethod(url) : await _getById(url, id);

  static Future<Response> _getMethod(String url) async =>
      await get(Uri.parse(url));

  static Future<Response> _getById(String url, String id) async =>
      await get(Uri.parse(url + id));
}