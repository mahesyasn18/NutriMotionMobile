import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
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
    controller.dispose();
    // Cancel any ongoing barcode scanning process
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
      print("Barcode type: ${barcode.type}, value: ${barcode.value}");
      final BarcodeType type = barcode.type;
      switch (type) {
        case BarcodeType.product:
          setState(() {
            result = "${barcode.displayValue}";
          });
          break;
        default:
          setState(() {
            result = "${barcode.displayValue}";
          });
          break;
      }
    }

    if (!mounted)
      return; // Check if the widget is still mounted before calling setState
    setState(() {
      isBusy = false;
      result;
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
            Positioned(
              left: 20,
              bottom: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/product-show');
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
                            'Ultra Milk Karamel 200 Ml',
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
            ),
          if (result.isNotEmpty && result.length != 13)
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
                  'Barcode tidak valid!',
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
