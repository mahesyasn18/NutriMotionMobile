part of 'calory_bloc.dart';

sealed class CaloryState extends Equatable {
  const CaloryState();

  @override
  List<Object> get props => [];
}

final class CaloryInitial extends CaloryState {}

final class UsercalloriesLoading extends CaloryState {}

final class UsercalloriesFailed extends CaloryState {
  final String e;
  const UsercalloriesFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class UsercalloriesSuccess extends CaloryState {
  final CaloryModel calory;
  const UsercalloriesSuccess(this.calory);
  @override
  List<Object> get props => [calory];
}
