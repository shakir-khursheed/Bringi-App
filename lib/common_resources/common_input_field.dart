import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../base/base_state.dart';

class CommonInputField extends StatefulWidget {
  const CommonInputField({
    Key? key,
    required this.onTextChange,
    required this.labelText,
    required this.textInputType,
    required this.fieldValidator,
    required this.maxlength,
    required this.isAutovalidateModeon,
    this.suffixIcon,
    this.initialValue,
    this.inputFormatter,
    this.requireSuffixIcon,
    this.notSignUpfield,
    this.isOrderField,
    this.maxlines,
    this.textCapitalization,
    this.textEditingController,
    this.onError,
    this.prefixIcon,
  }) : super(key: key);
  final Function onTextChange;
  final String labelText;
  final TextInputType textInputType;
  final Function fieldValidator;
  final int maxlength;
  final bool isAutovalidateModeon;
  final List<TextInputFormatter>? inputFormatter;
  final bool? requireSuffixIcon;
  final bool? notSignUpfield;
  final bool? isOrderField;
  final int? maxlines;
  final String? initialValue;
  final TextCapitalization? textCapitalization;
  final TextEditingController? textEditingController;
  final Widget? suffixIcon;
  final bool? onError;
  final Widget? prefixIcon;
  @override
  State<CommonInputField> createState() => _CommonInputFieldState();
}

class _CommonInputFieldState extends State<CommonInputField> {
  final FocusNode _textFieldFocus = FocusNode();
  Color _color = Colors.white;
  @override
  void initState() {
    _textFieldFocus.addListener(() {
      if (_textFieldFocus.hasFocus) {
        setState(() {
          _color = Colors.white;
        });
      } else {
        setState(() {
          _color = Colors.white;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      inputFormatters: widget.inputFormatter,
      maxLength: widget.maxlength,
      maxLines: widget.maxlines ?? 1,
      initialValue: widget.initialValue,
      keyboardType: widget.textInputType,
      validator: (value) => widget.fieldValidator(value),
      onChanged: (value) => widget.onTextChange(value) ?? () {},
      autovalidateMode: (widget.isAutovalidateModeon)
          ? AutovalidateMode.onUserInteraction
          : null,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon:
            (widget.requireSuffixIcon ?? false) ? widget.suffixIcon : null,
        counterText: "",
        hintText: widget.labelText,
        filled: true,
        fillColor: (widget.notSignUpfield ?? false) ? Colors.white : _color,
        hintStyle: TextStyle(
          color: HexColor.fromHex("#808080"),
          fontSize: 13,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(.5),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
