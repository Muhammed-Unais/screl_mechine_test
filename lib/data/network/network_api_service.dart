import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:screl_mechine_test/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:screl_mechine_test/data/app_exception.dart';
import 'package:screl_mechine_test/res/app_url.dart';

class NetworkApiService implements BaseApiService {
  @override
  Future<dynamic> getGetApiResponse(String endPoint) async {
    try {
      var uri = Uri.http(AppUrl.baseUrl, endPoint);
      Response response = await http.get(uri);

      return returnResponse(response);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  dynamic returnResponse(Response? response) {
    if (response != null) {
      dynamic message;

      switch (response.statusCode) {
        case 200:
          log(response.body);
          return response.body;
        case 400:
          throw BadRequestException(message, response.statusCode);
        case 401:
          throw UnauthorisedException(message, response.statusCode);
        case 403:
          throw UnauthorisedException(message, response.statusCode);
        case 500:
          throw FetchDataException('Something went wrong', response.statusCode);
        default:
          throw FetchDataException(message, response.statusCode);
      }
    } else {
      throw FetchDataException(
        'No internet connection',
      );
    }
  }
}
