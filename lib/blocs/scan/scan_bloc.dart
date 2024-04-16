import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nutrimotion/models/product_model.dart';
import 'package:nutrimotion/models/scan_model.dart';
import 'package:nutrimotion/models/scans_model.dart';
import 'package:nutrimotion/services/scan_service.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  ScanBloc() : super(ScanInitial()) {
    on<ScanEvent>((event, emit) async {
      if (event is ScanCheckBarcode) {
        try {
          emit(ScanLoading());
          final product =
              await ScanService().checkBarcode(event.barcode_number);
          emit(ScanSuccess(product));
        } catch (e) {
          emit(ScanFailed(e.toString()));
        }
      }

      if (event is ScanCheckProduct) {
        try {
          emit(ScanLoading());
          final product = await ScanService()
              .getProduct(event.data.barcode_number.toString());
          emit(ScanProductSuccess(product));
        } catch (e) {
          emit(ScanFailed(e.toString()));
        }
      }
    });
  }
}
