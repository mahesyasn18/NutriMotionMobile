part of 'activity_bloc.dart';

sealed class ActivityEvent extends Equatable {
  const ActivityEvent();

  @override
  List<Object> get props => [];
}

class ActivityGet extends ActivityEvent {
  const ActivityGet();

  @override
  List<Object> get props => [];
}

class ActivityShow extends ActivityEvent {
  final ActivityFormModel data;
  const ActivityShow(this.data);

  @override
  List<Object> get props => [data];
}
