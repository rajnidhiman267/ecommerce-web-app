import 'package:ecommerce_admin_panel/features/authentication/screens/forget_password/widget/header_and_form.dart';
import 'package:ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ForgetPasswordMobileScreen extends StatelessWidget {
  const ForgetPasswordMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: HeaderAndForm(),
        ),
      ),
    );
  }
}
