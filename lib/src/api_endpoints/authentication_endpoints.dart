import 'package:dev_basic_api/src/response_models/secure_cookie.dart';
import 'package:dev_basic_api/src/response_models/user.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../main.dart';
import '../base_http_service.dart';
import '../base_response.dart';

@Injectable()
class AuthenticationEndpoints {

  AuthenticationEndpoints(BaseHttpService baseFetch);

  Future<BaseResponse<User>> emailPasswordPost(FormData formData) async {
    var response = await getIt<BaseHttpService>().postFetch("EmailPassword/Login", formData, true).then((value) => value);
    var data = response;

    return BaseResponse.fromApi<User>(data, (data) => User.fromJson(data));
  }

  Future<BaseResponse<SecureCookie>?>? secureCookieLogin(FormData formData) async {
    print('before secureLogin');
    var response = await getIt<BaseHttpService>().postFetch("SecureCookie/Login", formData, true).then((value) => value);
    print('after secureLogin');
    if(response.isEmpty) {
      return null;
    }
    var data = response;

    return BaseResponse.fromApi(data, (data) => SecureCookie.fromJson(data));
  }

  Future<BaseResponse<SecureCookie>> secureCookieCreate() async {
    var response = await getIt<BaseHttpService>().getFetch("SecureCookie/Create", {}, true).then((value) => value);
    var data = response;

    return BaseResponse.fromApi(data, (data) => SecureCookie.fromJson(data));
  }
}