import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nutrimotion/models/complete_food_model.dart';
import 'package:nutrimotion/models/eaten_food_model.dart';
import 'package:nutrimotion/services/food_service.dart';
part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc() : super(FoodInitial()) {
    on<FoodEvent>((event, emit) async{
      // TODO: implement event handler
      if (event is AddEatenFood){
        try {
        
        emit(FoodLoading());
        final eatenFood = await FoodService().addEatenFood(event.data);
        emit(AddEatenFoodSuccess(eatenFood));
        
        } catch (e) {
          emit(FoodFailed(e.toString()));
        }
      }   

      if (event is GetUserEatenFood){
        try {
          emit(FoodLoading());
          final List<EatenFoodModel> eatenFoodData = await FoodService().getUserEatenFood();
          emit(GetUserEatenFoodSuccess(eatenFoodData));
        } catch (e) {
          emit(FoodFailed(e.toString()));
        }
      }

      if (event is GetAllFood){
        try {
          emit(FoodLoading());
          final List<CompleteFoodModel> foodList = await FoodService().getAllFood();
          emit(GetAllFoodSuccess(foodList));
        } catch (e) {
          emit(FoodFailed(e.toString()));
        }
      }

      if (event is GetUserHistoryFood){
        try {
          print('dicobain');
          emit(FoodLoading());
          final List<CompleteFoodModel> foodList = await FoodService().getUserHistoryFood();
          emit(GetUserHistoryFoodSuccess(foodList));
        } catch (e) {
          emit(FoodFailed(e.toString()));
        }
      }

    });
  }
}
