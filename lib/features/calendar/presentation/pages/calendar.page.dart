import 'package:emeron/core/utils/constants/image.constants.dart';
import 'package:emeron/core/utils/widgets/default_stack.widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:emeron/features/calendar/presentation/controllers/calendar.controller.dart';

class CalendarPage extends GetView<CalendarController> {
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
