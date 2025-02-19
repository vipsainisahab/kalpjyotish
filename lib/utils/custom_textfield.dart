import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_astro/utils/theme_color.dart';

Widget customTextField({
  String? label,
  String? hint,
  int maxLines = 1,
  TextEditingController? txtController,
  Function(String)? onSelect,
  bool isDropDown = false,
  bool isNumber = false,
}) {
  final List<String> issueTypes = ["Bug", "Feature Request", "Other"];
  var selectedIssueType = "".obs;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(
          label!,
          style:
              TextStyle(color: ThemeColor.textHintColor, fontFamily: 'Roboto'),
        ),
      ),
      isDropDown
          ? Obx(() => DropdownButtonFormField<String>(
                style: TextStyle(
                    fontSize: 14, color: ThemeColor.textSecondaryColor),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle:
                      TextStyle(color: ThemeColor.textHintColor, fontSize: 13),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: ThemeColor.greyColor),
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ThemeColor.greyColor),
                      borderRadius: BorderRadius.circular(8)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ThemeColor.greyColor),
                      borderRadius: BorderRadius.circular(8)),
                ),
                value: selectedIssueType.value.isEmpty
                    ? null
                    : selectedIssueType.value,
                items: issueTypes
                    .map((type) =>
                        DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (value) {
                  selectedIssueType.value = value!;
                  onSelect?.call(value);
                },
              ))
          : TextField(
              controller: txtController,
              maxLines: maxLines,
              keyboardType:
                  isNumber ? TextInputType.number : TextInputType.text,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle:
                    TextStyle(color: ThemeColor.textHintColor, fontSize: 13),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: ThemeColor.greyColor),
                    borderRadius: BorderRadius.circular(8)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ThemeColor.greyColor),
                    borderRadius: BorderRadius.circular(8)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ThemeColor.greyColor),
                    borderRadius: BorderRadius.circular(8)),
              ),
              style:
                  TextStyle(fontSize: 14, color: ThemeColor.textSecondaryColor),
              onChanged: (value) => onSelect?.call(value),
            ),
      SizedBox(height: 8),
    ],
  );
}
