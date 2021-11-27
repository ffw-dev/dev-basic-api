import 'dart:convert';

import 'package:dev_basic_api/src/response_models/billing_timed_summary_item.dart';
import 'package:injectable/injectable.dart';

import '../../main.dart';
import '../base_http_service.dart';
import '../base_response.dart';

@Injectable()
class BillingTimedEventEndpoints {

  BillingTimedEventEndpoints(BaseHttpService baseHttpService);

  Future<BaseResponse<BillingTimedSummaryItem>> getSummary(int daysOld) async {
    var query = {
      'period': json.encode({
        'from': DateTime.now().subtract(Duration(days: daysOld)).toIso8601String(),
        'to': DateTime.now().toIso8601String(),
      }),
      'user': '',
      'collectionId': '',
      'format': 'json2',
      'userHttpStatusCode': 'False'
    };

    var response = await getIt<BaseHttpService>().getFetch("BillingTimedEvent/GetSummary", query, true).then((value) => value);
    var data = response;

    return BaseResponse.fromApi(data, (data) => BillingTimedSummaryItem.fromJson(data));
  }
}