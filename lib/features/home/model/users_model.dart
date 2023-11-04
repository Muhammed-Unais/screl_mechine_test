import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:screl_mechine_test/features/home/model/user.dart';
part 'users_model.freezed.dart';
part 'users_model.g.dart';
  
@freezed
class UserModel with _$UserModel {
  const factory UserModel({required List<User> users}) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json)
      => _$UserModelFromJson(json);
}
