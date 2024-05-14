part of 'food_bloc.dart';

sealed class FoodState extends Equatable {
  const FoodState();
  
  @override
  List<Object> get props => [];
}

final class FoodInitial extends FoodState {}

final class FoodLoading extends FoodState {}

final class FoodFailed extends FoodState {
  final String e;
  const FoodFailed(this.e);
  @override
  // TODO: implement props
  List<Object> get props => [e];
}

final class AddEatenFoodSuccess extends FoodState {
  final bool eatenFoodStatus;
  const AddEatenFoodSuccess(this.eatenFoodStatus);

  @override
  // TODO: implement props
  List<Object> get props => [eatenFoodStatus];
}

class GetUserEatenFoodSuccess extends FoodState{
  final List<EatenFoodModel> data;
  const GetUserEatenFoodSuccess(
    this.data
  );
  @override
  // TODO: implement props
  List<EatenFoodModel> get props => data;
}