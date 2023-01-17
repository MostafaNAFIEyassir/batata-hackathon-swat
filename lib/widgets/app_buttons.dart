import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? press;
  final Color enabledBackgroundColor;
  final Color textColor;
  final Color disabledBackgroundColor;
  bool isEnabled;
  ButtonWidget({
    super.key,
    required this.text,
    required this.press,
    required this.isEnabled,
    this.enabledBackgroundColor = Colors.black,
    this.disabledBackgroundColor = Colors.grey,
    this.textColor = Colors.white,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ElevButton(),
      ),
    );
  }

  Widget ElevButton() {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
          backgroundColor: enabledBackgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          textStyle: TextStyle(
              color: textColor, fontSize: 16, fontWeight: FontWeight.w800)),
      child: Text(text, style: TextStyle(color: textColor)),
    );
  }
}
