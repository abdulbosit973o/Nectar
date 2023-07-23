import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nectar/presentation/utils/app_colors.dart';
import 'package:nectar/presentation/utils/assets.dart';
import 'package:nectar/presentation/widgets/buttons/next_fab.dart';

class RegisterPhonePage extends StatefulWidget {
  const RegisterPhonePage({super.key});

  @override
  State<RegisterPhonePage> createState() => _RegisterPhonePageState();
}

class _RegisterPhonePageState extends State<RegisterPhonePage> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: NextFab(
        onPressed: () => Navigator.pushNamed(
          context,
          '/verification',
          arguments: phoneController.text,
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              PngAssets.mask,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 30,
              left: 25,
              right: 25,
              bottom: 90,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // back button
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // text
                const Text(
                  'Enter your phone number',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 30),
                // label
                const Text(
                  'Phone number',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.lightGray,
                  ),
                ),
                // intl phone field
                IntlPhoneField(
                  controller: phoneController,
                  initialCountryCode: 'US',
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.lightBorderGray,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.lightBorderGray,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
