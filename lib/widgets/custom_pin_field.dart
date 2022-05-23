import 'package:flutter/material.dart';
import "package:flutter/services.dart";
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinField extends StatelessWidget {
  final Function onComplete;
  final TextEditingController smsTED;

  const CustomPinField(
      {Key? key, required this.onComplete, required this.smsTED})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: smsTED,
      validator: (v) {
        if (v!.isEmpty) {
          return 'This field can not be empty';
        }
        if (!v.isNumericOnly) {
          return 'Only number are allowed';
        }
        if (v.length != 6) {
          return 'Please enter valid otp';
        }
        return null;
      },
      length: 6,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        activeColor: Colors.black12,
        inactiveFillColor: Colors.white,
        inactiveColor: Colors.black12,
        selectedColor: Colors.black12,
        selectedFillColor: Colors.white,
        shape: PinCodeFieldShape.circle,
        fieldHeight: 40,
        fieldWidth: 40,
        activeFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      onCompleted: (v) {
        print("Completed $v");
        onComplete.call(v);
      },
      onChanged: (value) {
        print(value);
      },
      appContext: context,
      textStyle: Theme.of(context).textTheme.bodyText1,
      keyboardType: TextInputType.number,
      keyboardAppearance: Theme.of(context).brightness == Brightness.dark
          ? Brightness.dark
          : Brightness.light,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
