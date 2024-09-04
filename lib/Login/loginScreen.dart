import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawkeye/Cubit/login_cubit.dart';
import 'package:hawkeye/Login/SignUpScreen.dart';
import 'package:hawkeye/Login/textfieldClass.dart';
import 'Widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Form key and controllers`
    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    // Bloc listener to handle login states
     return
    BlocListener<LoginCubit, LoginState>(
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
      child:
     Scaffold(
        appBar: buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
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
                    buildLogo(), // Logo widget
                    const SizedBox(height: 20),
                    Text(
                      "Login To Your Account",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Email input field
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
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Password input field
                    CustomTextField(
                      txt: "Password",
                      isPassword: true,
                      controller: _passwordController,
                    ),
                    const SizedBox(height: 20),
                    // BlocBuilder for handling loading state
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        if (state is LoginLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } 

                        
                          return BuildButton("Login", () {
                            if (_formKey.currentState!.validate()) {
                              // Trigger the login process using Bloc
                              context.read<LoginCubit>().login(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  );
                            }
                          });
                        
                      },
                    ),
                    const SizedBox(height: 20),
                    // Social login and sign up section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "- Or Sign In With -",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontFamily: "Poppins",
                          ),
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
                        const SizedBox(height: 40),
                        // Navigation to SignUp screen
                        NavigateToSignup(() {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SignUp(),
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
       ),
    );
  }
}
