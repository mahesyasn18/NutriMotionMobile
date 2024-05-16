import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nutrimotion/models/calory_model.dart';
import 'package:nutrimotion/services/activity_service.dart';

part 'calory_event.dart';
part 'calory_state.dart';

class CaloryBloc extends Bloc<CaloryEvent, CaloryState> {
  CaloryBloc() : super(CaloryInitial()) {
    on<CaloryEvent>((event, emit) async {
      if (event is UserCalloriesGet) {
        try {
          emit(UsercalloriesLoading());
          final CaloryModel cal = await ActivityService().getCallories();
          emit(UsercalloriesSuccess(cal));
        } catch (e) {
          emit(UsercalloriesFailed(e.toString()));
        }
      }
    });
  }
}
