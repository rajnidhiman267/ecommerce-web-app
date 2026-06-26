import 'package:ecommerce_admin_panel/common/widgets/layouts/templates/login_template.dart';
import 'package:ecommerce_admin_panel/features/authentication/screens/reset_password/widget/reset_password_widget.dart';
    import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 
class ResetPasswordDesktopTablet extends StatelessWidget {
  const ResetPasswordDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginTemplate(child: ResetPasswordWidget());
  }
}

