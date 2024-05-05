import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';

class AddFoodPage extends StatefulWidget {
  const AddFoodPage({super.key});

  @override
  State<AddFoodPage> createState() => _AddFoodPageState();
}

class _AddFoodPageState extends State<AddFoodPage> {
  final foodNameController = TextEditingController(text: '');
  final foodServingController = TextEditingController(text: '');
  final foodSizeController = TextEditingController(text: '');
  final timeController = TextEditingController(text: '');
  final karboSize = '27.0';
  final lemakSize = '27.0';
  final seratSize = '27.0';
  final proteinSize = '27.0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const Text('Tambah Asupan'),
        backgroundColor: whiteColor,
        shadowColor: whiteColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: CustomFormField(
                  title: 'Nama Makanan/Minuman',
                  controller: foodNameController,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Informasi Nutrisi',
                      style: blackPoppinsTextStyle.copyWith(
                        fontSize: 17, fontWeight: semiBold
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 17,
                            height: 17,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: redDotColor
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          SizedBox(
                            width: 149,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Karbohidrat',
                                  style: blackPoppinsTextStyle.copyWith(
                                    fontSize: 17, fontWeight: medium
                                  ),
                                ),
                                Text(
                                  '${karboSize}g',
                                  style: blackPoppinsTextStyle.copyWith(
                                    fontSize: 17, fontWeight: light
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 17,
                            height: 17,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: greenDotColor
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          SizedBox(
                            width: 149,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Lemak',
                                  style: blackPoppinsTextStyle.copyWith(
                                    fontSize: 17, fontWeight: medium
                                  ),
                                ),
                                Text(
                                  '${lemakSize}g',
                                  style: blackPoppinsTextStyle.copyWith(
                                    fontSize: 17, fontWeight: light
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 17,
                            height: 17,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: blueDotColor
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          SizedBox(
                            width: 149,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Serat',
                                  style: blackPoppinsTextStyle.copyWith(
                                    fontSize: 17, fontWeight: medium
                                  ),
                                ),
                                Text(
                                  '${seratSize}g',
                                  style: blackPoppinsTextStyle.copyWith(
                                    fontSize: 17, fontWeight: light
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 17,
                            height: 17,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: yellowDotColor
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          SizedBox(
                            width: 149,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Protein',
                                  style: blackPoppinsTextStyle.copyWith(
                                    fontSize: 17, fontWeight: medium
                                  ),
                                ),
                                Text(
                                  '${proteinSize}g',
                                  style: blackPoppinsTextStyle.copyWith(
                                    fontSize: 17, fontWeight: light
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: CustomFormField(
                  title: 'Penyajian',
                  controller: foodServingController,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: CustomFormField(
                  title: 'Jumlah',
                  controller: foodSizeController,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: CustomFormField(
                  title: 'Waktu',
                  controller: timeController,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/home-page');
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 24),
                  width: 376,
                  height: 56,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Simpan',
                    style: whitePoppinsTextStyle.copyWith(
                      fontSize: 16, fontWeight: bold
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}