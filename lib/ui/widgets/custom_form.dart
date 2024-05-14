import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrimotion/shared/theme.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final bool obsecureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const CustomFormField(
      {super.key,
      required this.title,
      this.obsecureText = false,
      this.keyboardType = TextInputType.text,
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
          keyboardType: keyboardType,
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
    super.key,
    required this.hints,
    this.obsecureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          obscureText: obsecureText,
          controller: controller,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              padding: const EdgeInsets.all(14),
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

class CustomFormDigitField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomFormDigitField({
    super.key,
    required this.title,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          keyboardType: TextInputType.number, // Set keyboard type to number
          inputFormatters: [
            FilteringTextInputFormatter.allow(
                RegExp(r'[0-9]')), // Allow only numbers
            FilteringTextInputFormatter.digitsOnly, // Allow only digits
            LengthLimitingTextInputFormatter(3), // Limit input to 3 characters
          ],
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.green,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: grayFormColor,
                width: 2.0,
              ),
            ),
            suffixText: 'dalam menit', // Add suffix text
            suffixStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: camel_case_types
class customEnteredFormField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final TextEditingController? controller;
  final bool enabled;

  const customEnteredFormField({
    super.key,
    required this.title,
    this.obscureText = false,
    this.controller,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          enabled: enabled,
          readOnly: true,
          initialValue: "Bermain Basket",
          obscureText: obscureText,
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
