import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/auth/auth_bloc.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_food_tile.dart';

class RecordHeavyFoodsPage extends StatefulWidget {
  const RecordHeavyFoodsPage({super.key});

  @override
  State<RecordHeavyFoodsPage> createState() => _RecordHeavyFoodsPageState();
}

class _RecordHeavyFoodsPageState extends State<RecordHeavyFoodsPage> {
  DateTime? dateTime;
  final List<String> foodList = ['salad buah', 'nasi goreng', 'alpukat', 'pisang', 'jambu', 'ati ayam', 'bubur ayam'];
  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: whiteColor,
            appBar: AppBar(
              title: const Text('Catat Makanan'),
              backgroundColor: whiteColor,
            ),
            body: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/browse-food');
                    },
                    child: Container(
                      height: 56,
                      width: 376,
                      margin: const EdgeInsets.only(bottom: 16),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: greenColor,
                      ),
                      child: Text(
                        'Tambah Asupan',
                        style: whitePoppinsTextStyle.copyWith(
                          fontSize: 16, fontWeight: bold
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Catatan Makanan',
                      style: blackPoppinsTextStyle.copyWith(
                        fontSize: 17, fontWeight: semiBold
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: foodList.map((foodName) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/add-food');
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            child: CustomFoodTile(
                              dateTime: dateTime!, 
                              foodName: foodName
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  )
                ],
              ),
            ),
          );
        },
    );
  }
}
