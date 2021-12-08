import 'package:dev_basic_api/main.dart';
import 'package:dev_basic_api/src/base_http_service.dart';
import 'package:dev_basic_api/src/api_endpoints/production_clients_apis/production_client_api_billing_summary_endpoint.dart';
import 'package:dotenv/dotenv.dart';

void main() {
  configureInjectionDependencies();
  load(); // Loads env variables
  getIt<ProductionClientApisBillingSummaryEndpoint>().authenticateAndGetSummary(env['SVT0BASEURL']!, env['SVT0TOKEN']!);
  getIt<ProductionClientApisBillingSummaryEndpoint>().authenticateAndGetSummary(env['SVT1BASEURL']!, env['SVT1TOKEN']!);
}
