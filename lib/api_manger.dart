import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/news_data_response_model.dart';
import 'package:newsapp/models/sources_response_model.dart';
import 'package:newsapp/utils/constants.dart';

class ApiManager {
  static Future<SourcesResponseModel> getSources(String id) async {
    final Uri url = Uri.https(
      constants.baseUrl,
      '/v2/top-headlines/sources',
      {
        'apiKey': constants.apiKey,
        'category': id,
      },
    );

    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return SourcesResponseModel.fromJson(json);
    } else {
      throw Exception('Failed to load sources');
    }
  }
    static Future<NewsDataResponsoneModel> getNewsData(
      {String? sourceId, String? quary, int? pageSize, int? page}) async {
    Uri url = Uri.https(constants.baseUrl, "/v2/everything", {
      "sources": sourceId,
      "q": quary,
      "pageSize": pageSize.toString(),
      "page": page.toString()
    });
    var resposne = await http
        .get(url, headers: {"x-api-key": "c6f6fed5d4e34dcabfd0ee601768981d"});

    var json = jsonDecode(resposne.body);
    return NewsDataResponsoneModel.fromJson(json);
  }
}
