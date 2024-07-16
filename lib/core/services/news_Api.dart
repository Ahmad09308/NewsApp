// news_service.dart

import 'package:aa/core/model/NewsModel.dart';
import 'package:dio/dio.dart';
import 'package:aa/core/model/handling_model.dart';

abstract class Service {
  Dio req = Dio();
  late Response response;
}

abstract class NewService extends Service {
  String baseurl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=846777af29de49b5835a7b185634f9fb";

  Future<ResultModel> getAllNews();
  Future<ResultModel> searchInNew(String lexem);
}

class NewServiceImp extends NewService {
  @override
  Future<ResultModel> getAllNews() async {
    try {
      response = await req.get(baseurl);
      if (response.statusCode == 200) {
        List<Newsmodel> newsList = List<Newsmodel>.from(
          response.data['articles']
              .map((article) => Newsmodel.fromMap(article)),
        );
        return Litsof<Newsmodel>(listOfData: newsList);
      } else {
        print('Error: ${response.statusCode} - ${response.statusMessage}');
        return ExceptionModel(message: 'Failed to fetch news');
      }
    } on DioException catch (e) {
      print('Dio Error: $e');
      return ExceptionModel(message: 'Failed to connect to server');
    } catch (e) {
      print('Exception: $e');
      return ExceptionModel(message: 'Exception occurred');
    }
  }

  @override
  Future<ResultModel> searchInNew(String lexem) async {
    try {
      response = await req.get(
          'https://newsapi.org/v2/everything?q=$lexem&apiKey=846777af29de49b5835a7b185634f9fb');
      if (response.statusCode == 200) {
        List<Newsmodel> newsList = List<Newsmodel>.from(
          response.data['articles']
              .map((article) => Newsmodel.fromMap(article)),
        );
        return Litsof<Newsmodel>(listOfData: newsList);
      } else {
        print('Error: ${response.statusCode} - ${response.statusMessage}');
        return ExceptionModel(message: 'Failed to fetch news');
      }
    } on DioException catch (e) {
      print('Dio Error: $e');
      return ExceptionModel(message: 'Failed to connect to server');
    } catch (e) {
      print('Exception: $e');
      return ExceptionModel(message: 'Exception occurred');
    }
  }
}



  // @override
  // Future<ResultModel> searchInNew(String lexem) async {
  //   try {
  //     response = await req.get(
  //         "https://newsapi.org/v2/everything??q=${lexem}&apiKey=dbbcacfbc5034d7c9ed5defad1774e1e");
  //     if (response.statusCode == 200) {
  //       return Litsof<Newsmodel>(
  //           listOfData: List.generate(
  //               response.data.length,
  //               (index) =>
  //                   Newsmodel.fromMap(response.data['articles'][index])));
  //     } else {
  //       return ExceptionModel();
  //     }
  //   } catch (e) {
  //     return ExceptionModel();
  //   }
  // }