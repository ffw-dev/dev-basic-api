import 'package:dev_basic_api/main.dart';
import 'package:dev_basic_api/src/base_http_service.dart';

void main() {
  configureInjectionDependencies();
  print(getIt<BaseHttpService>());
}
