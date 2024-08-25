import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:newsapp/models/sources_response_model.dart';
class ApiManager
{
  //https://newsapi.org/v2/top-headlines/sources?apiKey=
static Future<SourcesResponseModel>getSources()async
{
  Uri url=Uri.http(
    'newsapi.org/v2/', 'top-headlines/sources',
    {'apiKey':'d0ba5dd3999349b996e9964fbf6225d7'}
  );
http.Response response=await http.get(url);

  var json=jsonDecode(response.body);
  SourcesResponseModel model=SourcesResponseModel.fromJson(json);

  return model;
}


}