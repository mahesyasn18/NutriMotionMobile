import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';

class EditPassword extends StatelessWidget {
  const EditPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: const Text('Password'),
          backgroundColor: whiteColor,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 27),
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/reset_pw.gif',
                height: 300,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomFormField(
                title: 'Current Password',
                obsecureText: true,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomFormField(
                title: 'New Password',
                obsecureText: true,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomFilledButton(title: 'Update Password'),
            ],
          ),
        ));
  }
}
