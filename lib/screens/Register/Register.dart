import 'package:evently_app/common/Custom_Text_Filed.dart';
import 'package:evently_app/common/Validator.dart';
import 'package:evently_app/common/custom_button.dart';
import 'package:evently_app/core/design/app_images.dart';
import 'package:evently_app/core/routes/routes.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/provider/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late final TextEditingController nameController;

  late final TextEditingController phoneController;

  late final TextEditingController emailController;

  late final TextEditingController passwordController;

  late final TextEditingController confirmPasswordController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFiled(
                    controller: nameController,
                    icon: Icons.person,
                    label: "Name",
                    validator: nameValidator,
                  ),
                  CustomTextFiled(
                    controller: emailController,
                    icon: Icons.email,
                    label: "Email",
                    validator: emailValidator,
                  ),
                  CustomTextFiled(
                    controller: phoneController,
                    icon: Icons.phone,
                    label: "phone",
                    validator: phoneValidator,
                  ),
                  CustomTextFiled(
                    controller: passwordController,
                    icon: Icons.lock,
                    label: "Password",
                    isPassword: true,
                    validator: validatePassword,
                  ),
                  CustomTextFiled(
                    controller: confirmPasswordController,
                    icon: Icons.lock,
                    label: "Re Password",
                    isPassword: true,
                    validator: (password) {
                      if (password == null || password.isEmpty) {
                        return 'Please re-enter password';
                      } else if (password != passwordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),
                  CustomButton(
                    onTap: () {
                      createAccount();
                    },
                    content: "Create Account",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "I, Have Account ?",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.login);
                        },
                        child: Text("login"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool checkValidate() {
    return _formKey.currentState?.validate() ?? false;
  }

  void createAccount() async {
    if (checkValidate() == false) {
      return;
    } else {
      AppAuthProvider provider = Provider.of<AppAuthProvider>(
        context,
        listen: false,
      );

      AuthResponse response = await provider.register(
        emailController.text,
        passwordController.text,
        phoneController.text,
        nameController.text,
      );

      if (response.success) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("user Register successfully")));
        Navigator.pushReplacementNamed(context, Routes.home);
      } else {
        handelError(response);
      }
    }
  }

  void handelError(AuthResponse response) {
    String errorMassage;

    if (response.failure == AuthFailure.weakPassword) {
      errorMassage = "weak password";
    } else if (response.failure == AuthFailure.emailAlreadyUsed) {
      errorMassage = "email already in use";
    } else {
      errorMassage = "something went wrong";
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(errorMassage)));
  }
}
