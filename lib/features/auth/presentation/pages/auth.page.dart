import 'package:emeron/core/utils/constants/image.constants.dart';
import 'package:emeron/core/utils/widgets/default_stack.widgets.dart';
import 'package:emeron/features/auth/presentation/controllers/auth.controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthPage extends GetView<AuthController> {
  final loginCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  _login() async{
    try {
      await controller.signIn(loginCtrl.text, passCtrl.text);
    } catch (e) {
      Get.showSnackbar(const GetSnackBar(
        titleText: Text('Login'),
        messageText: Text('Eerro'),
        duration: Durations.extralong4,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultStack(
        child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: Image.asset(AppImages.logo),
                ),
                Container(
                  width: 286,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.25),
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Login',
                        style: GoogleFonts.roboto(
                            color: Colors.white, fontSize: 26),
                      ),
                      const Divider(),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            const Text(
                              'Usuário',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextField(
                              controller: loginCtrl,
                              decoration: getInputDecoration(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            const Text(
                              'Senha',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextField(
                              controller: passCtrl,
                              obscureText: true,
                              decoration: getInputDecoration(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: OutlinedButton(
                            style: const ButtonStyle(
                                minimumSize: WidgetStatePropertyAll(
                                    Size(double.infinity, 50)),
                                foregroundColor:
                                    WidgetStatePropertyAll(Colors.white),
                                backgroundColor:
                                    WidgetStatePropertyAll(Color(0xFF13385D))),
                            onPressed:() => _login(),
                            child: Text('Logar')),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  InputDecoration getInputDecoration() {
    return InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));
  }
}
