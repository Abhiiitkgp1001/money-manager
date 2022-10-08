import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextInputType inputType;
  final String title;
  final int mxlength;
  final ValueChanged<String> onChanged;
  final bool prefix;
  const CustomTextField(
      {Key? key,
      this.prefix = false,
      this.mxlength = 1000,
      required this.title,
      required this.onChanged,
      this.inputType = TextInputType.text})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        setState(() {
          widget.onChanged.call(value);
        });
      },
      cursorColor: Colors.black38,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          fillColor: const Color(0xffF7F7F7),
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(12)),
          // prefixText: widget.prefix ? "+91 ":null,
          prefixIcon: widget.prefix
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
                  child: Text(
                    "+91 ",
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                )
              : null,
          hintText: widget.title,
          hintStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black38,
          ),
          counter: Container()),
      maxLength: widget.mxlength,
      style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      keyboardType: widget.inputType,
      inputFormatters: widget.inputType == TextInputType.number
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ]
          : [],
    );
  }
}
