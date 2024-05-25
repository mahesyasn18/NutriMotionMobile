part of 'dailynut_bloc.dart';

sealed class DailynutEvent extends Equatable {
  const DailynutEvent();

  @override
  List<Object> get props => [];
}

class GetUserDailyNutrition extends DailynutEvent{
  final DateTime data;
  const GetUserDailyNutrition(
    this.data
  );

  @override
  // TODO: implement props
  List<DateTime> get props => [data];
}
