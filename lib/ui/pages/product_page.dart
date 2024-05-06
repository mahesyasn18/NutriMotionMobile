import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/scan/scan_bloc.dart';
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
                                state.product.foodName.toString(),
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
                                  "${state.product.size} ml",
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
                                  state.product.barcodeNumber.toString(),
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
                              int.parse(state.product.gula.toString()) <= 1
                                  ? 'assets/A.png'
                                  : (int.parse(state.product.gula.toString()) >
                                              1 &&
                                          int.parse(state.product.gula
                                                  .toString()) <
                                              5
                                      ? 'assets/B.png'
                                      : (int.parse(state.product.gula
                                                      .toString()) >=
                                                  5 &&
                                              int.parse(state.product.gula
                                                      .toString()) <
                                                  10
                                          ? 'assets/C.png'
                                          : (int.parse(state.product.gula
                                                      .toString()) >=
                                                  10
                                              ? 'assets/D.png'
                                              : 'assets/default.png' // Default image if none of the conditions match
                                          ))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '* kandungan gula dalam produk: ${int.parse(state.product.gula.toString()) <= 1 ? '<= 1 gr' : (int.parse(state.product.gula.toString()) > 1 && int.parse(state.product.gula.toString()) < 5 ? '> 1 & < 5 gr' : (int.parse(state.product.gula.toString()) >= 5 && int.parse(state.product.gula.toString()) < 10 ? '>= 5 & < 10 gr' : (int.parse(state.product.gula.toString()) >= 10 ? '>= 10 gr' : 'undefined' // handle undefined case
                                  )))}',
                              style: blackPoppinsTextStyle.copyWith(
                                  fontSize: 17, fontWeight: semiBold),
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
                            const Divider(),
                            const SizedBox(
                              height: 20,
                            ),
                            const CustomFilledButton(
                                title: 'Tambahkan pada plan gizi harian'),
                            const SizedBox(
                              height: 20,
                            ),
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
      ),
    );
  }
}
