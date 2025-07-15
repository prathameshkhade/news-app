import 'package:amazon/features/show_news/data/datasource/remote_news_api.dart';
import 'package:amazon/features/show_news/data/repository/news_repository_impl.dart';
import 'package:amazon/features/show_news/domain/usecase/get_all_news.dart';
import 'package:amazon/features/show_news/presentation/bloc/home_bloc.dart';
import 'package:amazon/features/show_news/presentation/screens/home_screen.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc(
          GetAllNewsUseCase(
            newsRepository: NewsRepositoryImpl(
              newsRemoteDataSource: NewsApiRemoteDataSourceImpl(httpClient: http.Client())
            )
          )
        ))
      ],
      child: const NewsApp(),
    )
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return MaterialApp(
            title: 'News App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'JetBrainsMonoNerd',
              useMaterial3: true,
              colorScheme: darkDynamic ?? ColorScheme.fromSeed(
                seedColor: CupertinoColors.systemBlue,
                brightness: Brightness.light,
              ),
            ),
            darkTheme: ThemeData(
              fontFamily: 'JetBrainsMonoNerd',
              useMaterial3: true,
              colorScheme: darkDynamic ?? ColorScheme.fromSeed(
                seedColor: CupertinoColors.systemBlue,
                brightness: Brightness.dark,
              ),
            ),
            themeMode: ThemeMode.system,
            home: const HomeScreen(),
        );
      },
    );
  }
}
