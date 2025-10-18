import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class AppToast {
  static void showSuccess(
    BuildContext context, {
    required String title,
    String? message,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      title: Text(title),
      description: message != null ? Text(message) : null,
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.bottomCenter,
      borderRadius: BorderRadius.circular(12),
    );
  }

  static void showError(
    BuildContext context, {
    required String title,
    String? message,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
      title: Text(title),
      description: message != null ? Text(message) : null,
      autoCloseDuration: const Duration(seconds: 4),
      alignment: Alignment.bottomCenter,
      borderRadius: BorderRadius.circular(12),
    );
  }

  static void showInfo(
    BuildContext context, {
    required String title,
    String? message,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.info,
      style: ToastificationStyle.flat,
      title: Text(title),
      description: message != null ? Text(message) : null,
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.bottomCenter,
      borderRadius: BorderRadius.circular(12),
    );
  }

  static void showWarning(
    BuildContext context, {
    required String title,
    String? message,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.warning,
      style: ToastificationStyle.fillColored,
      title: Text(title),
      description: message != null ? Text(message) : null,
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.bottomCenter,
      borderRadius: BorderRadius.circular(12),
    );
  }
}
