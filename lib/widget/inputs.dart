// ignore_for_file: constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'colors.dart';

class Input extends StatelessWidget {
  final Widget child;
  final String? labelText;
  final String init;
  final Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final Function? toggleEye;
  final bool enabled;
  final Color labelColor;
  final Widget? suffix;
  final bool isPassword;
  final String hintText;
  final dynamic prefixIcon;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboard;

  const Input(
      {Key? key,
      required this.controller,
      required this.child,
      this.init = "",
      required this.labelText,
      required this.validator,
      this.isPassword = false,
      required this.onSaved,
      required this.labelColor,
      this.obscureText = false,
      required this.toggleEye,
      this.enabled = true,
      this.hintText = "",
      required this.keyboard,
      required this.onChanged,
      this.prefixIcon,
      this.suffix});

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      enabled: enabled,
      initialValue: init,
      //validator: validator,
      onSaved: onSaved!,
      builder: (FormFieldState<String> state) {
        // bool hasText = controller.text.isNotEmpty;
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (labelText != null)
            Container(
              padding: const EdgeInsets.all(2),
              child: Column(
                children: [
                  TextFormField(
                    enabled: enabled,
                    onChanged: onChanged,
                    controller: controller,
                    obscureText: obscureText,
                    keyboardType: keyboard,
                    decoration: InputDecoration(
                      prefixIcon: prefixIcon,
                      counterText: "",
                      suffixIcon: suffix,
                      hintText: hintText,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                          width: 1.0,
                        ),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          state.errorText == null
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(state.errorText!,
                      style: const TextStyle(color: Colors.red, fontSize: 12)),
                ),
        ]);
      },
    );
  }
}
