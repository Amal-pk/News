import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/core/core.dart';
import 'package:news/error/error.dart';
import 'package:news/model/model.dart';

class NewsService {
  NewsService._instans();
  static NewsService instance = NewsService._instans();
  factory NewsService() {
    return instance;
  }
  ErrorCode errorCode = ErrorCode();
  Future<NewsRespo?> news() async {
    try {
      Response response = await Dio().get(
          "https://newsapi.org/v2/everything?q=apple&from=2022-12-27&to=2022-12-27&sortBy=popularity&apiKey=" +
              apiKey);
      // "https://newsapi.org/v2/everything?q=tesla&from=2022-11-22&sortBy=publishedAt&apiKey=4af47f865fff479a96d3984118899fd2");
      if (response.statusCode == 200) {
        // print(response.data);
        const SnackBar(
          content: Text("Login successfully"),
          backgroundColor: Color.fromARGB(255, 97, 98, 97),
        );
        return NewsRespo.fromJson(response.data);
      }
    } on DioError catch (e) {
      return errorCode.status401(e);
    } catch (e) {
      const SnackBar(
        content: Text('Error Founded'),
        backgroundColor: Color.fromARGB(255, 47, 48, 47),
      );
    }
    return null;
  }
}
