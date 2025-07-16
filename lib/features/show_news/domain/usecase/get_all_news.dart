import 'package:news/core/errors/failure.dart';
import 'package:news/core/usecase/usecase.dart';
import 'package:news/features/show_news/domain/entity/news_entity.dart';
import 'package:news/features/show_news/domain/repository/news_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllNewsUseCase implements UseCase<List<NewsEntity>, void> {
  final NewsRepository newsRepository;

  GetAllNewsUseCase({required this.newsRepository});

  @override
  Future<Either<Failure, List<NewsEntity>>> call(void params) async {
    return await newsRepository.getAllNews();
  }
}