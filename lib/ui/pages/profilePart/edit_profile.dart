import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: const Text('Bio-Data'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 27),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/regis.gif',
                height: 300,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomFormField(title: 'Name'),
              const SizedBox(
                height: 15,
              ),
              CustomFormField(title: 'Email'),
              const SizedBox(
                height: 30,
              ),
              CustomFilledButton(title: 'Update Profile'),
            ],
          ),
        ));
  }
}
