import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nutrimotion/models/water_model.dart';
import 'package:nutrimotion/services/water_service.dart';

part 'water_event.dart';
part 'water_state.dart';

class WaterBloc extends Bloc<WaterEvent, WaterState> {
  WaterBloc() : super(WaterInitial()) {
    on<WaterEvent>((event, emit) async {
      if (event is WaterCheck) {
        try {
          emit(WaterLoading());
          final water = await WaterService().getWater();
          emit(WaterSuccess(water));
        } catch (e) {
          emit(WaterFailed(e.toString()));
        }
      }

      if (event is WaterDrink) {
        try {
          emit(WaterLoading());
          final product = await WaterService().drinkWater();
          emit(WaterSuccess(product));
        } catch (e) {
          emit(WaterFailed(e.toString()));
        }
      }
    });
  }
}
