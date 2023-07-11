import 'package:bringi_app/base/base_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DropdownInputField extends StatefulWidget {
  final String dropdownlabel;
  final AsyncSnapshot<QuerySnapshot> dropdownListItem;
  final String? initialvalue;
  final Function onValueSelected;
  const DropdownInputField(
      {Key? key,
      required this.dropdownlabel,
      required this.dropdownListItem,
      required this.onValueSelected,
      this.initialvalue})
      : super(key: key);

  @override
  State<DropdownInputField> createState() => _DropdownInputFieldState();
}

class _DropdownInputFieldState extends State<DropdownInputField> {
  String? dropdownValue;

  @override
  void initState() {
    if (widget.initialvalue != null && widget.initialvalue!.isNotEmpty) {
      try {
        dropdownValue = widget.initialvalue;
      } catch (e) {
        dropdownValue = null;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey, width: 1),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String?>(
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          isExpanded: true,
          hint: Text(
            widget.dropdownlabel,
            style: TextStyle(
                fontSize: 13,
                color: HexColor.fromHex("#000000").withOpacity(.5)),
          ),
          value: dropdownValue,
          items: widget.dropdownListItem.data?.docs
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e.get("Address"),
                  child: Text(e.get("Address")),
                ),
              )
              .toList(),
          onChanged: (onSelectValue) {
            widget.onValueSelected(onSelectValue);
            setState(
              () {
                dropdownValue = onSelectValue;
              },
            );
          },
        ),
      ),
    );
  }
}
