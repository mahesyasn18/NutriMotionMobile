import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/activity/activity_bloc.dart';
import 'package:nutrimotion/models/activity_form_model.dart';
import 'package:nutrimotion/models/activity_model.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_activity_tile.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';

class CreateActivityPage extends StatefulWidget {
  const CreateActivityPage({super.key});

  @override
  State<CreateActivityPage> createState() => _CreateActivityPageState();
}

class _CreateActivityPageState extends State<CreateActivityPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ActivityBloc>(context).add(const ActivityGet());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pilih Kegiatan Hari ini',
          style: blackPoppinsTextStyle,
        ),
      ),
      body: BlocConsumer<ActivityBloc, ActivityState>(
        listener: (context, state) {
          if (state is ActivityFailed) {
            showCustomSnackbar(context, state.e);
          } else if (state is ActivityShowSuccess) {
            Navigator.pushReplacementNamed(context, '/create-activity-new');
          }
        },
        builder: (context, state) {
          if (state is ActivityLoading) {
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
                              fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'Motion',
                          style: blackPoppinsTextStyle.copyWith(
                              fontSize: 36, fontWeight: FontWeight.w800),
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
          if (state is ActivitySuccess) {
            final List<ActivityModel> activities = state.activities;

            return Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: ListView(
                children: [
                  const CustomSearchFormField(hints: 'Cari Kegiatan'),
                  const SizedBox(height: 16),
                  const SizedBox(height: 24),
                  Text(
                    'Daftar Kegiatan',
                    style: blackPoppinsTextStyle.copyWith(
                        fontSize: 17, fontWeight: semiBold),
                  ),
                  const SizedBox(height: 24),
                  for (final activity in activities)
                    BlocConsumer<ActivityBloc, ActivityState>(
                      listener: (context, state) {
                        if (state is ActivityFailed) {
                          showCustomSnackbar(context, state.e);
                        }
                      },
                      builder: (context, state) {
                        return CustomActivityTile(
                          iconUrl: activity.photo,
                          title: activity.activityName,
                          onTap: () {
                            // Dispatch an event to show activity details
                            context.read<ActivityBloc>().add(
                                  ActivityShow(
                                    ActivityFormModel(
                                        activity_name: activity.activityName),
                                  ),
                                );
                          },
                        );
                      },
                    ),
                  const SizedBox(height: 18),
                ],
              ),
            );
          }

          return Container(
            child: Center(
                child: Text(
              'No Data',
              style: blackPoppinsTextStyle.copyWith(
                  fontSize: 20, fontWeight: semiBold),
            )),
          );
        },
      ),
    );
  }
}
