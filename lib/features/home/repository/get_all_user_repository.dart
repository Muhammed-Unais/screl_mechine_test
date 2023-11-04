import 'dart:convert';
import 'package:screl_mechine_test/data/network/base_api_service.dart';
import 'package:screl_mechine_test/features/home/model/user.dart';
import 'package:screl_mechine_test/features/home/model/users_model.dart';
import 'package:screl_mechine_test/res/app_url.dart';

class GetAllUserRepository {
  GetAllUserRepository({required this.apiService});
  final BaseApiService apiService;

  Future<UserModel> getAllUsers() async {
    try {
      var response = await apiService.getGetApiResponse(AppUrl.getAllUser);
      var body = jsonDecode(response) as List<dynamic>;

      var list = body.map((e) => User.fromJson(e)).toList();

      var userModel = UserModel(list);

      return userModel;
    } catch (e) {
      rethrow;
    }
  }
}
