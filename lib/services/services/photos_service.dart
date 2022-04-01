import 'package:dio/dio.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:knowunity_todo_list/model/TodoItem.dart';
import '../api_helper/api_config.dart';
import '../api_helper/api_response.dart';
import '../api_helper/dio_config.dart';
import '../hooks/useApiConfig.dart';
import '../hooks/useDioRequest.dart';
import 'package:flutter/material.dart';

ApiResponse<List<TodoItem>> usePhotoList(UniqueKey uniqueKey) {
  ApiConfig apiConfig = useApiConfig();
  DioConfig dioConfig = useMemoized(() {
    if (uniqueKey == null) return null;
    return DioConfig<List<TodoItem>>(
        path: apiConfig.BASE_URl,
        transformResponse: (Response response) {
          return todoList(response.data);
        });
  }, [uniqueKey]);
  ApiResponse<List<TodoItem>> apiResponse = useDioRequest(dioConfig);
  return apiResponse;
}
