import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nutrimotion/models/daily_nutrition_model.dart';
import 'package:nutrimotion/services/dailynut_service.dart';

part 'dailynut_event.dart';
part 'dailynut_state.dart';

class DailynutBloc extends Bloc<DailynutEvent, DailynutState> {
  DailynutBloc() : super(DailynutInitial()) {
    on<DailynutEvent>((event, emit) async{
      // TODO: implement event handler
      if (event is GetUserDailyNutrition){
        try {
          emit(DailynutLoading());
          final DailyNutritionModel data = await DailynutService().getUserDailyNutrition();
          emit(GetUserDailyNutritionSuccess(data));
        } catch (e) {
          emit(DailynutFailed(e.toString()));
        }
      }
    });
  }
}
