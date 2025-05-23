import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/news_service/news_service.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final serviceProvider = Provider<NewsService>((ref) {
  final dio = ref.read(dioProvider);
  return NewsService(dio: dio);
});
