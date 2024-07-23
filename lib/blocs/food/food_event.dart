part of 'food_bloc.dart';

sealed class FoodEvent extends Equatable {
  const FoodEvent();

  @override
  List<Object> get props => [];
}

class AddEatenFood extends FoodEvent{
  final EatenFoodModel data;

  const AddEatenFood(
    this.data
  );

  @override
  // TODO: implement props
  List<Object> get props => [data];
}

class GetUserEatenFood extends FoodEvent{
  final DateTime data;

  const GetUserEatenFood(
    this.data
  );

  @override
  // TODO: implement props
  List<Object> get props => [data];
}

class GetAllFood extends FoodEvent{}

class GetUserHistoryFood extends FoodEvent{}