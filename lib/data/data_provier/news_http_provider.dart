import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:uit_news/data/repository/news_repository.dart';
import 'package:uit_news/utils/locator.dart';

class PostHTTPAPI implements PostHttpRepository {
  Dio dio = locator<Dio>();
  String baseUrl = 'https://loclinh-server.onrender.com/api/v1/news';
  
  @override
  Future<List> readData() async {
    try {
      final response = (await dio.get(baseUrl));
      if ((response.statusCode ?? 0) >= 200) {
        final list = response.data as List;
        return list;
      } else {
        debugPrint(response.statusCode.toString());
        throw Exception('Failed to load data');
      }
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    }catch (_) {
      debugPrint(_.toString());
      throw Exception('Failed to load data');
    }
  }
}