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
import 'package:product_show_case/ui/widgets/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final userNameFocusNode = FocusNode();
  final userPasswordFocusNode = FocusNode();

  final _navigationService = serviceLocator<NavigationService>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          setState(() {
            isLoading = false;
          });
          _navigationService.navigateToAndClearAll(RouteTo.dashbaord);
        } else if (state is LoginFailedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          setState(() {
            isLoading = false;
          });
        }
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 80),
                  alignment: Alignment.center,
                  child: CommonImageView(
                    svgPath: ImagePath.dokanLogo,
                  ),
                ),
                Text(
                  'Sign In',
                  style: boldTextStyle.copyWith(fontSize: 25),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: usernameController,
                        hintText: 'Username',
                        icon: ImagePath.email,
                        currentFocusNode: userNameFocusNode,
                        nextFocusNode: userPasswordFocusNode,
                        validator: (value) => validateText(value ?? '', 'Please enter your username'),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        icon: ImagePath.lock,
                        isObscureText: true,
                        currentFocusNode: userPasswordFocusNode,
                        validator: (value) => validateText(value ?? '', 'Please enter your password'),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            // Handle forgot password
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: theme.hintColor),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      CustomButton(
                        buttonName: 'Login',
                        isLoading: isLoading,
                        onTap: () async {
                          if (_formKey.currentState!.validate() == true && !isLoading) {
                            setState(() {
                              isLoading = true;
                            });
                            await context
                                .read<AuthCubit>()
                                .login(password: passwordController.text, username: usernameController.text);
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
                      const SizedBox(height: 30),
                      Container(
                        child: TextButton(
                          onPressed: () {
                            _navigationService.navigateToAndClearAll(RouteTo.registrationPage);
                          },
                          child: Text(
                            'Create New Account',
                            style: regularTextStyle.copyWith(color: darkGrey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        child: TextButton(
                          onPressed: () {
                            _navigationService.navigateToAndClearAll(RouteTo.dashbaord);
                          },
                          child: Text(
                            'Login As Guest',
                            style: regularTextStyle.copyWith(color: darkGrey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
