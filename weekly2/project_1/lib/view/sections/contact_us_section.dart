import 'package:flutter/material.dart';
import 'package:project_1/core/extensions/double_ext.dart';
import 'package:project_1/core/themes/font_weight.dart';
import 'package:project_1/core/extensions/form_validator_ext.dart';
import 'package:project_1/core/widgets/form_button.dart';
import 'package:project_1/core/widgets/form_input.dart';

class ContactUsSection extends StatelessWidget {
  const ContactUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController messageController = TextEditingController();

    return Form(
      key: formKey,
      child: Column(
        children: [
          const Text(
            "Contact Us",
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FW.medium,
            ),
          ),
          20.0.height,
          const Text(
            "Selamat datang di GIRD, hotel bintang lima yang menyediakan pengalaman menginap yang tak terlupakan. Tim kami yang berpengalaman dan ramah siap membantu Anda selama masa menginap Anda. Terima kasih atas kepercayaan Anda kepada GIRD!",
          ),
          20.0.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: FozFormInput(
                  controller: firstNameController,
                  label: "First name *",
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Inputan wajib diisi.";
                    }
                    return null;
                  },
                ),
              ),
              Flexible(
                flex: 1,
                child: FozFormInput(
                  controller: lastNameController,
                  label: "Last name",
                  keyboardType: TextInputType.text,
                ),
              ),
            ],
          ),
          FozFormInput(
            controller: emailController,
            label: "Email *",
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return "Inputan wajib diisi.";
              }
              if (value.isEmailRegExp()) {
                return "Email tidak valid.";
              }
              return null;
            },
          ),
          FozFormInput(
            controller: messageController,
            label: "What can we help you with?",
            isTextArea: true,
            validator: (value) {
              if (value!.isEmpty) {
                return "Inputan wajib diisi.";
              }
              return null;
            },
          ),
          10.0.height,
          Align(
            alignment: Alignment.centerRight,
            child: FozFormButton(
              label: "Submit",
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Terimakasih"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Nama : ${firstNameController.text} ${lastNameController.text}"),
                          Text("Email : ${emailController.text}"),
                          Text("Pesan : ${messageController.text}"),
                        ],
                      ),
                      actions: [
                        FozFormButton(
                          label: "Oke",
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  );
                  firstNameController.clear();
                  lastNameController.clear();
                  emailController.clear();
                  messageController.clear();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}