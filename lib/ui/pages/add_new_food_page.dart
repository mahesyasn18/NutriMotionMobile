import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/food/food_bloc.dart';
import 'package:nutrimotion/models/eaten_food_model.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';
import 'package:nutrimotion/ui/widgets/custom_loading.dart';

class AddNewFoodPage extends StatefulWidget {
  const AddNewFoodPage({super.key});

  @override
  State<AddNewFoodPage> createState() => _AddNewFoodPageState();
}

class _AddNewFoodPageState extends State<AddNewFoodPage> {
  final foodNameController = TextEditingController(text: '');
  final foodCarbController = TextEditingController(text: '');
  final foodFatController = TextEditingController(text: '');
  final foodCalController = TextEditingController(text: '');
  final foodProteinController = TextEditingController(text: '');
  final foodSizeController = TextEditingController(text: '');
  String? foodTypeController = 'berat';
  String? foodCategoryController = 'makanan';
  TimeOfDay selectedTime = TimeOfDay.now();

  bool validate() {
    if (foodNameController.text.isEmpty ||
        foodCalController.text.isEmpty ||
        foodCarbController.text.isEmpty ||
        foodFatController.text.isEmpty ||
        foodSizeController.text.isEmpty ||
        foodProteinController.text.isEmpty||
        foodTypeController == null ||
        foodCategoryController == null)  {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text(
          'Tambah Makanan Baru',
          style: blackPoppinsTextStyle.copyWith(
              fontSize: 17, fontWeight: semiBold),
        ),
        backgroundColor: whiteColor,
      ),
      body: BlocConsumer<FoodBloc, FoodState>(
        listener: (context, state) {
          if (state is FoodFailed){
            showCustomSnackbar(context, state.e);
          }

          if (state is AddEatenFoodSuccess){
            Navigator.pushNamed(context, '/home-page');
            showCustomSuccessSnackbar(context, 'Data berhasil disimpan!');
          }
        },
        builder: (context, state) {

          if (state is FoodLoading){
            return CustomLoading();
          }

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: ListView(
              children: [
                CustomFormField(
                  title: 'Nama Makanan/Minuman',
                  controller: foodNameController,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24, bottom: 16),
                  child: Text(
                    'Informasi Nutrisi',
                    style: blackPoppinsTextStyle.copyWith(
                        fontSize: 20, fontWeight: semiBold),
                  ),
                ),
                Text(
                  'Tipe Makanan',
                  style: blackPoppinsTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                DropdownMenu(
                  width: MediaQuery.of(context).size.width - 24 * 2,
                  initialSelection: 'berat',
                  enableSearch: false,
                  onSelected: (foodType) {
                    if (foodType != null) {
                      setState(() {
                        foodTypeController = foodType;
                      });
                    }
                  },
                  dropdownMenuEntries: <DropdownMenuEntry<String>>[
                    DropdownMenuEntry(value: 'berat', label: 'Berat'),
                    DropdownMenuEntry(value: 'kemasan', label: 'Berkemasan'),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  'Jenis Makanan',
                  style: blackPoppinsTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                DropdownMenu(
                  width: MediaQuery.of(context).size.width - 24 * 2,
                  initialSelection: 'makanan',
                  enableSearch: false,
                  onSelected: (foodCategory) {
                    if (foodCategory != null) {
                      setState(() {
                        foodCategoryController = foodCategory;
                      });
                    }
                  },
                  dropdownMenuEntries: <DropdownMenuEntry<String>>[
                    DropdownMenuEntry(value: 'makanan', label: 'Makanan'),
                    DropdownMenuEntry(value: 'minuman', label: 'Minuman'),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                CustomFormField(
                  title: 'Kalori',
                  controller: foodCalController,
                  keyboardType: TextInputType.number,
                ),
                CustomFormField(
                  title: 'Karbohidrat',
                  controller: foodCarbController,
                  keyboardType: TextInputType.number,
                ),
                CustomFormField(
                  title: 'Lemak',
                  controller: foodFatController,
                  keyboardType: TextInputType.number,
                ),
                CustomFormField(
                  title: 'Protein',
                  controller: foodProteinController,
                  keyboardType: TextInputType.number,
                ),
                CustomFormField(
                  title: 'Jumlah',
                  controller: foodSizeController,
                  keyboardType: TextInputType.number,
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
                      print('tipe data: ${foodCalController.text.runtimeType}');
                      final foodCal = int.parse(foodCalController.text);
                      final foodCarb = int.parse(foodCarbController.text);
                      final foodFat = int.parse(foodFatController.text);
                      final foodProtein = int.parse(foodProteinController.text);
                      final foodSize = int.parse(foodSizeController.text);
                      context.read<FoodBloc>().add(
                        AddEatenFood(
                          EatenFoodModel(
                            foodName: foodNameController.text,
                            foodType: foodTypeController,
                            foodCategory: foodCategoryController,
                            foodCalori: foodCal,
                            foodCarb: foodCarb,
                            foodFat: foodFat,
                            foodProtein: foodProtein,
                            foodSize: foodSize,
                            eatTime: selectedTime,
                          )
                        )
                      );
                    } else {
                      showCustomSnackbar(context, 'Semua field harus diisi!');
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
          );
        },
      ),
    );
  }
}
