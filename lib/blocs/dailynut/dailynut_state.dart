part of 'dailynut_bloc.dart';

sealed class DailynutState extends Equatable {
  const DailynutState();
  
  @override
  List<Object> get props => [];
}

final class DailynutInitial extends DailynutState {}

final class DailynutLoading extends DailynutState{}

final class DailynutFailed extends DailynutState{
  final String e;
  const DailynutFailed(this.e);
  @override
  // TODO: implement props
  List<Object> get props => [e];
}

final class GetUserDailyNutritionSuccess extends DailynutState{
  final DailyNutritionModel data;
  const GetUserDailyNutritionSuccess(
    this.data
  );
  @override
  // TODO: implement props
  List<Object> get props => [data];
}