import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;
import 'package:newsapp/bloc/states.dart';
import 'package:newsapp/models/news_data_response_model.dart';
import 'package:newsapp/models/sources_response_model.dart';
import 'package:newsapp/utils/constants.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  SourcesResponseModel? model;
  NewsDataResponsoneModel? newsdata;
  int Selected = 0;
  static HomeCubit get(context) => BlocProvider.of(context);

  changeSource(int value) {
    Selected = value;
    emit(HomeChangeSource());
  }

  Future<void> getSources(String id) async {
    try {
      emit(HomeGetSourcesLoading());
      Uri url = Uri.https(
        constants.baseUrl,
        '/v2/top-headlines/sources',
        {'apiKey': constants.apiKey, 'category': id},
      );

      http.Response response = await http.get(url);
      var json = jsonDecode(response.body);
      model = SourcesResponseModel.fromJson(json);

      emit(HomeGetSourcesSucess());
      getNewsData(model?.sources?[Selected].id ?? "");
    } catch (e) {
      emit(HomeGetSourcesError());
    }
  }

  Future<void> getNewsData(String sourceID, {String? query}) async {
    try {
      emit(HomeGetNewsDataLoading());
      Uri url = Uri.https(
        constants.baseUrl,
        '/v2/everything',
        {'sources': sourceID, 'q': query, 'apiKey': constants.apiKey},
      );

      http.Response response = await http.get(url);
      var json = jsonDecode(response.body);
      newsdata = NewsDataResponsoneModel.fromJson(json);

      emit(HomeGetNewsDatasSucess());
    } catch (e) {
      emit(HomeGetNewsDataError());
    }
  }
}
