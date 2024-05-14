part of 'detailactivity_bloc.dart';

sealed class DetailactivityEvent extends Equatable {
  const DetailactivityEvent();

  @override
  List<Object> get props => [];
}

class DetailActivityGet extends DetailactivityEvent {
  const DetailActivityGet();

  @override
  List<Object> get props => [];
}

class DetailActivitySet extends DetailactivityEvent {
  final ActivityDetailFormModel data;
  const DetailActivitySet(this.data);

  @override
  List<Object> get props => [data];
}
