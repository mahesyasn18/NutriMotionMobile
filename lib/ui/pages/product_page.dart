import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  double bannerHeight =
      200; // Moved the bannerHeight variable outside the build method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Image.asset(
              'assets/back.png',
              width: 32,
            ),
          ),
          Center(
            child: Container(
              width: 250,
              height: 250,
              child: Image.asset(
                'assets/ultra.png',
              ),
            ),
          ),
          Expanded(
            // Use Expanded to make the container fill available vertical space
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(100))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Ultra Milk Karamel 200 Ml',
                        style: greenPoppinsTextStyle.copyWith(
                            fontSize: 22, fontWeight: semiBold),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Description',
                      style: blackPoppinsTextStyle.copyWith(
                          fontSize: 20, fontWeight: semiBold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Made fresh daily with our signature lettuce blend, cheddar cheese, diced tomatoes, cool, creamy avocado.',
                      style: blackPoppinsTextStyle,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Nutrition Fact Scanning',
                      style: blackPoppinsTextStyle.copyWith(
                          fontSize: 20, fontWeight: semiBold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Fat',
                          style: blackPoppinsTextStyle.copyWith(fontSize: 16),
                        ),
                        Text(
                          '3 gr',
                          style: blackPoppinsTextStyle.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Fat',
                          style: blackPoppinsTextStyle.copyWith(fontSize: 16),
                        ),
                        Text(
                          '3 gr',
                          style: blackPoppinsTextStyle.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Fat',
                          style: blackPoppinsTextStyle.copyWith(fontSize: 16),
                        ),
                        Text(
                          '3 gr',
                          style: blackPoppinsTextStyle.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Fat',
                          style: blackPoppinsTextStyle.copyWith(fontSize: 16),
                        ),
                        Text(
                          '3 gr',
                          style: blackPoppinsTextStyle.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Fat',
                          style: blackPoppinsTextStyle.copyWith(fontSize: 16),
                        ),
                        Text(
                          '3 gr',
                          style: blackPoppinsTextStyle.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(
                      height: 30,
                    ),
                    CustomFilledButton(title: 'Add to your meal plan')
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
