part of 'water_bloc.dart';

sealed class WaterEvent extends Equatable {
  const WaterEvent();

  @override
  List<Object> get props => [];
}

class WaterCheck extends WaterEvent {
  const WaterCheck();

  @override
  List<Object> get props => [];
}

class WaterDrink extends WaterEvent {
  const WaterDrink();

  @override
  List<Object> get props => [];
}
