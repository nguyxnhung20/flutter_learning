import 'package:flutter/material.dart';
import 'package:flutter_learning/lesson_16_assignment/custom_title_and_content_in_item.dart';
import 'package:flutter_learning/lesson_16_assignment/information_section_widgets/date_picker_display.dart';
import 'package:flutter_learning/lesson_16_assignment/information_section_widgets/email_input.dart';
import 'package:flutter_learning/lesson_16_assignment/information_section_widgets/phone_num_input.dart';
import 'package:flutter_learning/lesson_16_assignment/information_section_widgets/radio_gender_item.dart';

class InformationContent extends StatefulWidget {
  const InformationContent({
    super.key,
  });

  @override
  State<InformationContent> createState() => _InformationContentState();
}

class _InformationContentState extends State<InformationContent> {
  DateTime? selectedDate;
  late TextEditingController phoneNumController;
  late TextEditingController emailController;
  String selectedGender = "Male";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTitleAndContentInItem(
            title: "Date of birth",
            content: DatePickerDisplay(
              selectedDate: selectedDate,
              onTap: () async {
                final result = await showDatePicker(
                    context: context,
                    currentDate: selectedDate,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2024));
                if (result != null) {
                  setState(() {
                    selectedDate = result;
                  });
                }
              },
            )),
        const SizedBox(
          height: 8,
        ),
        CustomTitleAndContentInItem(
            title: "Phone Number",
            content: PhoneNumInput(phoneNumController: phoneNumController)),
        const SizedBox(
          height: 8,
        ),
        CustomTitleAndContentInItem(
            title: "Email",
            content: EmailInput(emailController: emailController)),
        const SizedBox(
          height: 8,
        ),
        CustomTitleAndContentInItem(
            title: "Gender",
            content: Row(
              children: [
                RadioGenderItem(
                  radioValue: "Male",
                  selectedValue: selectedGender,
                  onTap: () {
                    setState(() {
                      selectedGender = "Male";
                    });
                  },
                ),
                const SizedBox(
                  width: 4,
                ),
                RadioGenderItem(
                  radioValue: "Female",
                  selectedValue: selectedGender,
                  onTap: () {
                    setState(() {
                      selectedGender = "Female";
                    });
                  },
                ),
                const SizedBox(
                  width: 4,
                ),
                RadioGenderItem(
                  radioValue: "Other",
                  selectedValue: selectedGender,
                  onTap: () {
                    setState(() {
                      selectedGender = "Other";
                    });
                  },
                ),
              ],
            )),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  @override
  void dispose() {
    phoneNumController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    phoneNumController = TextEditingController();
    emailController = TextEditingController();
    super.initState();
  }
}
