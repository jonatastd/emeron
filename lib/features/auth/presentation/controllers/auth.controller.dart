import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:emeron/routes/app_routes.dart';
import 'package:emeron/core/utils/helpers/validators/cpf.validator.dart';
import 'package:emeron/features/auth/domain/usecases/authenticate_user.usecase.dart';

class AuthController extends GetxController {
  IAuthenticateUserUseCase _authenticateUserUseCase;

  AuthController(this._authenticateUserUseCase);

  TextEditingController cpfController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxString errorMessage = ''.obs;
  RxString cpfText = ''.obs;
  RxString passText = ''.obs;
  RxBool obscureText = false.obs;

  set cpf(String value) => cpfText.value = value;
  set pass(String value) => passText.value = value;

  // generate Signin method
  Future<void> signIn() async {
    try {
      String cpf = cpfController.text.replaceAll('.', '');
      cpf = cpf.replaceAll('-', '');
      await _authenticateUserUseCase(
        cpf,
        passwordController.text,
      );
      Get.offAndToNamed(AppRoutes.home);
    } catch (e) {
      // Handle login error, e.g., show an error message
    }
  }

  void validateCPF(String value) {
    if (value.isEmpty) {
      errorMessage.value = 'required_cpf'.tr;
    } else if (!CPFValidator.validate(value)) {
      errorMessage.value = 'invalid_cpf'.tr;
    } else {
      errorMessage.value = '';
      cpfText.value = value;
    }
  }
}
