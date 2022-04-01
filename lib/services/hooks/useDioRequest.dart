import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../api_helper/api_response.dart';
import '../api_helper/dio_config.dart';

ApiResponse<T> useDioRequest<T>(DioConfig<T> config) {
  final ValueNotifier<ApiResponse<T>> _state =
      useState<ApiResponse<T>>(ApiResponse.initial());
  Dio dio = useMemoized(() => Dio());
  useEffect(() {
    bool isCancel = false;
    CancelToken cancelToken;
    if (config != null) {
      _state.value = ApiResponse.loading();
      cancelToken = CancelToken();
      dio.request(config.path, cancelToken: cancelToken).then((value) {
        _state.value = ApiResponse.completed(config.transformResponse(value));
      }).catchError((error) {
        if (!isCancel) {
          _state.value =
              ApiResponse.error(AppException(message: error.toString()));
        }
      });
    } else {
      _state.value = ApiResponse.initial();
    }
    return () {
      isCancel = true;
      if (cancelToken != null) {
        cancelToken.cancel('Request Cancelled');
        cancelToken = null;
      }
    };
  }, [config]);
  return _state.value;
}
