
import 'package:app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final String description;
  const InputText({super.key,required this.description});

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      cursorColor: Colors.purple,
      controller: controller,
      onChanged: (value) {
        setState(() {
          controller.text = value;
        });
      },
      style: const TextStyle(color: AppColors.secundaryColor,fontSize: 20,fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        hintText: widget.description,
        hintStyle: const TextStyle(color: AppColors.contentColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.secundaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.secundaryColor),
        ),
      ),
    );
  }
}