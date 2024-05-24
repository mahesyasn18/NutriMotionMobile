import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'package:nutrimotion/blocs/food/food_bloc.dart';
import 'package:nutrimotion/blocs/scan/scan_bloc.dart';
import 'package:nutrimotion/models/eaten_food_model.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/shared_values.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';
import 'package:nutrimotion/ui/widgets/custom_information.dart';
import 'package:nutrimotion/ui/widgets/custom_vita.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      body: FadeTransition(
        opacity: _animation,
        child: BlocConsumer<ScanBloc, ScanState>(
          listener: (context, state) {
            if (state is ScanFailed) {
              showCustomSnackbar(context, state.e);
            }
          },
          builder: (context, state) {
            if (state is ScanLoading) {
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
            if (state is ScanProductSuccess) {
              final product = state.product;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 20, right: 20),
                      child: Image.asset(
                        'assets/back.png',
                        width: 32,
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 250,
                      height: 250,
                      child: product.picture == null
                          ? Image.asset(
                              'assets/ultra.png',
                            )
                          : Image.network(
                              '$baseUrls${product.picture!}',
                            ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                        top: 10,
                      ),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(70))),
                      child: ListView(
                        children: [
                          Center(
                            child: Text(
                              product.foodName.toString(),
                              style: greenPoppinsTextStyle.copyWith(
                                  fontSize: 22, fontWeight: semiBold),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Product Information',
                            style: blackPoppinsTextStyle.copyWith(
                                fontSize: 20, fontWeight: semiBold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Isi Bersih',
                                style: blackPoppinsTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '${product.size.toString()} ${product.foodCategory == "makanan" ? "gr" : "ml"}',
                                style: blackPoppinsTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Barcode Number',
                                style: blackPoppinsTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                product.barcodeNumber.toString(),
                                style: blackPoppinsTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Nutri Grade',
                            style: blackPoppinsTextStyle.copyWith(
                                fontSize: 20, fontWeight: semiBold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            int.parse(product.gula.toString()) <= 1
                                ? 'assets/A.png'
                                : (int.parse(product.gula.toString()) > 1 &&
                                        int.parse(product.gula.toString()) < 5
                                    ? 'assets/B.png'
                                    : (int.parse(product.gula.toString()) >=
                                                5 &&
                                            int.parse(product.gula.toString()) <
                                                10
                                        ? 'assets/C.png'
                                        : (int.parse(product.gula.toString()) >=
                                                10
                                            ? 'assets/D.png'
                                            : 'assets/default.png'))),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '* kandungan gula dalam produk: ${int.parse(product.gula.toString()) <= 1 ? '<= 1 gr' : (int.parse(product.gula.toString()) > 1 && int.parse(product.gula.toString()) < 5 ? '> 1 & < 5 gr' : (int.parse(product.gula.toString()) >= 5 && int.parse(product.gula.toString()) < 10 ? '>= 5 & < 10 gr' : (int.parse(product.gula.toString()) >= 10 ? '>= 10 gr' : 'undefined')))}\n',
                            style: blackPoppinsTextStyle.copyWith(
                                fontSize: 17, fontWeight: semiBold),
                          ),
                          Text(
                            'Nutrition Fact',
                            style: blackPoppinsTextStyle.copyWith(
                                fontSize: 20, fontWeight: semiBold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomInformation(
                            lemakTotal: product.lemakTotal.toString(),
                            lemakJenuh: product.lemakJenuh.toString(),
                            protein: product.protein.toString(),
                            karbohidratTotal:
                                product.karbohidratTotal.toString(),
                            gula: product.gula.toString(),
                            garam: product.garam.toString(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomVita(
                            vitA: product.vitA.toString(),
                            vitD: product.vitD.toString(),
                            vitE: product.vitE.toString(),
                            vitK: product.vitK.toString(),
                            vitB1: product.vitB1.toString(),
                            vitB2: product.vitB2.toString(),
                            vitB3: product.vitB3.toString(),
                            vitB5: product.vitB5.toString(),
                            vitB6: product.vitB6.toString(),
                            folat: product.folat.toString(),
                            vitB12: product.vitB12.toString(),
                            biotin: product.biotin.toString(),
                            kolin: product.kolin.toString(),
                            vitC: product.vitC.toString(),
                            kalsium: product.kalsium.toString(),
                            fosfor: product.fosfor.toString(),
                            magnesium: product.magnesium.toString(),
                            natrium: product.natrium.toString(),
                            kalium: product.kalium.toString(),
                            mangan: product.mangan.toString(),
                            tembaga: product.tembaga.toString(),
                            kromium: product.kromium.toString(),
                            besi: product.besi.toString(),
                            iodium: product.iodium.toString(),
                            seng: product.seng.toString(),
                            selenium: product.selenium.toString(),
                            fluor: product.fluor.toString(),
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 20,
                          ),
                          BlocConsumer<FoodBloc, FoodState>(
                            listener: (context, state) {
                              if (state is FoodFailed) {
                                showCustomSnackbar(context, state.e);
                              }

                              if (state is AddEatenFoodSuccess) {
                                Navigator.pushNamed(context, '/home-page');
                                showCustomSuccessSnackbar(
                                    context, 'Data berhasil disimpan!');
                              }
                            },
                            builder: (context, state) {
                              return CustomFilledButton(
                                title: 'Tambahkan pada plan gizi harian',
                                onPressed: () {
                                  final now = DateTime.now();
                                  final formattedTime = DateFormat('HH:mm:ss')
                                      .format(now); // HH:mm:ss format
                                  final parsedTime = TimeOfDay(
                                    hour:
                                        int.parse(formattedTime.split(':')[0]),
                                    minute:
                                        int.parse(formattedTime.split(':')[1]),
                                  );
                                  context.read<FoodBloc>().add(
                                        AddEatenFood(
                                          EatenFoodModel(
                                            foodName: product.foodName,
                                            foodType: product.foodType,
                                            foodCategory: product.foodCategory,
                                            foodCalori: product.kalori,
                                            foodCarb: product.karbohidratTotal,
                                            foodFat: product.lemakTotal,
                                            foodProtein: product.protein,
                                            foodSize: product.size,
                                            eatTime: parsedTime,
                                          ),
                                        ),
                                      );
                                },
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
