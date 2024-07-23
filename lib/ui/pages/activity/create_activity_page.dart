import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/activity/activity_bloc.dart';
import 'package:nutrimotion/models/activity_model.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_activity_tile.dart';

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

  final searchController = TextEditingController();
  List<ActivityModel> activityData = [];
  List<ActivityModel> filteredactivityData = [];
  void filterData(String query) {
    setState(() {
      filteredactivityData = activityData
          .where((activity) =>
              activity.activityName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
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
          if (state is ActivitySuccess) {
            setState(() {
              activityData = state.activities;
              filteredactivityData = state.activities;
            });
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

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  left: 20,
                  right: 20,
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Cari Kegiatan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.amber[700],
                    ),
                  ),
                  onChanged: filterData,
                ),
              ),
              Expanded(
                child: filteredactivityData.isNotEmpty
                    ? ListView.builder(
                        itemCount: filteredactivityData.length,
                        itemBuilder: (context, index) => Card(
                            elevation: 0,
                            key: ValueKey(
                                filteredactivityData[index].activityName),
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/create-activity-new',
                                      arguments: filteredactivityData[index]);
                                },
                                child: CustomActivityTile(
                                  iconUrl: filteredactivityData[index].photo,
                                  title: filteredactivityData[index]
                                      .activityName
                                      .toString(),
                                ),
                              ),
                            )))
                    : Text(
                        'No result found',
                        style: blackPoppinsTextStyle.copyWith(
                            fontSize: 17, fontWeight: bold),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
