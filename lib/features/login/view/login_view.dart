import 'package:codeedex/core/color/color_contansts.dart';
import 'package:codeedex/core/global/loading.dart';
import 'package:codeedex/features/login/viewmodel/login_viewmodel.dart';
import 'package:codeedex/features/login/widgets/cusom_tex.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.loginBg,
      body: SingleChildScrollView(
        child: Consumer<LoginController>(
          builder: (context, loginController, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "Welcome Back!",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      "assets/png/Rectangle 113.png",
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Log-in",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      CustomTextField(
                        hintText: 'Enter email id',
                        label: "E-Mail",
                        controller: emailController,
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                        hintText: 'Enter your password',
                        label: "Password",
                        controller: passwordController,
                        isPassword: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  fontSize: 14, color: AppColors.white),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          loginController.login(
                            email: emailController.text,
                            password: passwordController.text,
                            context: context,
                          );
                        },
                        child: Ink(
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColors.deepBlue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: loginController.isLoading
                                ? Loading(
                                    color: AppColors.white,
                                  )
                                : Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 14, color: AppColors.white),
                                  ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          spacing: 5,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don’t have an account?",
                              style: TextStyle(
                                  fontSize: 14, color: AppColors.white),
                            ),
                            Text(
                              "Sign-up",
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
