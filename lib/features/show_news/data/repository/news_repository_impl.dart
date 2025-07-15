import 'package:amazon/core/errors/failure.dart';
import 'package:amazon/features/show_news/data/datasource/remote_data_source.dart';
import 'package:amazon/features/show_news/domain/entity/NewsEntity.dart';
import 'package:amazon/features/show_news/domain/repository/news_repository.dart';
import 'package:fpdart/fpdart.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource newsRemoteDataSource;

  NewsRepositoryImpl({required this.newsRemoteDataSource});

  @override
  Future<Either<Failure, List<NewsEntity>>> getAllNews() {
    return newsRemoteDataSource.getAllNews();
  }
}