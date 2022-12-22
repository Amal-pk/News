import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news/model/model.dart';
import 'package:news/service/service.dart';

class HomeController extends ChangeNotifier {
  List<Article> news = [];
  bool isloading = false;

  newsshow() async {
    isloading = true;
    NewsRespo? newsrespo = await NewsService.instance.news();
    // log(newsrespo!.status.toString());
    if (newsrespo != null) {
      news.clear();
      news.addAll(newsrespo.articles!);
    }
    isloading = false;
    notifyListeners();
  }
}
