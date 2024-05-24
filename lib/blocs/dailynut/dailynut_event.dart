part of 'dailynut_bloc.dart';

sealed class DailynutEvent extends Equatable {
  const DailynutEvent();

  @override
  List<Object> get props => [];
}

class GetUserDailyNutrition extends DailynutEvent{

}
