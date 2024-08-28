import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:newsapp/models/news_data_response_model.dart';
import 'package:newsapp/models/sources_response_model.dart';
import 'package:newsapp/utils/constants.dart';
class ApiManager
{
  //https://newsapi.org/v2/top-headlines/sources?apiKey=
static Future<SourcesResponseModel>getSources()async
{
  Uri url=Uri.https(constants.baseUrl,'/v2/top-headlines/sources',{'apiKey':constants.apiKey});
 
http.Response response=await http.get(url);

  var json=jsonDecode(response.body);
  SourcesResponseModel model=SourcesResponseModel.fromJson(json);

  return model;
}

static Future<NewsDataResponsoneModel> getNewsData(String sourceID)async
{
  Uri url=Uri.https(
    'newsapi.org',
    "/v2/everything",
    {
      'sources':sourceID,
      'apiKey':constants.apiKey,
      
    },
    

    );
   http.Response response=await http.get(url);

  var json=jsonDecode(response.body);
  NewsDataResponsoneModel model=NewsDataResponsoneModel.fromJson(json);
  return model;
}

}