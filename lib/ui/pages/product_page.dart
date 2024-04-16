import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/scan/scan_bloc.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/shared_values.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';
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
                    child: state.product.picture == null
                        ? Image.asset(
                            'assets/ultra.png',
                          )
                        : Image.network(
                            '$baseUrls${state.product.picture!}',
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
                          CustomInformation(
                              lemakTotal: state.product.lemakTotal.toString(),
                              lemakJenuh: state.product.lemakJenuh.toString(),
                              protein: state.product.protein.toString(),
                              karbohidratTotal:
                                  state.product.karbohidratTotal.toString(),
                              gula: state.product.gula.toString(),
                              garam: state.product.garam.toString()),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomVita(
                            vitA: state.product.vitA.toString(),
                            vitD: state.product.vitD.toString(),
                            vitE: state.product.vitE.toString(),
                            vitK: state.product.vitK.toString(),
                            vitB1: state.product.vitB1.toString(),
                            vitB2: state.product.vitB2.toString(),
                            vitB3: state.product.vitB3.toString(),
                            vitB5: state.product.vitB5.toString(),
                            vitB6: state.product.vitB6.toString(),
                            folat: state.product.folat.toString(),
                            vitB12: state.product.vitB12.toString(),
                            biotin: state.product.biotin.toString(),
                            kolin: state.product.kolin.toString(),
                            vitC: state.product.vitC.toString(),
                            kalsium: state.product.kalsium.toString(),
                            fosfor: state.product.fosfor.toString(),
                            magnesium: state.product.magnesium.toString(),
                            natrium: state.product.natrium.toString(),
                            kalium: state.product.kalium.toString(),
                            mangan: state.product.mangan.toString(),
                            tembaga: state.product.tembaga.toString(),
                            kromium: state.product.kromium.toString(),
                            besi: state.product.besi.toString(),
                            iodium: state.product.iodium.toString(),
                            seng: state.product.seng.toString(),
                            selenium: state.product.selenium.toString(),
                            fluor: state.product.fluor.toString(),
                          ),
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
