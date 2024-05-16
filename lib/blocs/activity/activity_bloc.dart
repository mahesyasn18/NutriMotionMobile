import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nutrimotion/models/activity_form_model.dart';
import 'package:nutrimotion/models/activity_model.dart';
import 'package:nutrimotion/services/activity_service.dart';

part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  ActivityBloc() : super(ActivityInitial()) {
    on<ActivityEvent>((event, emit) async {
      if (event is ActivityGet) {
        try {
          emit(ActivityLoading());
          final List<ActivityModel> activities =
              await ActivityService().getActivity();
          emit(ActivitySuccess(activities));
        } catch (e) {
          emit(ActivityFailed(e.toString()));
        }
      }
      if (event is ActivityShow) {
        try {
          emit(ActivityLoading());
          final ActivityModel activities =
              await ActivityService().showActivity(event.data);
          emit(ActivityShowSuccess(activities));
        } catch (e) {
          emit(ActivityFailed(e.toString()));
        }
      }
    });
  }
}
