part of 'usergoal_bloc.dart';

sealed class UsergoalState extends Equatable {
  const UsergoalState();

  @override
  List<Object> get props => [];
}

final class UsergoalInitial extends UsergoalState {}

final class UsergoalLoading extends UsergoalState {}

final class UsergoalFailed extends UsergoalState {
  final String e;
  const UsergoalFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class UsergoalSuccess extends UsergoalState {
  final GoalModel goal;
  const UsergoalSuccess(this.goal);
  @override
  List<Object> get props => [goal];
}
