import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'main.config.dart';
import 'src/api_endpoints/authentication_endpoints.dart';
import 'src/api_endpoints/billing_timed_event_endpoints.dart';
import 'src/api_endpoints/session_endpoints.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureInjectionDependencies() => $initGetIt(getIt);

class DevBasicApi {
  static final BillingTimedEventEndpoints billingTimedEventEndpoints = getIt<BillingTimedEventEndpoints>();
  static final SessionEndpoints sessionEndpoints = getIt<SessionEndpoints>();
  static final AuthenticationEndpoints authenticationEndpoints = getIt<AuthenticationEndpoints>();
}

