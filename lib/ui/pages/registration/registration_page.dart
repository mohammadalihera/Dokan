import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_show_case/core/cubits/auth/auth_cubit.dart';
import 'package:product_show_case/core/services/navigation_service.dart';
import 'package:product_show_case/core/services/service_locator.dart';
import 'package:product_show_case/core/utils/validate/validation.dart';
import 'package:product_show_case/ui/router.dart';
import 'package:product_show_case/ui/shared/image_path.dart';
import 'package:product_show_case/ui/theme/colors.dart';
import 'package:product_show_case/ui/theme/text_style.dart';
import 'package:product_show_case/ui/widgets/common_image_view.dart';
import 'package:product_show_case/ui/widgets/index.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  final _navigationService = serviceLocator<NavigationService>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegistrationSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          setState(() {
            isLoading = false;
          });
          _navigationService.navigateToAndClearAll(RouteTo.loginPage);
        } else if (state is RegistrationFailedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          setState(() {
            isLoading = false;
          });
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 50),
                        alignment: Alignment.center,
                        height: 122,
                        width: 122,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          borderRadius: const BorderRadius.all(Radius.circular(100)),
                        ),
                        child: CommonImageView(svgPath: ImagePath.user),
                      ),
                    ),
                    Positioned(
                      top: 130,
                      left: size.width * 0.56,
                      child: Container(
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: gradient,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: CommonImageView(svgPath: ImagePath.camera),
                      ),
                    )
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: nameController,
                        hintText: 'Name',
                        icon: ImagePath.user,
                        currentFocusNode: nameFocusNode,
                        nextFocusNode: emailFocusNode,
                        validator: (value) => validateText(value ?? '', 'Pleaser enter your name'),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: emailController,
                        hintText: 'Email',
                        icon: ImagePath.email,
                        currentFocusNode: emailFocusNode,
                        nextFocusNode: passwordFocusNode,
                        validator: (value) => validateEmail(value),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        icon: ImagePath.lock,
                        currentFocusNode: passwordFocusNode,
                        nextFocusNode: confirmPasswordFocusNode,
                        validator: (value) => validateText(value ?? '', "Please enter a password"),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: confirmPasswordController,
                        hintText: 'Confirm Password',
                        icon: ImagePath.lock,
                        currentFocusNode: confirmPasswordFocusNode,
                        validator: (value) => validateText(value ?? '', 'Please confirm password'),
                      ),
                      const SizedBox(height: 50),
                      CustomButton(
                        buttonName: 'Sign Up',
                        isLoading: isLoading,
                        onTap: () async {
                          if (_formKey.currentState!.validate() &&
                              passwordController.text.isNotEmpty &&
                              nameController.text.isNotEmpty &&
                              emailController.text.isNotEmpty &&
                              !isLoading) {
                            setState(() {
                              isLoading = true;
                            });

                            await context.read<AuthCubit>().registration(
                                  password: passwordController.text,
                                  name: nameController.text,
                                  email: emailController.text,
                                  confirmPass: confirmPasswordController.text,
                                );
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIconButton(
                            child: CommonImageView(svgPath: ImagePath.facebook, fit: BoxFit.contain),
                          ),
                          const SizedBox(width: 20),
                          CustomIconButton(
                            child: CommonImageView(
                              imagePath: ImagePath.google,
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have and account?',
                            style: regularTextStyle.copyWith(fontWeight: FontWeight.w400, color: darkGrey),
                          ),
                          TextButton(
                            onPressed: () {
                              _navigationService.navigateToAndClearAll(RouteTo.loginPage);
                            },
                            child: Text(
                              'Login',
                              style: regularTextStyle.copyWith(color: Colors.blue, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
