import 'package:screl_mechine_test/data/network/base_api_service.dart';
import 'package:screl_mechine_test/features/home/model/users_model.dart';
import 'package:screl_mechine_test/res/app_url.dart';

class GetAllUserRepository {
  GetAllUserRepository({required this.apiService});
  final BaseApiService apiService;

  Future<UserModel> getAllUsers() async {
    try {
      var response = await apiService.getGetApiResponse(AppUrl.getAllUser);

      return UserModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
