import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/palette/palette.dart';
import '../../style/input_style/i_input_decoration.dart';
import '../../style/text_style/i_text_style.dart';
import '../../../core/extensions/i_extensions.dart';

class ITextField extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final bool autofocus;
  final bool readOnly;
  final bool required;
  final InputDecoration decoration;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle style;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final TextCapitalization textCapitalization;
  final bool obscureText;
  final Function(String value)? onChanged;
  const ITextField({
    Key? key,
    required this.label,
    required this.onTap,
    required this.keyboardType,
    required this.autofocus,
    required this.readOnly,
    required this.decoration,
    required this.required,
    this.inputFormatters,
    required this.style,
    required this.validator,
    required this.textInputAction,
    required this.controller,
    required this.textCapitalization,
    required this.obscureText,
    required this.onChanged,
  }) : super(key: key);

  factory ITextField.primary({
    Key? key,
    required String label,
    VoidCallback? onTap,
    TextInputType? keyboardType,
    bool autofocus = false,
    bool readOnly = false,
    String? Function(String?)? validator,
    bool required = false,
    TextInputAction? textInputAction,
    Widget? suffixIcon,
    String? hintText,
    required TextEditingController? controller,
    TextCapitalization textCapitalization = TextCapitalization.words,
    Function(String value)? onChanged,
  }) {
    return ITextField(
      key: key,
      label: label,
      onTap: onTap,
      obscureText: false,
      keyboardType: keyboardType,
      autofocus: autofocus,
      readOnly: readOnly,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      decoration: IInputDecoration.primary(
          hintText: hintText,
          suffixIcon: suffixIcon,
          fillColor: onTap != null
              ? Palette.neutral10
              : readOnly
                  ? Palette.neutral40
                  : Palette.neutral10),
      required: required,
      style: IBody.regular(),
      validator: validator,
      textInputAction: textInputAction,
      controller: controller,
    );
  }

  factory ITextField.password({
    Key? key,
    required String label,
    VoidCallback? onTap,
    bool autofocus = false,
    bool readOnly = false,
    String? Function(String?)? validator,
    bool required = false,
    TextInputAction? textInputAction,
    Widget? suffixIcon,
    String? hintText,
    required TextEditingController? controller,
    TextCapitalization textCapitalization = TextCapitalization.none,
    required bool obscureText,
    Function(String value)? onChanged,
  }) {
    return ITextField(
      key: key,
      label: label,
      onTap: onTap,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: TextInputType.visiblePassword,
      autofocus: autofocus,
      readOnly: readOnly,
      textCapitalization: textCapitalization,
      decoration: IInputDecoration.primary(
          hintText: hintText,
          suffixIcon: suffixIcon,
          fillColor: onTap != null
              ? Palette.neutral10
              : readOnly
                  ? Palette.neutral40
                  : Palette.neutral10),
      required: required,
      style: IBody.regular(),
      validator: validator,
      textInputAction: textInputAction,
      controller: controller,
    );
  }

  factory ITextField.currency({
    Key? key,
    required String label,
    VoidCallback? onTap,
    bool autofocus = false,
    bool readOnly = false,
    String? Function(String?)? validator,
    bool required = false,
    TextInputAction? textInputAction,
    Widget? suffixIcon,
    String? hintText,
    required TextEditingController? controller,
    TextCapitalization textCapitalization = TextCapitalization.none,
    Function(String value)? onChanged,
  }) {
    return ITextField(
      key: key,
      label: label,
      onTap: onTap,
      keyboardType: TextInputType.number,
      autofocus: autofocus,
      readOnly: readOnly,
      obscureText: false,
      onChanged: onChanged,
      textCapitalization: textCapitalization,
      decoration: IInputDecoration.primary(
          hintText: hintText,
          suffixIcon: suffixIcon,
          fillColor: onTap != null
              ? Palette.neutral10
              : readOnly
                  ? Palette.neutral40
                  : Palette.neutral10),
      required: required,
      inputFormatters: [
        CurrencyTextInputFormatter(
            decimalDigits: 0, locale: 'id_ID', name: '', symbol: "Rp")
      ],
      style: IBody.regular(),
      validator: validator,
      textInputAction: textInputAction,
      controller: controller,
    );
  }


  factory ITextField.phoneNumber({
    Key? key,
    required String label,
    VoidCallback? onTap,
    bool autofocus = false,
    bool readOnly = false,
    String? Function(String?)? validator,
    bool required = false,
    TextInputAction? textInputAction,
    Widget? suffixIcon,
    String? hintText,
    required TextEditingController? controller,
    TextCapitalization textCapitalization = TextCapitalization.none,
    Function(String value)? onChanged,
  }) {
    return ITextField(
      key: key,
      label: label,
      onTap: onTap,
      keyboardType: TextInputType.number,
      autofocus: autofocus,
      readOnly: readOnly,
      obscureText: false,
      onChanged: onChanged,
      textCapitalization: textCapitalization,
      decoration: IInputDecoration.primary(
          hintText: hintText,
          suffixIcon: suffixIcon,
          fillColor: onTap != null
              ? Palette.neutral10
              : readOnly
                  ? Palette.neutral40
                  : Palette.neutral10),
      required: required,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      style: IBody.regular(),
      validator: validator,
      textInputAction: textInputAction,
      controller: controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(),
        context.sbHeight(size: context.padding1),
        TextFormField(
          readOnly: readOnly,
          cursorHeight: 23,
          autofocus: autofocus,
          decoration: decoration,
          inputFormatters: inputFormatters,
          style: style,
          key: key,
          validator: validator,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          controller: controller,
          textCapitalization: textCapitalization,
          onTap: onTap,
          obscureText: obscureText,
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _label() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: ICaption.demi(color: Palette.neutral100),
        ),
        required
            ? Text(
                "*",
                style: ICaption.demi(color: Palette.dangerMain),
              )
            : const SizedBox()
      ],
    );
  }
}
