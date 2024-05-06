import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';

class WaterPage extends StatefulWidget {
  const WaterPage({Key? key}) : super(key: key);

  @override
  _WaterPageState createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterPage> {
  int _consumedGlassCount = 0;
  final List<bool> _glassStatus = List.generate(8, (index) => true);

  void _emptyGlass(int index) {
    if (_glassStatus[index]) {
      setState(() {
        _glassStatus[index] = false;
        _consumedGlassCount++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Catatan Konsumsi Air Putih Harian',
                style: blackPoppinsTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(83),
                  border: Border.all(color: greenColor),
                ),
                width: 166,
                height: 166,
                child: Center(
                  child: Text(
                    '$_consumedGlassCount Gelas',
                    style: greenPoppinsTextStyle.copyWith(
                      fontSize: 17,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                4,
                (index) => GestureDetector(
                  onTap: () {
                    _emptyGlass(index);
                  },
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: 80,
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              _glassStatus[index]
                                  ? 'assets/ic_gelas_penuh.png'
                                  : 'assets/ic_gelas_kosong.png',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Gelas ${index + 1}',
                        style: greenPoppinsTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                4,
                (index) => GestureDetector(
                  onTap: () {
                    _emptyGlass(index + 4);
                  },
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: 80,
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              _glassStatus[index + 4]
                                  ? 'assets/ic_gelas_penuh.png'
                                  : 'assets/ic_gelas_kosong.png',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Gelas ${index + 5}',
                        style: greenPoppinsTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
