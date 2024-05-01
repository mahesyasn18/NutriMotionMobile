import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final bool obsecureText;
  final TextEditingController? controller;

  const CustomFormField(
      {super.key,
      required this.title,
      this.obsecureText = false,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: blackPoppinsTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          obscureText: obsecureText,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: greenColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: grayFormColor,
                width: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomSearchFormField extends StatelessWidget {
  final String hints;
  final bool obsecureText;
  final TextEditingController? controller;

  const CustomSearchFormField({
    Key? key,
    required this.hints,
    this.obsecureText = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          obscureText: obsecureText,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: greenColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: grayFormColor,
                width: 2.0,
              ),
            ),
            hintText: hints,
            prefixIcon: Padding(
              padding: EdgeInsets.all(14),
              child: Image.asset(
                'assets/ic_search.png',
                width: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
