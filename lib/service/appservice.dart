
import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapi/model/article.dart';

class AppService{
    final endpoint = 'https://newsapi.org/v2/everything?q=tesla&from=2023-04-05&sortBy=publishedAt&apiKey=9b271667fb7e4574bc41ddeca6650001';
    Future<List<Article>> getArticle() async{
      Response response = await get(Uri.parse(endpoint));
      if(response.statusCode == 200){
          Map<String, dynamic> json = jsonDecode(response.body);
          List<dynamic> body = json['articles'];
          List<Article> article = body.map((dynamic item) => Article.fromJson(item)).toList();
          return article;
      } else {
        throw "data not fetch";
      }
  }
}