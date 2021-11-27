
import 'package:dev_basic_api/src/response_models/session.dart';
import 'package:injectable/injectable.dart';

import '../../main.dart';
import '../base_http_service.dart';
import '../base_response.dart';

@Injectable()
class SessionEndpoints {

  SessionEndpoints(BaseHttpService baseFetch);

  Future<BaseResponse<Session>> createSessionGet() async {
    var response = await getIt<BaseHttpService>().getFetch("Session/Create", {}, false);
    var baseResponse = BaseResponse.fromApi<Session>(response, (response) => Session.fromJson(response));

    getIt<BaseHttpService>().session = baseResponse.body.results[0];

    return baseResponse;
  }
}

