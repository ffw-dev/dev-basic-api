// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'src/api_endpoints/authentication_endpoints.dart' as _i6;
import 'src/api_endpoints/billing_timed_event_endpoints.dart' as _i3;
import 'src/api_endpoints/session_endpoints.dart' as _i5;
import 'src/base_http_service.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas
import 'src/api_endpoints/production_clients_apis/production_client_api_billing_summary_endpoint.dart' as _i7;

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.BillingTimedEventEndpoints>(
      () => _i3.BillingTimedEventEndpoints(get<_i4.BaseHttpService>()));
  gh.factory<_i5.SessionEndpoints>(
      () => _i5.SessionEndpoints(get<_i4.BaseHttpService>()));
  gh.factory<_i6.AuthenticationEndpoints>(
      () => _i6.AuthenticationEndpoints(get<_i4.BaseHttpService>()));
  gh.factory(
      () => _i7.ProductionClientApisBillingSummaryEndpoint(get<_i4.BaseHttpService>()));
  gh.singleton<_i4.BaseHttpService>(_i4.BaseHttpService());
  return get;
}
