import 'package:doctor_system/core/di/dependency_injection.dart';
import 'package:doctor_system/core/routing/app_router.dart';
import 'package:doctor_system/doc_app.dart';
import 'package:flutter/material.dart';

void main() {
  setupGetIt();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
