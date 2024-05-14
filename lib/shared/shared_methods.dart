import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';

void showCustomSnackbar(BuildContext context, String message) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: redColor,
    duration: const Duration(seconds: 2),
  ).show(context);
}

void showCustomSuccessSnackbar(BuildContext context, String message){
  Flushbar(
    icon: Icon(Icons.check_circle, color: whiteColor,),
    message: message,
    flushbarPosition: FlushbarPosition.BOTTOM,
    backgroundColor: Colors.green,
    duration: const Duration(seconds: 2),
  ).show(context);
}