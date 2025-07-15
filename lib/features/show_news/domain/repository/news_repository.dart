import 'package:amazon/core/errors/failure.dart';
import 'package:amazon/features/show_news/domain/entity/news_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class NewsRepository {
  Future<Either<Failure, List<NewsEntity>>> getAllNews();
}