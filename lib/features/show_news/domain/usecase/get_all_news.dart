import 'package:amazon/core/errors/failure.dart';
import 'package:amazon/features/show_news/domain/entity/NewsEntity.dart';
import 'package:amazon/features/show_news/domain/repository/news_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllNewsUseCase {
  final NewsRepository newsRepository;

  GetAllNewsUseCase({required this.newsRepository});

  Future<Either<Failure, List<NewsEntity>>> call() {
    return newsRepository.getAllNews();
  }
}