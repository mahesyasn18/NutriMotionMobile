part of 'calory_bloc.dart';

sealed class CaloryEvent extends Equatable {
  const CaloryEvent();

  @override
  List<Object> get props => [];
}

class UserCalloriesGet extends CaloryEvent {
  const UserCalloriesGet();

  @override
  List<Object> get props => [];
}
