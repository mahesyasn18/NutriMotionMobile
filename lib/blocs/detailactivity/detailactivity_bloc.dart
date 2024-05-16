import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nutrimotion/models/activity_detail_form_model.dart';
import 'package:nutrimotion/models/detail_activity_model.dart';
import 'package:nutrimotion/services/activity_service.dart';

part 'detailactivity_event.dart';
part 'detailactivity_state.dart';

class DetailactivityBloc
    extends Bloc<DetailactivityEvent, DetailactivityState> {
  DetailactivityBloc() : super(DetailactivityInitial()) {
    on<DetailactivityEvent>((event, emit) async {
      if (event is DetailActivityGet) {
        try {
          emit(DetailactivityLoading());
          final List<DetailActivityModel> activities =
              await ActivityService().getDetailActivity();
          emit(DetailActivitySuccess(activities));
        } catch (e) {
          emit(DetailactivityFailed(e.toString()));
        }
      }

      if (event is DetailActivitySet) {
        try {
          emit(DetailactivityLoading());
          final DetailActivityModel activity =
              await ActivityService().setDetailActivity(event.data);
          emit(DetailActivityOneSuccess(activity));
        } catch (e) {
          emit(DetailactivityFailed(e.toString()));
        }
      }
    });
  }
}
