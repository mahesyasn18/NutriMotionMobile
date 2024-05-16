part of 'detailactivity_bloc.dart';

sealed class DetailactivityState extends Equatable {
  const DetailactivityState();

  @override
  List<Object> get props => [];
}

final class DetailactivityInitial extends DetailactivityState {}

final class DetailactivityLoading extends DetailactivityState {}

final class DetailactivityFailed extends DetailactivityState {
  final String e;
  const DetailactivityFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class DetailActivitySuccess extends DetailactivityState {
  final List<DetailActivityModel> activities;

  const DetailActivitySuccess(this.activities);

  @override
  List<Object> get props => [activities];
}

final class DetailActivityOneSuccess extends DetailactivityState {
  final DetailActivityModel activities;

  const DetailActivityOneSuccess(this.activities);

  @override
  List<Object> get props => [activities];
}
