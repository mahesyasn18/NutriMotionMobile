import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/food/food_bloc.dart';
import 'package:nutrimotion/models/complete_food_model.dart';
import 'package:nutrimotion/models/eaten_food_model.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';
import 'package:nutrimotion/ui/widgets/custom_loading.dart';

class AddFoodPage extends StatefulWidget {
  const AddFoodPage({super.key});

  @override
  State<AddFoodPage> createState() => _AddFoodPageState();
}

class _AddFoodPageState extends State<AddFoodPage> {
  final foodNameController = TextEditingController(text: '');
  // final foodServingController = TextEditingController(text: '');
  final foodSizeController = TextEditingController(text: '');
  TimeOfDay selectedTime = TimeOfDay.now();

  bool validate() {
    if (foodNameController.text.isEmpty || foodSizeController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final CompleteFoodModel foodData =
        ModalRoute.of(context)!.settings.arguments as CompleteFoodModel;
    foodNameController.text = foodData.foodName;
    foodSizeController.text = foodData.size.toString();
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: const Text('Tambah Asupan'),
          backgroundColor: whiteColor,
          shadowColor: whiteColor,
        ),
        body: BlocConsumer<FoodBloc, FoodState>(
          listener: (context, state) {
            if (state is FoodFailed){
              showCustomSnackbar(context, state.e);
            }
            if (state is AddEatenFoodSuccess){
              Navigator.pushNamedAndRemoveUntil(context, '/home-page', (Route<dynamic> route) => false,);
              showCustomSuccessSnackbar(context, 'Data berhasil disimpan');
            }
          },
          builder: (context, state) {
            if (state is FoodLoading){
              return CustomLoading();
            }
            return SingleChildScrollView(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
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
                                fontSize: 17, fontWeight: semiBold),
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
                                      color: blueDotColor),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                SizedBox(
                                  width: 149,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Calori',
                                        style: blackPoppinsTextStyle.copyWith(
                                            fontSize: 17, fontWeight: medium),
                                      ),
                                      Text(
                                        '${foodData.kalori} cal',
                                        style: blackPoppinsTextStyle.copyWith(
                                            fontSize: 17, fontWeight: light),
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
                                      color: redDotColor),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                SizedBox(
                                  width: 149,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Carbohydrates',
                                        style: blackPoppinsTextStyle.copyWith(
                                            fontSize: 17, fontWeight: medium),
                                      ),
                                      Text(
                                        '${foodData.karbohidratTotal}g',
                                        style: blackPoppinsTextStyle.copyWith(
                                            fontSize: 17, fontWeight: light),
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
                                      color: greenDotColor),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                SizedBox(
                                  width: 149,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Fat',
                                        style: blackPoppinsTextStyle.copyWith(
                                            fontSize: 17, fontWeight: medium),
                                      ),
                                      Text(
                                        '${foodData.lemaktTotal}g',
                                        style: blackPoppinsTextStyle.copyWith(
                                            fontSize: 17, fontWeight: light),
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
                                      color: yellowDotColor),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                SizedBox(
                                  width: 149,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Protein',
                                        style: blackPoppinsTextStyle.copyWith(
                                            fontSize: 17, fontWeight: medium),
                                      ),
                                      Text(
                                        '${foodData.protein}g',
                                        style: blackPoppinsTextStyle.copyWith(
                                            fontSize: 17, fontWeight: light),
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
                    // Container(
                    //   margin: const EdgeInsets.symmetric(vertical: 12),
                    //   child: CustomFormField(
                    //     title: 'Penyajian',
                    //     controller: foodServingController,
                    //   ),
                    // ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      child: CustomFormField(
                        title: 'Jumlah',
                        controller: foodSizeController,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "${selectedTime.hour}:${selectedTime.minute}",
                          style: blackPoppinsTextStyle.copyWith(
                              fontWeight: semiBold, fontSize: 18),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              final TimeOfDay? timeOfDay = await showTimePicker(
                                context: context,
                                initialTime: selectedTime,
                                initialEntryMode: TimePickerEntryMode.dial,
                              );
                              if (timeOfDay != null) {
                                setState(() {
                                  selectedTime = timeOfDay;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: greenColor,
                                backgroundColor: whiteColor,
                                side: BorderSide(color: greenColor)),
                            child: const Text('Pilih Waktu'),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        if (validate()) {
                          context
                              .read<FoodBloc>()
                              .add(AddEatenFood(EatenFoodModel(
                                foodName: foodNameController.text,
                                foodType: foodData.foodType,
                                foodCategory: foodData.foodCategory,
                                foodCalori: foodData.kalori,
                                foodCarb: foodData.karbohidratTotal,
                                foodFat: foodData.lemaktTotal,
                                foodProtein: foodData.protein,
                                foodSize: foodData.size,
                                eatTime: selectedTime,
                              )));
                        } else {
                          showCustomSnackbar(
                              context, 'Semua field harus diisi');
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 24),
                        width: 376,
                        height: 56,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text('Simpan',
                            style: whitePoppinsTextStyle.copyWith(
                                fontSize: 16, fontWeight: bold)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
