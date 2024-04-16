import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/scan/scan_bloc.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';
import 'package:nutrimotion/ui/widgets/custom_information.dart';
import 'package:nutrimotion/ui/widgets/custom_vita.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  double bannerHeight =
      200; // Moved the bannerHeight variable outside the build method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      body: BlocConsumer<ScanBloc, ScanState>(
        listener: (context, state) {
          if (state is ScanFailed) {
            showCustomSnackbar(context, state.e);
          }
        },
        builder: (context, state) {
          if (state is ScanLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ScanProductSuccess) {
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
                  child: Container(
                    width: 250,
                    height: 250,
                    child: Image.asset(
                      'assets/ultra.png',
                    ),
                  ),
                ),
                Expanded(
                  // Use Expanded to make the container fill available vertical space
                  child: Center(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(70))),
                      child: ListView(
                        children: [
                          Center(
                            child: Text(
                              state.product.foodName.toString(),
                              style: greenPoppinsTextStyle.copyWith(
                                  fontSize: 22, fontWeight: semiBold),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Description',
                            style: blackPoppinsTextStyle.copyWith(
                                fontSize: 20, fontWeight: semiBold),
                          ),
                          Text(
                            'Made fresh daily with our signature lettuce blend, cheddar cheese, diced tomatoes, cool, creamy avocado.',
                            style: blackPoppinsTextStyle,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Nutrition Fact',
                            style: blackPoppinsTextStyle.copyWith(
                                fontSize: 20, fontWeight: semiBold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const CustomInformation(
                              lemakTotal: "8",
                              lemakJenuh: "4",
                              protein: "6",
                              karbohidratTotal: "19",
                              gula: "11",
                              garam: "85"),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomVita(
                              vitA: "30",
                              vitD: "30",
                              vitE: "30",
                              vitK: "30",
                              vitB1: "30",
                              vitB2: "30",
                              vitB3: "30",
                              vitB5: "30",
                              vitB6: "20",
                              folat: "20",
                              vitB12: "20",
                              biotin: "20",
                              kolin: "20",
                              vitC: "20",
                              kalsium: "20",
                              fosfor: "20",
                              magnesium: "20",
                              natrium: "20",
                              kalium: "20",
                              mangan: "20",
                              tembaga: "20",
                              kromium: "20",
                              besi: "20",
                              iodium: "20",
                              seng: "20",
                              selenium: "20",
                              fluor: "20"),
                          Divider(),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomFilledButton(
                              title: 'Tambahkan pada plan gizi harian')
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
