import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  List<String> titles = [
    'Gaya Hidup Sehat',
    'Makan Makanan Sehat',
    'Kontrol Konsumsi Minum'
  ];

  List<String> subtitles = [
    'Kami akan membantu kamu untuk\nmelakukan aktivitas olahraga dengan\nteratur',
    'Kami akan membantu kamu untuk\nmelakukan menjaga konsumsi\nmakanan yang dikonsumsi',
    'Kami akan membantu kamu untuk\nmenjaga konsumsi air minum untuk\nmencukupi kebutuhan sehari hari'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider(
            items: [
              Image.asset(
                'assets/OnBoarding-1.png',
                fit: BoxFit.fitHeight,
              ),
              Image.asset(
                'assets/OnBoarding-2.png',
                fit: BoxFit.fitHeight,
              ),
              Image.asset(
                'assets/OnBoarding-3.png',
                fit: BoxFit.fitHeight,
              )
            ],
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
              height: MediaQuery.sizeOf(context).height,
              viewportFraction: 1,
              enableInfiniteScroll: false,
            ),
            carouselController: carouselController,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 288,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(54),
                  topRight: Radius.circular(54),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    titles[currentIndex],
                    style: blackPoppinsTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: extraBold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Text(
                    subtitles[currentIndex],
                    style: GrayPoppinsTextStyle.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  if (currentIndex == 2)
                    CustomFilledButton(
                      width: 185,
                      height: 40,
                      title: 'Next',
                      onPressed: () {
                        Navigator.pushNamed(context, '/landing');
                      },
                    ),
                  if (currentIndex != 2)
                    Column(
                      children: [
                        CustomFilledButton(
                          width: 185,
                          height: 40,
                          title: 'Next',
                          onPressed: () {
                            carouselController.nextPage();
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextButton(
                          title: 'Skip',
                          width: 185,
                          height: 40,
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
