import 'dart:convert';

import 'package:news/core/errors/app_secrets.dart';
import 'package:news/core/errors/failure.dart';
import 'package:news/features/show_news/data/datasource/remote_data_source.dart';
import 'package:news/features/show_news/data/model/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

class NewsApiRemoteDataSourceImpl extends NewsRemoteDataSource {
  final http.Client httpClient;

  NewsApiRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<Either<Failure, List<NewsModel>>> getAllNews() async {

    final uri = Uri.parse(AppSecrets.apiUrl);
    final response = await httpClient.get(uri);

    if (response.statusCode != 200) {
      return Either.left(
        Failure(
          message: response.body,
          statusCode: response.statusCode,
        )
      );
    }

    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    debugPrint(jsonResponse.toString());
    final List<dynamic> articles = jsonResponse['articles'];
    final List<NewsModel> news = articles
        .map((article) => NewsModel.fromJson(article))
        .toList();
    debugPrint('Response(${response.statusCode}): ${jsonResponse.toString()}');
    return right(news);
  }
}