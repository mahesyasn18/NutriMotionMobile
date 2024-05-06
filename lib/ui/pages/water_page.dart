import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/water/water_bloc.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';

class WaterPage extends StatefulWidget {
  const WaterPage({Key? key}) : super(key: key);

  @override
  _WaterPageState createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterPage> {
  final List<bool> _glassStatus = List.generate(8, (index) => true);

  @override
  void initState() {
    super.initState();
    // Panggil event WaterCheck saat halaman dibangun
    BlocProvider.of<WaterBloc>(context).add(const WaterCheck());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WaterBloc, WaterState>(
      listener: (context, state) {
        if (state is WaterFailed) {
          showCustomSnackbar(context, state.e);
        }
      },
      builder: (context, state) {
        if (state is WaterLoading) {
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
        if (state is WaterSuccess) {
          final int usingWater = state.water.using_water ?? 0;
          for (int i = 0; i < _glassStatus.length; i++) {
            if (i < usingWater) {
              _glassStatus[i] = false;
            }
          }

          void _emptyGlass(int index) {
            if (_glassStatus[index] == true) {
              setState(() {
                _glassStatus[index] = false;
                context.read<WaterBloc>().add(const WaterDrink());
              });
            }
          }

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Catatan Konsumsi Air Putih Harian',
                      style: blackPoppinsTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(83),
                        border: Border.all(color: greenColor),
                      ),
                      width: 166,
                      height: 166,
                      child: Center(
                        child: Text(
                          '$usingWater Gelas',
                          style: greenPoppinsTextStyle.copyWith(
                            fontSize: 17,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      4,
                      (index) => GestureDetector(
                        onTap: () {
                          _emptyGlass(index);
                        },
                        child: Column(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              width: 80,
                              height: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    _glassStatus[index]
                                        ? 'assets/ic_gelas_penuh.png'
                                        : 'assets/ic_gelas_kosong.png',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Gelas ${index + 1}',
                              style: greenPoppinsTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: semiBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      4,
                      (index) => GestureDetector(
                        onTap: () {
                          _emptyGlass(index + 4);
                        },
                        child: Column(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              width: 80,
                              height: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    _glassStatus[index + 4] // Perubahan di sini
                                        ? 'assets/ic_gelas_penuh.png'
                                        : 'assets/ic_gelas_kosong.png',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Gelas ${index + 5}',
                              style: greenPoppinsTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: semiBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
