part of 'water_bloc.dart';

sealed class WaterState extends Equatable {
  const WaterState();

  @override
  List<Object> get props => [];
}

final class WaterInitial extends WaterState {}

final class WaterLoading extends WaterState {}

final class WaterFailed extends WaterState {
  final String e;
  const WaterFailed(this.e);

  @override
  // TODO: implement props
  List<Object> get props => [e];
}

final class WaterSuccess extends WaterState {
  final WaterModel water;

  const WaterSuccess(this.water);

  @override
  // TODO: implement props
  List<Object> get props => [water];
}

final class WaterDrinkSuccess extends WaterState {
  final WaterModel water;

  const WaterDrinkSuccess(this.water);

  @override
  // TODO: implement props
  List<Object> get props => [water];
}
