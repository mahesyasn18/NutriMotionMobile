import 'package:flutter/material.dart';
import 'package:nutrimotion/blocs/auth/auth_bloc.dart';
import 'package:nutrimotion/models/profille_edit_form_model.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final fullnameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      fullnameController.text = authState.user.fullname.toString();
      emailController.text = authState.user.email.toString();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: const Text('Bio-Data'),
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailed) {
              showCustomSnackbar(context, state.e);
            }

            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/success-update-profile', (route) => false);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      width: 100,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Nutri',
                            style: greenPoppinsTextStyle.copyWith(
                                fontSize: 36, fontWeight: black),
                          ),
                          TextSpan(
                            text: 'Motion',
                            style: blackPoppinsTextStyle.copyWith(
                                fontSize: 36, fontWeight: extraBold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 55),
                      child: LinearProgressIndicator(
                        color: greenColor,
                        minHeight: 20,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: ListView(
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
                  CustomFormField(
                    title: 'Fullname',
                    controller: fullnameController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomFormField(title: 'Email', controller: emailController),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFilledButton(
                    title: 'Update Profile',
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthUpdateUser(
                          ProfileUserEditFormModel(
                              fullname: fullnameController.text,
                              email: emailController.text)));
                    },
                  ),
                ],
              ),
            );
          },
        ));
  }
}
