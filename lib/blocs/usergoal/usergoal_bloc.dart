import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nutrimotion/models/goal_model.dart';
import 'package:nutrimotion/models/set_goal_form_model.dart';
import 'package:nutrimotion/services/activity_service.dart';

part 'usergoal_event.dart';
part 'usergoal_state.dart';

class UsergoalBloc extends Bloc<UsergoalEvent, UsergoalState> {
  UsergoalBloc() : super(UsergoalInitial()) {
    on<UsergoalEvent>((event, emit) async {
      if (event is UserGoalGet) {
        try {
          emit(UsergoalLoading());
          final GoalModel userGoal = await ActivityService().getUserGoal();
          emit(UsergoalSuccess(userGoal));
        } catch (e) {
          emit(UsergoalFailed(e.toString()));
        }
      }

      if (event is UserGoalSet) {
        try {
          emit(UsergoalLoading());
          final GoalModel userGoal =
              await ActivityService().setUserGoal(event.data);
          emit(UsergoalSuccess(userGoal));
        } catch (e) {
          emit(UsergoalFailed(e.toString()));
        }
      }
    });
  }
}
