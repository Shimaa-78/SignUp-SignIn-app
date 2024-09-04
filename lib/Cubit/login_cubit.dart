import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:hawkeye/FrontPage.dart';
import 'package:hawkeye/Helpers/DioHelper.dart';
import 'package:hawkeye/Models/UserModel.dart';
import 'package:meta/meta.dart';

import '../Helpers/hive_Helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginModel model = LoginModel();

  void login({
    required String email,
    required String password,
    String ?name,
    String ?phone,
    bool is_register = false,
  }) async {
    emit(LoginLoadingState());
    try {
      final response = await DioHelper.PostData(
        path: is_register ?"register": "login" ,
        body: {
          "email": email,
          "password": password,
          if(is_register)  "name":name,
          if(is_register)  "phone":phone
        },
      );

      if (response.data == null) {
        throw Exception("Response data is null");
      }

      model = LoginModel.fromJson(response.data);

      if (model.status == true)
      {
        HiveHelper.setToken(model.data?.token ?? "");
        Get.offAll(FrontPage());
        emit(LoginSuccessState(model.message ?? "Login successful"));
      } else {
        final errorMessage = model.message ?? "An error occurred during login";
        emit(LoginErrorState(errorMessage));
        print("Error: $errorMessage");
      }
    } catch (e) {
      // Log the exception and handle it gracefully
      print("Exception: $e");
      emit(LoginErrorState("Connection is bad or an unexpected error occurred"));
    }
  }
}
