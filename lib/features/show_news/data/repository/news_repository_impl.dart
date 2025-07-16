import 'package:news/core/errors/failure.dart';
import 'package:news/features/show_news/data/datasource/remote_data_source.dart';
import 'package:news/features/show_news/domain/entity/news_entity.dart';
import 'package:news/features/show_news/domain/repository/news_repository.dart';
import 'package:fpdart/fpdart.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource newsRemoteDataSource;

  NewsRepositoryImpl({required this.newsRemoteDataSource});

  @override
  Future<Either<Failure, List<NewsEntity>>> getAllNews() {
    return newsRemoteDataSource.getAllNews();
  }
}