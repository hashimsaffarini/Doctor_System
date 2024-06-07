import 'package:doctor_system/core/di/dependency_injection.dart';
import 'package:doctor_system/core/helper/constants.dart';
import 'package:doctor_system/core/helper/extinstions.dart';
import 'package:doctor_system/core/helper/shared_pref_helpers.dart';
import 'package:doctor_system/core/routing/app_router.dart';
import 'package:doctor_system/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();

  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}

checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
