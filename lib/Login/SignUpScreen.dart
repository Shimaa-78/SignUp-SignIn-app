import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hawkeye/Cubit/login_cubit.dart';
import 'package:hawkeye/FrontPage.dart';

import 'package:hive/hive.dart';
import 'Widgets.dart';
import 'package:hawkeye/Login/textfieldClass.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _NameController = TextEditingController();
  final _PhoneController = TextEditingController();

  @override
  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      if (_emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        

        context.read<LoginCubit>().login(
              email: _emailController.text,
              password: _passwordController.text,
              name: _NameController.text,
              phone: _PhoneController.text,
              is_register: true,
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginErrorState && context.mounted) {
            Get.snackbar(
              "Error",
              state.msg, // Provide a default message if state.msg is null
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }

          if (state is LoginSuccessState && context.mounted) {
            Get.snackbar(
              "Success",
              "Logged in successfully",
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
            // Clear input fields on successful login
          }
        },
        child: Scaffold(
          appBar: buildAppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffFFFFFF),
                    Color(0xffFAFAFA),
                  ],
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildLogo(),
                      const SizedBox(height: 20),
                      Text(
                        "Create Your Account",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        txt: "Name",
                        controller: _NameController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Name cannot be empty";
                          }
                          final bool nameValid =
                              RegExp(r"^[a-zA-Z\s]+$").hasMatch(val);
                          if (!nameValid) {
                            return "Name can only contain letters and spaces";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        txt: "Phone",
                        controller: _PhoneController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Phone number cannot be empty";
                          }
                          final bool phoneValid =
                              RegExp(r"^\+?[0-9]{10,15}$").hasMatch(val);
                          if (!phoneValid) {
                            return "Phone number must be between 10 and 15 digits";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        txt: "Email",
                        controller: _emailController,
                        validator: (val) {
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val!);
                          if (!emailValid) {
                            return "This field should be a valid email";
                          }
                          return null; // Added return statement
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        txt: "Password",
                        isPassword: true,
                        controller: _passwordController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Password cannot be empty";
                          }
                          if (val.length < 6) {
                            return "Password should be more than 8 characters";
                          }
                          if (!RegExp(r'^(?=.*[A-Z])').hasMatch(val)) {
                            return "Password must contain at least one uppercase letter";
                          }
                          if (!RegExp(r'^(?=.*[a-z])').hasMatch(val)) {
                            return "Password must contain at least one lowercase letter";
                          }
                          if (!RegExp(r'^(?=.*\d)').hasMatch(val)) {
                            return "Password must contain at least one digit";
                          }
                          if (!RegExp(r'^(?=.*[!@#\$&*~])').hasMatch(val)) {
                            return "Password must contain at least one special character";
                          }
                          return null; // Return null if all validations pass
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        txt: "Confirm Password",
                        isPassword: true,
                        controller: _confirmPasswordController,
                        validator: (val) {
                          if (val != _passwordController.text) {
                            return "Passwords do not match";
                          }
                          return null; // Added return statement
                        },
                      ),
                      const SizedBox(height: 20),
                      BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                        if (state is LoginLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } 
                        return BuildButton(
                          "Sign Up",
                          () => _signUp(), // Pass the callback function
                        );
                      }),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "- Or Sign Up With -",
                            style: TextStyle(
                                color: Colors.grey[500], fontFamily: "Poppins"),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RowIconBuild("assets/images/google.png"),
                              RowIconBuild("assets/images/facebook.png"),
                              RowIconBuild("assets/images/twitter.png"),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
