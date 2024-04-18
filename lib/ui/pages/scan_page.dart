import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:nutrimotion/blocs/scan/scan_bloc.dart';
import 'package:nutrimotion/models/scan_model.dart';
import 'package:nutrimotion/models/scans_model.dart';
import 'package:nutrimotion/services/scan_service.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import '../../main.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  late CameraController controller;
  CameraImage? img;
  bool isBusy = false;
  String result = "";
  String foodname = "";

  //declare scanner
  dynamic barcodeScanner;

  @override
  void initState() {
    super.initState();
    // initialize scanner
    final List<BarcodeFormat> formats = [BarcodeFormat.all];
    barcodeScanner = BarcodeScanner(formats: formats);

    // initialize the controller
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      controller.startImageStream((image) {
        if (!isBusy) {
          isBusy = true;
          img = image;
          doBarcodeScanning();
        }
      });
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    barcodeScanner.close();
    super.dispose();
  }

  //barcode scanning code here
  Future<void> doBarcodeScanning() async {
    if (!mounted) return; // Check if the widget is still mounted

    // Initialize barcode scanner
    final barcodeScanner = GoogleMlKit.vision.barcodeScanner();

    InputImage inputImage = getInputImage();
    final List<Barcode> barcodes =
        await barcodeScanner.processImage(inputImage);

    for (Barcode barcode in barcodes) {
      final String barcodeValue = "${barcode.displayValue}";
      final BarcodeType type = barcode.type;
      if (type == BarcodeType.product) {
        try {
          final ScansModel product =
              await ScanService().checkBarcode(barcodeValue);

          print(product.barcode_number.toString());
          if (product.is_barcode_exist == true) {
            // If barcode exists, update the UI accordingly
            setState(() {
              result = product.barcode_number.toString();
              foodname = product.food_name.toString();
            });
          } else {
            // If barcode does not exist, display an error message
            setState(() {
              result = 'Product Tidak tersedia';
            });
          }
        } catch (e) {
          // Handle any errors occurred during barcode checking
          setState(() {
            result = '';
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Terjadi kesalahan saat memeriksa barcode: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        setState(() {
          result = barcodeValue;
        });
      }
    }

    if (!mounted) return;
    setState(() {
      isBusy = false;
    });
  }

  InputImage getInputImage() {
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in img!.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();
    final Size imageSize = Size(img!.width.toDouble(), img!.height.toDouble());
    final camera = cameras[0];
    final imageRotation =
        InputImageRotationValue.fromRawValue(camera.sensorOrientation);

    final inputImageFormat =
        InputImageFormatValue.fromRawValue(img!.format.raw);

    final planeData = img!.planes.map(
      (Plane plane) {
        return InputImagePlaneMetadata(
          bytesPerRow: plane.bytesPerRow,
          height: plane.height,
          width: plane.width,
        );
      },
    ).toList();

    final inputImageData = InputImageData(
      size: imageSize,
      imageRotation: imageRotation!,
      inputImageFormat: inputImageFormat!,
      planeData: planeData,
    );

    final inputImage =
        InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);

    return inputImage;
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }

    // Calculate the height of the camera preview based on a 21:9 aspect ratio
    final double aspectRatio = 9 / 16;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Page'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            child: CameraPreview(controller),
          ),
          if (result.isNotEmpty && result.length == 13)
            // Check if result is not null
            if (result != "Product Tidak tersedia")
              BlocConsumer<ScanBloc, ScanState>(
                listener: (context, state) {
                  if (state is ScanFailed) {
                    showCustomSnackbar(context, state.e);
                  }
                  if (state is ScanProductSuccess) {
                    controller.stopImageStream();
                    barcodeScanner.close();
                    Navigator.pushNamed(context, '/product-show');
                  }
                },
                builder: (context, state) {
                  return Positioned(
                    left: 20,
                    bottom: 20,
                    child: GestureDetector(
                      onTap: () {
                        context.read<ScanBloc>().add(
                              ScanCheckProduct(
                                ScanModel(barcode_number: result),
                              ),
                            );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  foodname,
                                  style: blackPoppinsTextStyle.copyWith(
                                      fontSize: 18, fontWeight: semiBold),
                                ),
                                Text(
                                  'Code Product: ' + result,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Image.asset(
                              'assets/ic_ascan.png',
                              width: 40,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
          if ((result.isNotEmpty && result.length != 13) ||
              result == "Product Tidak tersedia")
            // Check if result is not empty and its length is not 12
            Positioned(
              left: 20,
              bottom: 20,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Barcode tidak sesuai!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
