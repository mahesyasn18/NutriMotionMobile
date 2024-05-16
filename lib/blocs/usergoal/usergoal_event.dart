part of 'usergoal_bloc.dart';

sealed class UsergoalEvent extends Equatable {
  const UsergoalEvent();

  @override
  List<Object> get props => [];
}

class UserGoalGet extends UsergoalEvent {
  const UserGoalGet();

  @override
  List<Object> get props => [];
}

class UserGoalSet extends UsergoalEvent {
  final SetGoalFormModel data;
  const UserGoalSet(this.data);

  @override
  List<Object> get props => [data];
}
