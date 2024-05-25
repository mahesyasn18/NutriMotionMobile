import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/food/food_bloc.dart';
import 'package:nutrimotion/models/complete_food_model.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_food_tile.dart';

class RecordHeavyFoodsPage extends StatefulWidget {
  const RecordHeavyFoodsPage({super.key});

  @override
  State<RecordHeavyFoodsPage> createState() => _RecordHeavyFoodsPageState();
}

class _RecordHeavyFoodsPageState extends State<RecordHeavyFoodsPage> {
  List<CompleteFoodModel> foodData = [];
  @override
  void initState() {
    super.initState();
    context.read<FoodBloc>().add(GetUserHistoryFood());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const Text('Catat Makanan'),
        backgroundColor: whiteColor,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/browse-food');
              },
              child: Container(
                height: 56,
                width: 376,
                margin: const EdgeInsets.only(bottom: 16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: greenColor,
                ),
                child: Text(
                  'Tambah Asupan',
                  style: whitePoppinsTextStyle.copyWith(
                    fontSize: 16, fontWeight: bold
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              alignment: Alignment.centerLeft,
              child: Text(
                'Catatan Makanan',
                style: blackPoppinsTextStyle.copyWith(
                  fontSize: 17, fontWeight: semiBold
                ),
              ),
            ),
            BlocConsumer<FoodBloc,FoodState>(
              listener: (context, state){
                if (state is FoodFailed){
                  showCustomSnackbar(context, state.e);
                }
                if (state is GetUserHistoryFoodSuccess){
                  setState(() {
                    foodData = state.data;
                  });
                }
              },
              builder: (context, state){
                if (state is FoodLoading){
                  return CircularProgressIndicator(
                    color: greenColor,
                  );
                }else{
                  return Expanded(
                    child: foodData.length > 0 ? ListView.builder(
                      itemCount: foodData.length,
                      itemBuilder: (context, index) {
                        final food = foodData[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/add-food', arguments: food);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            child: CustomFoodTile(
                              foodCal: food.kalori.toString(),
                              foodSize: food.size.toString(),
                              dateTime: food.dateTime, 
                              foodName: food.foodName,
                              eatTime: food.eatTime,
                            ),
                          ),
                        );
                      },
                    ) : Center(
                      child: Text(
                        'No data found!',
                        style: blackPoppinsTextStyle.copyWith(
                          fontSize: 17, fontWeight: bold,
                        ),
                      ),
                    ),
                  );
                }
              }, 
            ),
            
          ],
        ),
      ),
    );
  }
}
