import 'dart:convert';

import 'package:dev_basic_api/response_models/billing_timed_summary_item.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../main.dart';
import '../../base_http_service.dart';
import '../../base_response.dart';

@Injectable()
class ProductionClientApisBillingSummaryEndpoint {
  ProductionClientApisBillingSummaryEndpoint(BaseHttpService baseHttpService);

  Future<BaseResponse<BillingTimedSummaryItem>> _getSummary(DateTime from, DateTime? to) async {
    var query = {
      'period': json.encode({
        'from':
            from.toIso8601String(),
        'to': to != null ? to.toIso8601String() : DateTime.now().toIso8601String(),
      }),
      'user': '',
      'collectionId': '',
      'format': 'json2',
      'userHttpStatusCode': 'False'
    };

    var response = await getIt<BaseHttpService>()
        .getFetch("BillingTimedEvent/GetSummary", query, true)
        .then((value) => value);
    var data = response;

    return BaseResponse.fromApi(
        data, (data) => BillingTimedSummaryItem.fromJson(data));
  }

  Future<BaseResponse<BillingTimedSummaryItem>> authenticateAndGetSummary({required DateTime fromPeriod, required String baseURL, required String authToken}) async {
    var httpClientBaseUrlTemp = getIt<BaseHttpService>().dio.options.baseUrl;
    getIt<BaseHttpService>().dio.options.baseUrl = baseURL;

    return await getIt<BaseHttpService>()
        .getFetch(
            "AuthKey/Login",
            {
              'token': authToken
            },
            false)
        .then((value) {
      var response = BaseResponse.fromApi<Session>(value, (value) => Session.fromJson(value));

      getIt<BaseHttpService>().session = response.body.results[0];

      var summaryResponse = _getSummary(fromPeriod, null).then((value) {
        return value;
      });

      getIt<BaseHttpService>().session =
          null; // Remove session from baseHttpClient singleton created for client api

      getIt<BaseHttpService>().dio.options.baseUrl = httpClientBaseUrlTemp;
      return summaryResponse;
    });

  }

  Future<BaseResponse<BillingTimedSummaryItem>> authenticateAndGetSummaryFromRange({required DateTime fromPeriod, required DateTime? to,required String baseURL, required String authToken}) async {
    var httpClientBaseUrlTemp = getIt<BaseHttpService>().dio.options.baseUrl;
    getIt<BaseHttpService>().dio.options.baseUrl = baseURL;

    return await getIt<BaseHttpService>()
        .getFetch(
        "AuthKey/Login",
        {
          'token': authToken
        },
        false)
        .then((value) {
      var response = BaseResponse.fromApi<Session>(value, (value) => Session.fromJson(value));

      getIt<BaseHttpService>().session = response.body.results[0];

      var summaryResponse = _getSummary(fromPeriod, to).then((value) {
        return value;
      });

      getIt<BaseHttpService>().session =
      null; // Remove session from baseHttpClient singleton created for client api

      getIt<BaseHttpService>().dio.options.baseUrl = httpClientBaseUrlTemp;
      return summaryResponse;
    });

  }
}
