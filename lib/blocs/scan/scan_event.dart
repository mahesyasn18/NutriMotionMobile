part of 'scan_bloc.dart';

sealed class ScanEvent extends Equatable {
  const ScanEvent();

  @override
  List<Object> get props => [];
}

class ScanCheckBarcode extends ScanEvent {
  final String barcode_number;
  const ScanCheckBarcode(this.barcode_number);

  @override
  // TODO: implement props
  List<Object> get props => [barcode_number];
}

class ScanCheckProduct extends ScanEvent {
  final ScanModel data;
  const ScanCheckProduct(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data];
}
