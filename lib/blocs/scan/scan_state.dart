part of 'scan_bloc.dart';

sealed class ScanState extends Equatable {
  const ScanState();

  @override
  List<Object> get props => [];
}

final class ScanInitial extends ScanState {}

final class ScanLoading extends ScanState {}

final class ScanFailed extends ScanState {
  final String e;
  const ScanFailed(this.e);

  @override
  // TODO: implement props
  List<Object> get props => [e];
}

final class ScanProductSuccess extends ScanState {
  final ProductModel product;
  const ScanProductSuccess(this.product);
  @override
  // TODO: implement props
  List<Object> get props => [product];
}

final class ScanSuccess extends ScanState {
  final ScansModel product;
  const ScanSuccess(this.product);

  @override
  // TODO: implement props
  List<Object> get props => [product];
}
