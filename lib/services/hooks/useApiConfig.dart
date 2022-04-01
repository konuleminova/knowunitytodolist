
import 'package:flutter_hooks/flutter_hooks.dart';

import '../api_helper/api_config.dart';
ApiConfig useApiConfig() {
  return useMemoized(() => new ApiConfig(), []);
}
