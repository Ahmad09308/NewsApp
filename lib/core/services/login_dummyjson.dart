
import 'package:aa/core/config/service_locater.dart';
import 'package:aa/core/model/handling_model.dart';
import 'package:aa/core/model/loginModel.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthService extends CoreSerivce {
  String baseurl = 'https://dummyjson.com/auth/login';
  Future<ResultModel> logIn(UserModel user);
}

class CoreSerivce {
  final Dio dio = Dio();
 
  late Response response;
}

class AuthServiceImp extends AuthService {
  @override
  Future<ResultModel> logIn(UserModel user) async {
    try {
      response = await dio.post(baseurl, data: user.toMap());
      if (response.statusCode == 200) {
        core
            .get<SharedPreferences>()
            .setString("token", response.data['token']);
        return DataSuccess();
      } else {
        return ExceptionModel(message:'Failed to connect to server' );
      }
    } catch (e) {
      return ExceptionModel(message: 'Exception occurred');
    }
  }
}
