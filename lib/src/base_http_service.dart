import 'package:dev_basic_api/response_models/session.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


@Singleton()
@Injectable()
class BaseHttpService {
  Session? session;
  late final Dio _dio;

  Dio get dio => _dio;

  BaseHttpService(){
    _dio = Dio();
    _dio.options.baseUrl = "https://dev-basic.api.ffw.io/v6/";
  }

  Future<Map<String, dynamic>> getFetch(String endpoint, Map<String, String> query, bool requiresAuthed) async {
    if(requiresAuthed) {
      if(session == null) {
        throw Exception("doesnt exist");
      } else {
        query.addAll({'sessionGUID' : session!.guid});
      }
    }

    return _dio.get(createURL(endpoint), queryParameters: query).then((response) {
      if(response.statusCode != 200) {
        throw Exception("Something went wrong at getFetch()");
      }
      return response.data as Map<String, dynamic>;
    });
  }

  Future<Map<String, dynamic>> postFetch(String endpoint, FormData formData, bool requiresAuthed) async {
      if(requiresAuthed) {
        /** Application throws exception but does not print it nor stops the application, just gets stuck **/
        try {
          formData = addSessionOrThrow(formData);
        } catch (e) {
          print(e);
          return {};
        }
      }

      late Response<dynamic> response;

      try {
        response = await _dio.post(
          createURL(endpoint),
          data: formData,
        );
      } catch(e) {
        print(e);
      }


      if(response.statusCode != 200) {
        throw Exception('Something went wrong status:' + response.statusCode.toString());
      }

      var data = response.data;

      return Future.value(data);
  }

  FormData addSessionOrThrow(FormData formData) {

    if(session == null) {
      throw Exception("Session does not exist.");
    }

    formData.fields.add(MapEntry('SessionGUID', session!.guid));

    return formData;
  }

  String createURL(String endpoint) {
    return _dio.options.baseUrl + endpoint;
  }

}
