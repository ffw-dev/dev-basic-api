import 'package:dev_basic_api/src/api_endpoints/production_clients_apis/production_client_api_billing_summary_endpoint.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'main.config.dart';
import 'src/api_endpoints/authentication_endpoints.dart';
import 'src/api_endpoints/billing_timed_event_endpoints.dart';
import 'src/api_endpoints/session_endpoints.dart';

export 'response_models/billing_timed_summary_item.dart';
export 'response_models/secure_cookie.dart';
export 'response_models/session.dart';
export 'response_models/user.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureInjectionDependencies() => $initGetIt(getIt);

class DevBasicApi {
  static final ProductionClientApisBillingSummaryEndpoint productionClientApisBillingSummaryEndpoint = getIt<ProductionClientApisBillingSummaryEndpoint>();
  static final BillingTimedEventEndpoints billingTimedEventEndpoints = getIt<BillingTimedEventEndpoints>();
  static final SessionEndpoints sessionEndpoints = getIt<SessionEndpoints>();
  static final AuthenticationEndpoints authenticationEndpoints = getIt<AuthenticationEndpoints>();
}

