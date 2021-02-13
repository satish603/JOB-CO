import 'package:flutter/material.dart';
import 'package:dsc/ui/widgets/responsive_ui.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData icon;
  double _width;
  double _pixelRatio;
  bool large;
  bool medium;
  final Function userTyped;
  //CustomTextInput({this.hintText, this.leading,this.userTyped,this.obscure,this.keyboard=TextInputType.text});

  CustomTextField({
    this.hint,
    this.userTyped,
    this.textEditingController,
    this.keyboardType,
    this.icon,
    this.obscureText = false,
    TextEditingController controller,
    InputDecoration decoration,
    void Function(String) onChanged,
    // Null Function(Null) onChanged,
  });

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: large ? 12 : (medium ? 10 : 8),
      child: TextField(
        onChanged: userTyped,
        onSubmitted: (value) {},
        controller: textEditingController,
        keyboardType: keyboardType,
        cursorColor: Colors.orange[200],
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.orange[200], size: 20),
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
