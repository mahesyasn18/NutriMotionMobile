import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/usergoal/usergoal_bloc.dart';
import 'package:nutrimotion/models/set_goal_form_model.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';

class CreateGoalPage extends StatefulWidget {
  const CreateGoalPage({super.key});

  @override
  State<CreateGoalPage> createState() => _CreateGoalPageState();
}

class _CreateGoalPageState extends State<CreateGoalPage> {
  final kaloriController = TextEditingController(text: '');

  bool validate() {
    if (kaloriController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Goal Bakar Kalori'),
      ),
      body: BlocConsumer<UsergoalBloc, UsergoalState>(
        listener: (context, state) {
          if (state is UsergoalFailed) {
            showCustomSnackbar(context, state.e);
          }
          if (state is UsergoalSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is UsergoalLoading) {
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
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListView(
              children: [
                Image.asset(
                  'assets/goals.gif',
                  width: 300,
                  height: 300,
                ),
                CustomFormNumField(
                  title: 'Jumlah Kalori',
                  controller: kaloriController,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'Submit',
                  onPressed: () {
                    if (validate()) {
                      context.read<UsergoalBloc>().add(
                            UserGoalSet(
                              SetGoalFormModel(
                                kalori: kaloriController.text.toString(),
                              ),
                            ),
                          );
                    } else {
                      showCustomSnackbar(context, 'Jumlah kalori harus diisi!');
                    }
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
