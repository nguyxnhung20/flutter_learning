import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/lesson_30_firestore/features/profile/presentation/custom_title_and_content_in_item.dart';
import 'package:flutter_learning/lesson_30_firestore/features/profile/presentation/information_section_widgets/date_picker_display.dart';
import 'package:flutter_learning/lesson_30_firestore/features/profile/presentation/information_section_widgets/fullname_input.dart';
import 'package:flutter_learning/lesson_30_firestore/features/profile/presentation/information_section_widgets/radio_gender_item.dart';
import 'package:flutter_learning/lesson_30_firestore/features/profile/presentation/logic_holders/bloc/account_info_bloc.dart';

class InformationContent extends StatefulWidget {
  const InformationContent({
    super.key,
  });

  @override
  State<InformationContent> createState() => _InformationContentState();
}

class _InformationContentState extends State<InformationContent> {
  late TextEditingController phoneNumController;
  late TextEditingController emailController;
  late TextEditingController fullnameController;

  @override
  Widget build(BuildContext context) {
    final canUpdate =
        BlocProvider.of<AccountInfoBloc>(context, listen: true).canUpdate;
    return Column(
      children: [
        BlocSelector<AccountInfoBloc, AccountInfoState, String?>(
          selector: (state) {
            final fullnameFromFirestore =
                state.accountDataFromFirestore?.fullName;
            final fullnameFromLocal = state.updatedLocalAccountData.fullName;
            return fullnameFromFirestore ?? fullnameFromLocal;
          },
          builder: (context, selectedValue) {
            return CustomTitleAndContentInItem(
                title: "Fullname",
                content: TextInput(
                  currentValue: selectedValue,
                  onChanged: (newValue) {
                    BlocProvider.of<AccountInfoBloc>(context)
                        .add(UpdateFullname(newName: newValue));
                  },
                  hintText: "Nhập họ và tên",
                ));
          },
        ),
        const SizedBox(
          height: 8,
        ),
        BlocSelector<AccountInfoBloc, AccountInfoState, DateTime?>(
          selector: (state) {
            final dobFromFirestore = state.accountDataFromFirestore?.dob;
            final dobFromLocal = state.updatedLocalAccountData.dob;
            return dobFromLocal ?? dobFromFirestore;
          },
          builder: (context, value) {
            return CustomTitleAndContentInItem(
                title: "Date of birth",
                content: DatePickerDisplay(
                  selectedDate: value,
                  onTap: () async {
                    final result = await showDatePicker(
                        context: context,
                        currentDate: value,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2024));
                    if (result != null) {
                      if (context.mounted) {
                        BlocProvider.of<AccountInfoBloc>(context)
                            .add(UpdateDob(newDob: result));
                      }
                    }
                  },
                ));
          },
        ),
        const SizedBox(
          height: 8,
        ),
        BlocSelector<AccountInfoBloc, AccountInfoState, String?>(
          selector: (state) {
            final phoneNumFromFirestore =
                state.accountDataFromFirestore?.phoneNumber;
            final phoneNumFromLocal = state.updatedLocalAccountData.phoneNumber;
            return phoneNumFromFirestore ?? phoneNumFromLocal;
          },
          builder: (context, selectedValue) {
            return CustomTitleAndContentInItem(
                title: "Phone Number",
                content: TextInput(
                  currentValue: selectedValue,
                  onChanged: (newValue) {
                    BlocProvider.of<AccountInfoBloc>(context)
                        .add(UpdatePhoneNum(newPhoneNum: newValue));
                  },
                  hintText: "Nhập số điện thoại",
                ));
          },
        ),
        // CustomTitleAndContentInItem(
        //     title: "Phone Number",
        //     content: PhoneNumInput(phoneNumController: phoneNumController)),
        const SizedBox(
          height: 8,
        ),
        BlocSelector<AccountInfoBloc, AccountInfoState, String?>(
          selector: (state) {
            final emailFromFirestore = state.accountDataFromFirestore?.email;
            final emailFromLocal = state.updatedLocalAccountData.email;
            return emailFromFirestore ?? emailFromLocal;
          },
          builder: (context, selectedValue) {
            return CustomTitleAndContentInItem(
                title: "Email",
                content: TextInput(
                  currentValue: selectedValue,
                  onChanged: (newValue) {
                    BlocProvider.of<AccountInfoBloc>(context)
                        .add(UpdateEmail(newEmail: newValue));
                  },
                  hintText: "Nhập email",
                ));
          },
        ),
        // CustomTitleAndContentInItem(
        //     title: "Email",
        //     content: EmailInput(emailController: emailController)),
        const SizedBox(
          height: 8,
        ),
        CustomTitleAndContentInItem(
            title: "Gender",
            content: BlocSelector<AccountInfoBloc, AccountInfoState, int?>(
              selector: (state) {
                final genderFromFirestore =
                    state.accountDataFromFirestore?.gender;
                final genderFromLocal = state.updatedLocalAccountData.gender;
                return genderFromLocal ?? genderFromFirestore;
              },
              builder: (context, selectedGender) {
                return Row(
                  children: [
                    RadioGenderItem(
                      radioValue: 1,
                      selectedValue: selectedGender,
                      onTap: () {
                        BlocProvider.of<AccountInfoBloc>(context)
                            .add(UpdateGender(newGender: 1));
                      },
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    RadioGenderItem(
                      radioValue: 2,
                      selectedValue: selectedGender,
                      onTap: () {
                        BlocProvider.of<AccountInfoBloc>(context)
                            .add(UpdateGender(newGender: 2));
                      },
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    RadioGenderItem(
                      radioValue: 3,
                      selectedValue: selectedGender,
                      onTap: () {
                        BlocProvider.of<AccountInfoBloc>(context)
                            .add(UpdateGender(newGender: 3));
                      },
                    ),
                  ],
                );
              },
            )),
        const SizedBox(
          height: 8,
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ElevatedButton(
            onPressed: canUpdate
                ? () {
                    FocusScope.of(context).unfocus();
                    BlocProvider.of<AccountInfoBloc>(context).add(SaveInfo());
                  }
                : null,
            style: ButtonStyle(
                backgroundColor:
                    canUpdate ? null : WidgetStateProperty.all(Colors.grey),
                padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 24))),
            child: const Text("SAVE"),
          ),
        )
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
    fullnameController = TextEditingController();
    super.initState();
  }
}

extension GenderExtension on int? {
  String toGenderString() {
    switch (this) {
      case 1:
        return "Male";
      case 2:
        return "Female";
      case 3:
        return "Other";
      default:
        return "Unknown";
    }
  }
}
