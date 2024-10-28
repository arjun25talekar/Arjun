import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/constant.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.receiveTimeout = const Duration(seconds: 30);
    // ..options.headers = {'Authorization': '$token'};

    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
          requestBody: true,
          responseBody: true,
          error: true,
          requestHeader: true));
    }
  }

  Future<Response> get(String endpoint) async {
    try {
      return await _dio.get(endpoint);
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "connectionTimeout";
      case DioExceptionType.sendTimeout:
        return "sendTimeout";
      case DioExceptionType.receiveTimeout:
        return "Time Out";
      case DioExceptionType.badResponse:
        final statusCode = error.response!.statusCode;

        if (statusCode != null) {
          switch (statusCode) {
            case 300:
              return "Error";
            case 400:
              return "Bad Request";
            case 401:
              return "Time Out";
            case 500:
              return "Internal Server Error";
            case 404:
              return "API Not Found";
          }
        }
        break;
      case DioExceptionType.cancel:
        return "Cancelled by user";
      case DioExceptionType.unknown:
        return "No Internet Connection";
      case DioExceptionType.badCertificate:
        return "Bad Certificate";
      case DioExceptionType.connectionError:
        return "Connection Error";
      default:
        return "unknown error";
    }
    return "unknown error";
  }
}

final dioProvider = Provider((ref) => DioClient());
