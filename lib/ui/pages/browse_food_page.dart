import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/food/food_bloc.dart';
import 'package:nutrimotion/models/complete_food_model.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_food_tile.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';

class BrowseFoodPage extends StatefulWidget {
  const BrowseFoodPage({Key? key}) : super(key: key);

  @override
  _BrowseFoodPageState createState() => _BrowseFoodPageState();
}

class _BrowseFoodPageState extends State<BrowseFoodPage> {
  final searchController = TextEditingController();
  List<CompleteFoodModel> foodsData = [];
  List<CompleteFoodModel> filteredFoodData = [];

  void filterData(String query) {
    setState(() {
      filteredFoodData = foodsData
          .where((food) =>
              food.foodName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<FoodBloc>().add(GetAllFood());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const Text('Pilih Asupan Hari Ini'),
        backgroundColor: whiteColor,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: CustomSearchFormField(
                hints: 'Cari Makanan',
                controller: searchController,
                onChanged: (query) {
                  filterData(query);
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/add-new-food');
              },
              child: Container(
                height: 56,
                width: 376,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: greenColor,
                ),
                child: Text(
                  'Tambah Makanan Baru',
                  style: whitePoppinsTextStyle.copyWith(
                      fontSize: 16, fontWeight: bold),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                'Daftar Makanan dan Minuman',
                style: blackPoppinsTextStyle.copyWith(
                    fontSize: 17, fontWeight: semiBold),
              ),
            ),
            BlocConsumer<FoodBloc, FoodState>(
              listener: (context, state) {
                if (state is FoodFailed) {
                  showCustomSnackbar(context, state.e);
                }
                if (state is GetAllFoodSuccess) {
                  setState(() {
                    foodsData = state.data;
                    filteredFoodData = state.data;
                  });
                }
              },
              builder: (context, state) {
                if (state is FoodLoading) {
                  return CircularProgressIndicator(
                    color: greenColor,
                  );
                }

                return Expanded(
                  child: filteredFoodData.isNotEmpty
                      ? ListView.builder(
                          itemCount: filteredFoodData.length,
                          itemBuilder: (context, index) => Card(
                              elevation: 0,
                              key: ValueKey(filteredFoodData[index].foodName),
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/add-food',
                                        arguments: filteredFoodData[index]);
                                  },
                                  child: CustomFoodTile(
                                    foodName: filteredFoodData[index].foodName,
                                    foodCal: filteredFoodData[index]
                                        .kalori
                                        .toString(),
                                    foodSize:
                                        filteredFoodData[index].size.toString(),
                                    foodCategory: filteredFoodData[index].foodCategory,
                                    foodPicture: filteredFoodData[index].picture,
                                  ),
                                ),
                              )))
                      : Text(
                          'No result found',
                          style: blackPoppinsTextStyle.copyWith(
                              fontSize: 17, fontWeight: bold),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
