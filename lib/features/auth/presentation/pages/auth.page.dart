import 'package:emeron/core/utils/constants/image.constants.dart';
import 'package:emeron/core/utils/widgets/default_stack.widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:emeron/features/home/presentation/controllers/home.controller.dart';

class AuthPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultStack(
        child: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
