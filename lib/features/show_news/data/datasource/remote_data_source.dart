import 'package:amazon/core/errors/failure.dart';
import 'package:amazon/features/show_news/data/model/news.dart';
import 'package:fpdart/fpdart.dart';

abstract class NewsRemoteDataSource {
  Future<Either<Failure, List<NewsModel>>> getAllNews();
}