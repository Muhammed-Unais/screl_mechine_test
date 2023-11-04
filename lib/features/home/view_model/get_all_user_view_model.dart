import 'package:flutter/material.dart';
import 'package:screl_mechine_test/data/network/network_api_service.dart';
import 'package:screl_mechine_test/data/response/app_response.dart';
import 'package:screl_mechine_test/features/home/model/users_model.dart';
import 'package:screl_mechine_test/features/home/repository/get_all_user_repository.dart';

class GetAllUserViewModel extends ChangeNotifier {
  final _myrepo = GetAllUserRepository(apiService: NetworkApiService());

  ApiResponse<UserModel> getAllUsersapiResponse = ApiResponse.loading();

  void setApiResponse(ApiResponse<UserModel> apiResponse) {
    getAllUsersapiResponse = apiResponse;
    notifyListeners();
  }

  Future getAllUsers() async {
    setApiResponse(ApiResponse.loading());
    _myrepo.getAllUsers().then((value) {
      setApiResponse(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setApiResponse(ApiResponse.error(error.toString()));
    });
  }
}
