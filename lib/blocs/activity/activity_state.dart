part of 'activity_bloc.dart';

sealed class ActivityState extends Equatable {
  const ActivityState();

  @override
  List<Object> get props => [];
}

final class ActivityInitial extends ActivityState {}

final class ActivityLoading extends ActivityState {}

final class ActivityFailed extends ActivityState {
  final String e;
  const ActivityFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class ActivitySuccess extends ActivityState {
  final List<ActivityModel> activities;

  const ActivitySuccess(this.activities);

  @override
  List<Object> get props => [activities];
}

final class ActivityShowSuccess extends ActivityState {
  final ActivityModel activity;
  const ActivityShowSuccess(this.activity);
  @override
  List<Object> get props => [activity];
}
