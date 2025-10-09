import 'package:evently_app/common/Custom_Text_Filed.dart';
import 'package:evently_app/common/Validator.dart';
import 'package:evently_app/common/custom_button.dart';
import 'package:evently_app/common/language_switch.dart';
import 'package:evently_app/core/design/app_images.dart';
import 'package:evently_app/core/routes/routes.dart';

import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/provider/AuthProvider.dart';
import 'package:evently_app/screens/Login/LoginGoogle.dart';
import 'package:evently_app/screens/Login/Or_Line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final TextEditingController emailController;

  late final TextEditingController passwordController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();

    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Image.asset(AppImages.logoTitle, width: 152),
                Text(
                  AppLocalizations.of(context)!.appTitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFiled(
                    controller: emailController,
                    icon: Icons.email,
                    label: "Email",
                    validator: emailValidator,
                  ),
                  CustomTextFiled(
                    controller: passwordController,
                    icon: Icons.lock,
                    label: "Password",
                    isPassword: true,
                    validator: validatePassword,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: () {}, child: Text("Forget Password?")),
              ],
            ),
            CustomButton(
              onTap: () {
                login();
              },
              content: "Login",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dont, Have Account ?",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.register);
                  },
                  child: Text("Create Account"),
                ),
              ],
            ),
            OrLine(),
            Logingoogle(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [LanguageSwitch()],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  bool checkValidate() {
    return _formKey.currentState?.validate() ?? false;
  }

  void login() async {
    if (checkValidate() == false) {
      return;
    } else {
      AppAuthProvider provider = Provider.of<AppAuthProvider>(
        context,
        listen: false,
      );

      AuthResponse response = await provider.login(
        emailController.text,
        passwordController.text,
      );

      if (response.success) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("user login successfully")));
        Navigator.pushReplacementNamed(context, Routes.home);
      } else {
        handelError(response);
      }
    }
  }

  void handelError(AuthResponse response) {
    late String errorMassage;

    if (response.failure == AuthFailure.invalidCredentials) {
      errorMassage = "Wrong email or Password";
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(errorMassage)));
  }
}
