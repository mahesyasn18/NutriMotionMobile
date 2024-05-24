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

class CustomFormNumField extends StatelessWidget {
  final String title;
  final bool obsecureText;
  final TextEditingController? controller;

  const CustomFormNumField(
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
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(3),
          ],
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

class CustomFormDigitField extends StatefulWidget {
  final String title;
  final bool obscureText;
  final TextEditingController? controller;
  final void Function(int)?
      onDurationChanged; // Modify the callback type to accept an int

  const CustomFormDigitField({
    Key? key,
    required this.title,
    this.obscureText = false,
    this.controller,
    this.onDurationChanged,
  }) : super(key: key);

  @override
  _CustomFormDigitFieldState createState() => _CustomFormDigitFieldState();
}

class _CustomFormDigitFieldState extends State<CustomFormDigitField> {
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          obscureText: widget.obscureText,
          controller: widget.controller,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(3),
          ],
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: _errorMessage != null ? Colors.red : grayFormColor,
                width: 2.0,
              ),
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
                color: _errorMessage != null ? Colors.red : grayFormColor,
                width: 2.0,
              ),
            ),
            suffixText: 'dalam menit',
            suffixStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
          onChanged: (value) {
            setState(() {
              if (value.isNotEmpty) {
                try {
                  int intValue = int.parse(value);
                  if (intValue > 180) {
                    _errorMessage = 'Tidak boleh lebih dari 180 menit';
                  } else {
                    _errorMessage = null;
                  }
                  if (value.isNotEmpty) {
                    widget.onDurationChanged?.call(intValue);
                  } else {
                    widget.onDurationChanged?.call(0);
                  }
                } catch (e) {
                  _errorMessage = 'Input tidak valid';
                }
              } else {
                int intValue = 0;
                widget.onDurationChanged?.call(intValue);
                _errorMessage = null;
              }
            });
          },
        ),
        if (_errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              _errorMessage!,
              style: TextStyle(color: Colors.red),
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
          readOnly: true,
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
