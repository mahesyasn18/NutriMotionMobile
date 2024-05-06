import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';

class AddNewFoodPage extends StatefulWidget {
  const AddNewFoodPage({super.key});

  @override
  State<AddNewFoodPage> createState() => _AddNewFoodPageState();
}

class _AddNewFoodPageState extends State<AddNewFoodPage> {
  final foodNameController = TextEditingController(text: '');
  final foodKarboController = TextEditingController(text: '');
  final foodLemakController = TextEditingController(text: '');
  final foodSeratController = TextEditingController(text: '');
  final foodProteinController = TextEditingController(text: '');
  final foodServingController = TextEditingController(text: '');
  final foodSizeController = TextEditingController(text: '');
  final foodTimeController = TextEditingController(text: '');

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
      body: Container(
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
            CustomFormField(
              title: 'Karbohidrat',
              controller: foodKarboController,
            ),
            CustomFormField(
              title: 'Lemak',
              controller: foodLemakController,
            ),
            CustomFormField(
              title: 'Serat',
              controller: foodSeratController,
            ),
            CustomFormField(
              title: 'Protein',
              controller: foodProteinController,
            ),
            CustomFormField(
              title: 'Penyajian',
              controller: foodServingController,
            ),
            CustomFormField(
              title: 'Jumlah',
              controller: foodSizeController,
            ),
            CustomFormField(
              title: 'Waktu',
              controller: foodTimeController,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/home-page');
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
  }
}
