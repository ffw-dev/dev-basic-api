import 'package:dev_basic_api/main.dart';
import 'package:dev_basic_api/src/base_http_service.dart';
import 'package:dev_basic_api/src/api_endpoints/production_clients_apis/production_client_api_billing_summary_endpoint.dart';
import 'package:dotenv/dotenv.dart';

void main() {
  configureInjectionDependencies();
  load(); // Loads env variables
  getIt<ProductionClientApisBillingSummaryEndpoint>().authenticateAndGetSummary(fromPeriod: 20000, baseURL: env['SVT0BASEURL']!, authToken: env['SVT0TOKEN']!);
  getIt<ProductionClientApisBillingSummaryEndpoint>().authenticateAndGetSummary(baseURL: env['SVT1BASEURL']!, authToken: env['SVT1TOKEN']!);
}
