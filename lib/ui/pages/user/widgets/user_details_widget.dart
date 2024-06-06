import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:product_show_case/core/cubits/app/app_cubit.dart';
import 'package:product_show_case/core/cubits/auth/auth_cubit.dart';
import 'package:product_show_case/ui/widgets/index.dart';

class UserDetailsWidget extends StatefulWidget {
  const UserDetailsWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.nameController,
    required this.addressController,
    required this.suiteController,
    required this.zipController,
    required this.onCancel,
  }) : _formKey = formKey;

  final VoidCallback onCancel;
  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController addressController;
  final TextEditingController suiteController;
  final TextEditingController zipController;

  @override
  State<UserDetailsWidget> createState() => _UserDetailsWidgetState();
}

class _UserDetailsWidgetState extends State<UserDetailsWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Form(
        key: widget._formKey,
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            if (state is LoadedAppState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BorderCustomTextField(
                    controller: widget.emailController,
                    hintText: state.user?.user_email ?? 'email',
                    label: 'Email',
                    readOnly: true,
                  ),
                  const SizedBox(height: 20),
                  BorderCustomTextField(
                    controller: widget.nameController,
                    hintText: state.user?.user_display_name ?? 'name',
                    label: 'Full Name',
                  ),
                  const SizedBox(height: 20),
                  BorderCustomTextField(
                    controller: widget.addressController,
                    hintText: '465 Nolan Causeway Suite 079',
                    label: 'Street Address',
                  ),
                  const SizedBox(height: 20),
                  BorderCustomTextField(
                    controller: widget.suiteController,
                    hintText: 'Unit 512',
                    label: 'Apt, Suite, Bldg (optional)',
                  ),
                  const SizedBox(height: 20),
                  BorderCustomTextField(
                    controller: widget.zipController,
                    hintText: '77017',
                    label: 'Zip Code',
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                          child: CustomCancelButton(
                        onPressed: widget.onCancel,
                      )),
                      const SizedBox(width: 10),
                      CustomSecondaryButton(
                        isLoading: isLoading,
                        label: 'Save',
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });

                          await context.read<AuthCubit>().updateUser(name: widget.nameController.text);

                          setState(() {
                            isLoading = false;
                          });
                        },
                      )
                    ],
                  )
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
