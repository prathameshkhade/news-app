import 'package:news/core/errors/failure.dart';
import 'package:news/features/show_news/data/model/news.dart';
import 'package:fpdart/fpdart.dart';

abstract class NewsRemoteDataSource {
  Future<Either<Failure, List<NewsModel>>> getAllNews();
}