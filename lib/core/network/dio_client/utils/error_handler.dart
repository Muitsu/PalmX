import 'package:dio/dio.dart';
import 'dart:developer' as dev;

class ErrorHandler {
  static String getErrorMessage(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return "Connection timed out. Please check your internet.";
        case DioExceptionType.sendTimeout:
          return "Request took too long to send.";
        case DioExceptionType.receiveTimeout:
          return "Server took too long to respond.";
        case DioExceptionType.badResponse:
          return _parseServerError(error);
        case DioExceptionType.cancel:
          return "Request was cancelled.";
        case DioExceptionType.connectionError:
          return "Network error. Please check your connection.";
        default:
          return "Unexpected error occurred.";
      }
    } else {
      dev.log(name: "ErrorHandler", error.toString());
      return "Something went wrong. Please try again.";
    }
  }

  static String _parseServerError(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    try {
      if (data is String && data.isNotEmpty) {
        return data;
      }

      if (data is Map) {
        if (data.containsKey('message')) {
          return _toMessage(data['message']);
        }

        if (data.containsKey('error')) {
          return _toMessage(data['error']);
        }

        if (data.containsKey('errors')) {
          return _extractErrors(data['errors']);
        }

        if (data.containsKey('title')) {
          return _toMessage(data['title']);
        }

        if (data.containsKey('detail')) {
          return _toMessage(data['detail']);
        }
      }

      if (data is List && data.isNotEmpty) {
        return _toMessage(data.first);
      }
    } catch (_) {
      // fall through to generic message
    }

    if (statusCode == 422) {
      return "Validation failed. Please check your input and try again.";
    }

    if (statusCode != null && statusCode >= 500) {
      return "A server error occurred. Please try again later.";
    }

    return "Server responded with an error.";
  }

  static String _extractErrors(dynamic errors) {
    if (errors is String && errors.isNotEmpty) {
      return errors;
    }

    if (errors is List && errors.isNotEmpty) {
      return errors.map(_toMessage).where((m) => m.isNotEmpty).join('\n');
    }

    if (errors is Map) {
      final messages = errors.values
          .map(_toMessage)
          .where((m) => m.isNotEmpty)
          .toList();
      if (messages.isNotEmpty) {
        return messages.join('\n');
      }
    }

    return "Server responded with an error.";
  }

  static String _toMessage(dynamic value) {
    if (value == null) return '';
    if (value is String) return value;
    if (value is List && value.isNotEmpty) {
      return value
          .map((item) => _toMessage(item))
          .where((m) => m.isNotEmpty)
          .join('\n');
    }
    if (value is Map && value.containsKey('message')) {
      return _toMessage(value['message']);
    }
    return value.toString();
  }
}
